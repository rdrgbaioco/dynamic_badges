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

#### Counter example:
```dart
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicBadge(
      count: 1000,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.groups_2_outlined,
        ),
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
    return const DynamicBadge.small(
      child: Icon(
        Icons.email,
        size: 48,
      ),
    );
  }
}
```
