# Packed CLI 📦

A Simple Flutter CLI tool to rapidly generate feature structures following the BLoC pattern. Stop wasting time creating folders and boilerplate files manually.

## 🚀 Features

- **Instant Feature Generation**: Creates a complete feature folder structure in seconds.
- **BLoC/Cubit Ready**: Generates Cubit, State (with Equatable), Page, and View files.
- **Best Practices**: Follows a clean architecture approach with a clear separation between UI and Logic.
- **Smart Templates**: Includes `copyWith`, `props`, and standard `isLoading`/`error` states out of the box.

## 📂 Generated Structure

When you run `packed generate feature login`, it creates:

```text
lib/features/login/
├── cubit/
│   ├── login_cubit.dart
│   └── login_state.dart
├── page/
│   ├── login_page.dart
│   └── login_view.dart
└── widget/ (empty directory for your components)
```

## 🛠️ Installation

Install Packed CLI from pub.dev:

```bash
dart pub global activate packed
```

Alternatively, you can install it directly from GitHub:

```bash
dart pub global activate --source git https://github.com/Ahmedx44/packed
```

## 📖 Usage

### Generate a New Feature

To generate a new feature, run:

```bash
packed generate feature <feature_name>
```

Example:
```bash
packed generate feature profile
```

## 📝 Templates

### State Template
The generated state includes `isLoading` and `error` fields by default, along with `copyWith` and `Equatable` integration:

```dart
class ProfileState extends Equatable {
  final bool isLoading;
  final String? error;

  const ProfileState({
    this.isLoading = false,
    this.error,
  });

  ProfileState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, error];
}
```

### Page & View Template
- **Page**: Handles `BlocProvider` initialization.
- **View**: Contains the `Scaffold` and `BlocBuilder` boilerplate.

## 🤝 Contributing

Feel free to open issues or submit pull requests to improve the templates or add new commands!

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
