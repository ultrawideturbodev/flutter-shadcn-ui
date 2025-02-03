import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum PlagroundButtonStyle {
  primary,
  secondary,
  destructive,
  outline,
  ghost,
  link,
  icon,
  textIcon,
  loading,
  gradientShadow,
}

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key, required this.style});

  final PlagroundButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: switch (style) {
          PlagroundButtonStyle.primary => TurboButton(
              child: const Text('Primary'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.secondary => TurboButton.secondary(
              child: const Text('Secondary'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.destructive => TurboButton.destructive(
              child: const Text('Destructive'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.outline => TurboButton.outline(
              child: const Text('Outline'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.ghost => TurboButton.ghost(
              child: const Text('Ghost'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.link => TurboButton.link(
              child: const Text('Link'),
              onPressed: () {},
            ),
          PlagroundButtonStyle.icon => TurboButton.outline(
              icon: const Icon(LucideIcons.chevronRight),
              onPressed: () {},
            ),
          PlagroundButtonStyle.textIcon => TurboButton(
              onPressed: () {},
              icon: const Icon(LucideIcons.mail),
              child: const Text('Login with Email'),
            ),
          PlagroundButtonStyle.loading => TurboButton(
              onPressed: () {},
              icon: SizedBox.square(
                dimension: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: TurboTheme.of(context).colorScheme.primaryForeground,
                ),
              ),
              child: const Text('Please wait'),
            ),
          PlagroundButtonStyle.gradientShadow => TurboButton(
              onPressed: () {},
              gradient: const LinearGradient(colors: [
                Colors.cyan,
                Colors.indigo,
              ]),
              shadows: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: .4),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
              child: const Text('Gradient with Shadow'),
            ),
        },
      ),
    );
  }
}
