// Copyright (c) Absorb Plus contributors.
// The synthetic interface approach follows tailscale.com/feature/androidbin
// (BSD-3-Clause, Tailscale Inc & contributors), which registers itself only in
// non-cgo builds; this library is a cgo build, so it registers its own getter.

//go:build android

package main

import (
	"errors"
	"net"
	"net/netip"
	"time"

	"tailscale.com/net/netmon"
)

// Android denies app UIDs the NETLINK_ROUTE socket, so Go's net.Interfaces
// fails and netmon would think the device is offline. Fall back to one made-up
// interface carrying the addresses the kernel picks for outbound sockets.
func init() {
	netmon.RegisterInterfaceGetter(func() ([]netmon.Interface, error) {
		if ifs, err := net.Interfaces(); err == nil {
			ret := make([]netmon.Interface, len(ifs))
			for i := range ifs {
				ret[i].Interface = &ifs[i]
			}
			return ret, nil
		}
		return syntheticInterfaces()
	})
}

func syntheticInterfaces() ([]netmon.Interface, error) {
	var addrs []net.Addr
	if ip, ok := outboundIP("udp4", "8.8.8.8:53"); ok {
		addrs = append(addrs, &net.IPNet{IP: ip.AsSlice(), Mask: net.CIDRMask(32, 32)})
	}
	if ip, ok := outboundIP("udp6", "[2001:4860:4860::8888]:53"); ok {
		addrs = append(addrs, &net.IPNet{IP: ip.AsSlice(), Mask: net.CIDRMask(128, 128)})
	}
	if len(addrs) == 0 {
		return nil, errors.New("no outbound routes")
	}
	return []netmon.Interface{{
		Interface: &net.Interface{
			MTU:   1500,
			Name:  "android",
			Flags: net.FlagUp | net.FlagRunning,
		},
		AltAddrs: addrs,
	}}, nil
}

// outboundIP dials UDP (which sends nothing) to learn the source address.
func outboundIP(network, addr string) (netip.Addr, bool) {
	d := net.Dialer{Timeout: 2 * time.Second}
	c, err := d.Dial(network, addr)
	if err != nil {
		return netip.Addr{}, false
	}
	defer c.Close()
	ua, ok := c.LocalAddr().(*net.UDPAddr)
	if !ok {
		return netip.Addr{}, false
	}
	ip, ok := netip.AddrFromSlice(ua.IP)
	if !ok {
		return netip.Addr{}, false
	}
	ip = ip.Unmap()
	if ip.IsLoopback() || ip.IsUnspecified() {
		return netip.Addr{}, false
	}
	return ip, true
}
