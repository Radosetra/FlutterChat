# Riverpod State Management - Example Usage

This guide explains how to use **Riverpod** as a state management solution in Flutter.  
Riverpod allows you to manage application state in a structured and scalable way.  
You can store objects, variables, or service instances inside your state and access them efficiently throughout your app.

---

Before, must know concept

1. `Provider`
A Provider is the most basic and fundamental building block of Riverpod. It's the object that encapsulates and holds a piece of state. Think of it as a global variable that you can read from, but with a lot of built-in functionality

There are different types of providers for various use cases:

- `Provider`: The simplest type, used for read-only values that never change.

- `StateProvider`: Used for simple, mutable state (e.g., a counter or a boolean flag).

- `StateNotifierProvider`: Used for complex, immutable state objects and the business logic to modify them. This is the most common type for managing a feature's state.

- `FutureProvider`: Used for asynchronous data, like fetching data from an API.

---

2. `Ref`
The `Ref` object is the central tool for 'interacting with providers'. It's an object that provides access to Riverpod's container, allowing you to get the value of other providers or perform actions.

You'll encounter different types of Ref depending on where you are in your code:

- `WidgetRef`: Used in the build method of a ConsumerWidget. It's the primary way to read and watch providers from your UI.

- `ProviderRef`: Used inside the creation function of a provider. This allows a provider to access other providers, which is essential for dependency injection. For example, a repository provider can use ref to access the Dio provider.

- `Ref`: A general term for either a ProviderRef or WidgetRef.

---

3. `ref.read` vs. `ref.watch` vs. `ref.listen`
These are the three main methods you'll use with the Ref object to interact with your providers.

- `ref.watch(provider)`: This method tells a widget to "watch" a provider. When the provider's state changes, the widget automatically rebuilds. This is what makes your UI reactive to state changes.

- `ref.read(provider)`: This method tells a widget to "read" a provider's state once. It does not cause a rebuild when the state changes. This is typically used inside event handlers (like a button's onPressed method) when you only need to access the current state without reacting to future changes.

- `ref.listen(provider)`: This method is used for side effects like showing a SnackBar, navigating to a new screen, or showing an alert dialog. It allows you to react to a state change without rebuilding the widget. It's a great alternative to using ref.watch and a condition.

---

4. `ProviderContainer`
The `ProviderContainer` is the internal storage that holds the state of all providers. While you typically don't interact with it directly inside your UI, it's the object that your ProviderScope widget creates to make providers available to your app. It's also the correct way to access providers in non-widget contexts, such as an HTTP interceptor or a background service.

---

## 1. Defining a State Class

You can define a state class to hold your application data. For example:

```dart
class UserState {
  final User? currentUser;
  final List<User> activeUsers;

  UserState({
    this.currentUser,
    this.activeUsers = const [],
  });

  UserState copyWith({
    User? currentUser,
    List<User>? activeUsers,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
      activeUsers: activeUsers ?? this.activeUsers,
    );
  }
}
```

---

## 2. Defining a Notifier and Provider

A notifier is responsible for updating the state.  
You can then expose this state using a provider.

```dart
class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState());

  void setCurrentUser(User user) {
    state = state.copyWith(currentUser: user);
  }

  void setActiveUsers(List<User> users) {
    state = state.copyWith(activeUsers: users);
  }

  void clearCurrentUser() {
    state = state.copyWith(currentUser: null);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});
```

---

## 3. Using Providers

You can access providers in two main ways:

- **`ref.read(provider)`**: Reads the current value once (useful for calling methods).
- **`ref.watch(provider)`**: Subscribes to the provider and rebuilds the widget when the state changes.

```dart
// Read the current state (one-time access)
final userState = ref.read(userProvider);

// Watch the state (widget rebuilds on changes)
final userState = ref.watch(userProvider);
```

---

## 4. Using Provider for Services

You can also use Riverpod to provide a single instance of a service  
that can be shared across your app.

```dart
final socketServiceProvider = Provider<SocketService>((ref) {
  return SocketService(ref);
});

// Usage
final socketService = ref.read(socketServiceProvider);
```

---

## ✅ Advantages of Riverpod

- Ensures a **single instance** of services or state objects.  
- Encourages **immutability** with `copyWith` patterns.  
- Provides **clear separation of concerns** between state, logic, and UI.  
- **Efficient rebuilding**: Only the widgets that depend on the provider rebuild.  
