/// Absorb Plus: the pixel width to decode a cover at, so it is held in memory
/// at the size it is drawn instead of the 1200 px it was downloaded at.
///
/// Uses the longer side of the box: a square cover filling a tall box
/// (BoxFit.cover) is drawn as wide as the box is tall. Rounds up to a
/// multiple of [step] so resizing the window doesn't decode it again for
/// every pixel. Rounding up only ever gives more pixels than are drawn, so
/// the cover looks the same; Flutter never upscales past the source. Null
/// (decode at full size) when the box has no finite size.
int? coverDecodeWidth(
  double width,
  double height,
  double devicePixelRatio, {
  int step = 64,
}) {
  final side = width > height ? width : height;
  if (!side.isFinite || !devicePixelRatio.isFinite) return null;
  final px = (side * devicePixelRatio).ceil();
  if (px <= 0) return step;
  return ((px + step - 1) ~/ step) * step;
}
