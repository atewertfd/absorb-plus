import 'package:flutter/widgets.dart';

import '../../services/login_design_store.dart';
import 'card_login_design.dart';
import 'glass_steps_login_design.dart';
import 'login_form.dart';
import 'split_login_design.dart';
import 'steps_login_design.dart';

export 'login_form.dart';

/// The layout for [design] around the sign-in screen's [form], or null for
/// the classic layout (the screen then builds its own).
Widget? buildLoginDesign(LoginDesign design, LoginForm form) =>
    switch (design) {
      LoginDesign.classic => null,
      LoginDesign.card => CardLoginDesign(form: form),
      LoginDesign.steps => StepsLoginDesign(form: form),
      LoginDesign.stepsGlass => GlassStepsLoginDesign(form: form),
      LoginDesign.stepsDesktop => DesktopStepsLoginDesign(form: form),
      LoginDesign.stepsHero => HeroStepsLoginDesign(form: form),
      LoginDesign.split => SplitLoginDesign(form: form),
    };
