# Dynamic Badges

Help with material design badges implementation.
<hr>
<p align="center">
  
  <img src="https://github.com/rdrgbaioco/dynamic_badges/blob/main/images/examples.png?raw=true" width="350" alt="accessibility text">
</p>

## Usage `DynamicBadge`
<hr>

First, you need to import the package:
```dart
import 'package:dynamic_badges/dynamic_badges.dart';
```

#### Basic example:
```dart
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicBadge(
      label: "3",
      childSize: 92,
      child: IconButton(
        iconSize: 92,
        icon: const Icon(
          Icons.chat_bubble_outline_rounded,
        ),
        onPressed: () {},
      ),
    );
  }
}
```
#### Counter Example:
```dart
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicBadge.counter(
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

#### Small Example:
```dart
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicBadge.small(
      childSize: 92,
      child: IconButton(
        iconSize: 92,
        icon: const Icon(
          Icons.chat_bubble_outline_rounded,
        ),
        onPressed: () {},
      ),
    );
  }
}
```


