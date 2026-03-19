# quick_shadow

A Flutter package that adds **inner shadow** support to any widget — `Container`, `Button`, `Card`, and more.

Flutter's built-in `BoxDecoration` only supports **outer** shadows. This package fills that gap with a simple, performant `InnerShadow` widget using a Canvas-based even-odd path technique.

---

## Features

- ✅ Inner shadow on **any widget**
- ✅ Supports **BorderRadius** (rounded corners & circles)
- ✅ **Multiple shadows** on a single widget
- ✅ Perfect for **Neumorphism UI**
- ✅ `InnerShadowContainer` convenience widget
- ✅ Zero external dependencies (pure Flutter)

---

## Getting Started

Add to your `pubspec.yaml`:

```yaml
dependencies:
  inner_shadow: ^0.0.1
```

Run:

```bash
flutter pub get
```

Then import in your Dart file:

```dart
import 'package:inner_shadow/inner_shadow.dart';
```

---

## Usage

### Basic Inner Shadow

```dart
InnerShadow(
  shadows: [
    Shadow(
      color: Colors.black38,
      blurRadius: 10,
      offset: Offset(4, 4),
    ),
  ],
  borderRadius: BorderRadius.circular(16),
  child: Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      color: Color(0xFFE0E0E0),
      borderRadius: BorderRadius.circular(16),
    ),
  ),
)
```

---

### Neumorphism — Pressed Effect

```dart
InnerShadow(
  shadows: [
    Shadow(color: Colors.black26, blurRadius: 12, offset: Offset(6, 6)),
    Shadow(color: Colors.white70, blurRadius: 12, offset: Offset(-6, -6)),
  ],
  borderRadius: BorderRadius.circular(20),
  child: Container(
    width: 160,
    height: 60,
    decoration: BoxDecoration(
      color: Color(0xFFE0E5EC),
      borderRadius: BorderRadius.circular(20),
    ),
    alignment: Alignment.center,
    child: Text('PRESSED'),
  ),
)
```

---

### InnerShadowContainer (Shorthand)

```dart
InnerShadowContainer(
  width: 200,
  height: 60,
  decoration: BoxDecoration(
    color: Color(0xFFE0E5EC),
    borderRadius: BorderRadius.circular(14),
  ),
  shadows: [
    Shadow(
      color: Colors.black26,
      blurRadius: 10,
      offset: Offset(4, 4),
    ),
  ],
  alignment: Alignment.center,
  child: Text('Hello Inner Shadow'),
)
```

---

### Circular Shape

```dart
InnerShadow(
  shadows: [
    Shadow(color: Colors.black26, blurRadius: 14, offset: Offset(6, 6)),
  ],
  borderRadius: BorderRadius.circular(75),
  child: Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      color: Color(0xFFE0E5EC),
      shape: BoxShape.circle,
    ),
  ),
)
```

---

## API Reference

### `InnerShadow`

| Parameter | Type | Required | Description |
|---|---|---|---|
| `shadows` | `List<Shadow>` | ✅ | List of inner shadows to apply |
| `borderRadius` | `BorderRadius?` | ❌ | Match with child's border radius for proper clipping |
| `child` | `Widget` | ✅ | The widget to apply shadow to |

### `InnerShadowContainer`

| Parameter | Type | Required | Description |
|---|---|---|---|
| `shadows` | `List<Shadow>` | ✅ | List of inner shadows |
| `decoration` | `BoxDecoration` | ✅ | Box decoration (color, borderRadius, etc.) |
| `width` | `double?` | ❌ | Container width |
| `height` | `double?` | ❌ | Container height |
| `padding` | `EdgeInsetsGeometry?` | ❌ | Inner padding |
| `alignment` | `AlignmentGeometry?` | ❌ | Child alignment |
| `child` | `Widget?` | ❌ | Optional child widget |

---

## How Shadow Offset Works

| Offset | Shadow appears on |
|---|---|
| `Offset(4, 4)` | Top & Left inner edges |
| `Offset(-4, -4)` | Bottom & Right inner edges |
| Both together | All edges — neumorphism pressed look |

---

## Contributing

Found a bug or want a new feature?
Open an issue or PR at [GitHub](https://github.com/YOURUSERNAME/inner_shadow) — contributions are welcome!

## License

MIT License — see [LICENSE](LICENSE) file for details.