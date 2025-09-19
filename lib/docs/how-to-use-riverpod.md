# Riverpod State Management - Example Usage

This guide explains how to use **Riverpod** as a state management solution in Flutter.  
Riverpod allows you to manage application state in a structured and scalable way.  
You can store objects, variables, or service instances inside your state and access them efficiently throughout your app.

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
