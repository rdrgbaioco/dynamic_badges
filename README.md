# Dynamic Badges

Help with dynamic badges of Material Design.

<p align="center">
  
  <img src="https://github.com/rdrgbaioco/dynamic_badges/blob/main/images/examples.png?raw=true" width="350" alt="accessibility text">
</p>

## Usage `DynamicBadge`
There's no secret, just an extension to make it easier to get the theme, screen size, scope functions, among others...
<hr>

First, you need to import the package:
```dart
import 'package:dynamic_badges/dynamic_badges.dart';
```

### Example:
```dart
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicBadge(
      label: "999",
      childSize: 92,
      child: IconButton(
          iconSize: 92,
          icon: const Icon(
            Icons.chat_bubble_outline_rounded,
          ),
          onPressed: () {}),
    );
  }
}
```
Example with counter:

### Example:
```dart
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DynamicBadge.counter(
      count: 1241,
      childSize: 92,
      child: Icon(
        Icons.chat_bubble_outline_rounded,
        size: 92,
      ),
    );
  }
}
```


