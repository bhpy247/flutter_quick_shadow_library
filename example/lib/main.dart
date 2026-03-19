import 'package:flutter/material.dart';
import 'package:inner_shadow/innershadowpackage.dart';

void main() {
  runApp(const InnerShadowExampleApp());
}

class InnerShadowExampleApp extends StatelessWidget {
  const InnerShadowExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InnerShadow Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFE0E5EC),
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xFFE0E5EC),
          title: const Text('InnerShadow Demo'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Basic'),
              Tab(text: 'Neumorphism'),
              Tab(text: 'Buttons'),
              Tab(text: 'Cards'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [BasicShadowDemo(), NeumorphismDemo(), ButtonsDemo(), CardsDemo()],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// TAB 1: Basic shadows
// ─────────────────────────────────────────────
class BasicShadowDemo extends StatelessWidget {
  const BasicShadowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Top-Left Shadow'),
          const SizedBox(height: 16),
          InnerShadow(
            shadows: const [
              Shadow(
                color: Color(0x66000000),
                blurRadius: 12,
                offset: Offset(6, 6),
              ),
            ],
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E5EC),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const _SectionTitle('Bottom-Right Shadow'),
          const SizedBox(height: 16),
          InnerShadow(
            shadows: const [
              Shadow(color: Color(0x66000000), blurRadius: 12, offset: Offset(-6, -6)),
            ],
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E5EC),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const _SectionTitle('Circular Shape'),
          const SizedBox(height: 16),
          InnerShadow(
            shadows: const [Shadow(color: Color(0x66000000), blurRadius: 16, offset: Offset(0, 0))],
            borderRadius: BorderRadius.circular(75),
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(color: Color(0xFFE0E5EC), shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// TAB 2: Neumorphism
// ─────────────────────────────────────────────
class NeumorphismDemo extends StatelessWidget {
  const NeumorphismDemo({super.key});

  static const bgColor = Color(0xFFE0E5EC);
  static const darkShadow = Color(0xFFA3B1C6);
  static const lightShadow = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Pressed / Inset Effect'),
          const SizedBox(height: 16),
          // Neumorphism "pressed" button using inner shadow
          InnerShadow(
            shadows: const [
              Shadow(color: darkShadow, blurRadius: 10, offset: Offset(5, 5)),
              Shadow(color: lightShadow, blurRadius: 10, offset: Offset(-5, -5)),
            ],
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 160,
              height: 60,
              decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              child: const Text(
                'PRESSED',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6E7F9B),
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const _SectionTitle('Inset Circle'),
          const SizedBox(height: 16),
          InnerShadow(
            shadows: const [
              Shadow(color: darkShadow, blurRadius: 14, offset: Offset(6, 6)),
              Shadow(color: lightShadow, blurRadius: 14, offset: Offset(-6, -6)),
            ],
            borderRadius: BorderRadius.circular(80),
            child: Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(color: bgColor, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: const Icon(Icons.play_arrow_rounded, size: 50, color: Color(0xFF6E7F9B)),
            ),
          ),
          const SizedBox(height: 32),
          const _SectionTitle('Inset Text Field'),
          const SizedBox(height: 16),
          InnerShadow(
            shadows: const [
              Shadow(color: darkShadow, blurRadius: 8, offset: Offset(4, 4)),
              Shadow(color: lightShadow, blurRadius: 8, offset: Offset(-4, -4)),
            ],
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: const Text('Search...', style: TextStyle(color: Color(0xFF9AA5B4))),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// TAB 3: Buttons
// ─────────────────────────────────────────────
class ButtonsDemo extends StatefulWidget {
  const ButtonsDemo({super.key});

  @override
  State<ButtonsDemo> createState() => _ButtonsDemoState();
}

class _ButtonsDemoState extends State<ButtonsDemo> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Tap to Toggle Pressed State'),
          const SizedBox(height: 24),
          GestureDetector(
            onTapDown: (_) => setState(() => _isPressed = true),
            onTapUp: (_) => setState(() => _isPressed = false),
            onTapCancel: () => setState(() => _isPressed = false),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: _isPressed
                  ? InnerShadow(
                      key: const ValueKey('pressed'),
                      shadows: const [
                        Shadow(color: Color(0x66000000), blurRadius: 10, offset: Offset(4, 4)),
                      ],
                      borderRadius: BorderRadius.circular(14),
                      child: const _ButtonBox(label: 'PRESSED ✓'),
                    )
                  : Container(
                      key: const ValueKey('normal'),
                      width: 160,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E5EC),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(color: Color(0xFFA3B1C6), blurRadius: 10, offset: Offset(5, 5)),
                          BoxShadow(
                            color: Color(0xFFFFFFFF),
                            blurRadius: 10,
                            offset: Offset(-5, -5),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'TAP ME',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6E7F9B),
                          letterSpacing: 2,
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 40),
          const _SectionTitle('InnerShadowContainer Shorthand'),
          const SizedBox(height: 16),
          InnerShadowContainer(
            width: 200,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E5EC),
              borderRadius: BorderRadius.circular(14),
            ),
            shadows: const [Shadow(color: Color(0x55000000), blurRadius: 10, offset: Offset(4, 4))],
            alignment: Alignment.center,
            child: const Text('InnerShadowContainer', style: TextStyle(color: Color(0xFF6E7F9B))),
          ),
        ],
      ),
    );
  }
}

class _ButtonBox extends StatelessWidget {
  final String label;

  const _ButtonBox({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF6E7F9B),
          letterSpacing: 2,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// TAB 4: Cards
// ─────────────────────────────────────────────
class CardsDemo extends StatelessWidget {
  const CardsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle('Inset Card'),
          const SizedBox(height: 16),
          InnerShadow(
            shadows: const [
              Shadow(color: Color(0x55000000), blurRadius: 14, offset: Offset(6, 6)),
              Shadow(color: Color(0xAAFFFFFF), blurRadius: 14, offset: Offset(-6, -6)),
            ],
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E5EC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inner Shadow Card',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A5568),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This card uses InnerShadow to create an inset/pressed effect. Works with any BorderRadius.',
                    style: TextStyle(color: Color(0xFF718096)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          const _SectionTitle('Stats Widget'),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: _StatCard(value: '128', label: 'Likes'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _StatCard(value: '4.9', label: 'Rating'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _StatCard(value: '2k', label: 'Downloads'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: const [
        Shadow(color: Color(0x44000000), blurRadius: 10, offset: Offset(4, 4)),
        Shadow(color: Color(0x88FFFFFF), blurRadius: 10, offset: Offset(-4, -4)),
      ],
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFE0E5EC),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A5568),
              ),
            ),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF9AA5B4))),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Shared
// ─────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFF4A5568),
        letterSpacing: 0.5,
      ),
    );
  }
}
