# How to use auto route inside this project

## Step 1
Add this decorator your screen navigable

```dart
import 'package:auto_route/auto_route.dart';
@RoutePage()
class MyScreen extends StatelessWidget {
  ...
}
```

## Step 2
Next generate route
```bash
dart run build_runner build
```

Then you get a route to your screen inside `/config/app_router.gr.dart` like `MyScreenRoute`

## Step 3
finally add your route to `/config/app_router.dart`
```dart
List<AutoRoute> get routes => [
  ...
  AutoRoute(page: MyScreenRoute.page, initial: true),
];

```

To navigate between them
AutoRouter.of(context).push(const MyScreenTwoRoute());