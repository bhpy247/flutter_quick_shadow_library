# quick_shadow

A Flutter package that adds **inner shadow** support to any widget — `Container`, `Button`, `Card`, and more.

Flutter’s built-in `BoxDecoration` only supports **outer shadows**.  
`quick_shadow` fills that gap with a simple and performant `QuickShadow` widget using a **Canvas-based even-odd path technique**.

🚀 **[Try it Live](https://quickshadow.netlify.app)**

---

## ✨ Features

- ✅ Add **inner shadow** to **any widget**
- ✅ Supports **BorderRadius** (rounded corners & circles)
- ✅ Supports **multiple shadows**
- ✅ Perfect for **Neumorphism UI**
- ✅ Includes `QuickShadowContainer` convenience widget
- ✅ **Zero external dependencies** (pure Flutter)

---

## 📸 Screenshots

> Add your screenshots inside a `screenshots/` folder in your repo root.

| Basic Shadow | Neumorphism | Buttons | Cards |
|---|---|---|---|
| ![Basic](screenshots/basic.jpg) | ![Neumorphism](screenshots/neumorphism.jpg) | ![Button](screenshots/buttons.jpg) | ![Cards](screenshots/cards.jpg) |

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  quick_shadow: ^0.0.3
```

Then run:

```bash
flutter pub get
```

Import it in your Dart file:

```dart
import 'package:quick_shadow/quick_shadow.dart';
```

---

## 🚀 Usage

### Basic Inner Shadow

```dart
QuickShadow(
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
QuickShadow(
  shadows: [
    Shadow(
      color: Colors.black26,
      blurRadius: 12,
      offset: Offset(6, 6),
    ),
    Shadow(
      color: Colors.white70,
      blurRadius: 12,
      offset: Offset(-6, -6),
    ),
  ],
  borderRadius: BorderRadius.circular(20),
  child: Container(
    width: 160,
    height: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Color(0xFFE0E5EC),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text('PRESSED'),
  ),
)
```

---

### QuickShadowContainer (Shorthand)

```dart
QuickShadowContainer(
  width: 200,
  height: 60,
  alignment: Alignment.center,
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
  child: Text('Hello Inner Shadow'),
)
```

---

### Circular Shape

```dart
QuickShadow(
  shadows: [
    Shadow(
      color: Colors.black26,
      blurRadius: 14,
      offset: Offset(6, 6),
    ),
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

## 📘 API Reference

### `QuickShadow`

| Parameter | Type | Required | Description |
|---|---|---|---|
| `shadows` | `List<Shadow>` | ✅ | List of inner shadows to apply |
| `borderRadius` | `BorderRadius?` | ❌ | Match with child’s border radius for proper clipping |
| `child` | `Widget` | ✅ | The widget to apply the inner shadow to |

---

### `QuickShadowContainer`

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

## 🎯 How Shadow Offset Works

| Offset | Shadow appears on |
|---|---|
| `Offset(4, 4)` | Top & Left inner edges |
| `Offset(-4, -4)` | Bottom & Right inner edges |
| Both together | All edges — neumorphism pressed look |

---

## 💡 Best Use Cases

- Neumorphism UI
- Pressed buttons
- Soft cards
- Inner depth effects
- Modern dashboard components

---

## 🤝 Contributing

Found a bug or want a new feature?

Open an issue or submit a PR on GitHub:  
[quick_shadow Repository](https://github.com/YOURUSERNAME/quick_shadow)

Contributions are always welcome.

---

## 📄 License

This package is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for details.