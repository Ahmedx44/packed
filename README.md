# Packed CLI 📦

A powerful CLI tool to rapidly generate Flutter feature structures following **Clean Architecture** and the **BLoC/Cubit** pattern.

## Features

- 🏗️ **Clean Architecture**: Generates Data, Domain, and Presentation layers.
- 📦 **Auto-Dependencies**: Automatically installs `flutter_bloc`, `get_it`, `equatable`, and `dartz`.
- 💉 **Dependency Injection**: Automatic `get_it` registration for all layers.
- 🧩 **Modular Structure**: Each feature is self-contained with its own DI, Cubit, and Usecases.
- ⚡ **Standalone Usecases**: Generate new usecases for existing features with automatic DI registration.
- 📏 **Naming Conventions**: Automatically handles `snake_case` for files and `PascalCase` for classes.

## Installation

```bash
# From local path
dart pub global activate --source path .

# Or if published
dart pub global activate packed
```

## Usage

### 1. Generate a New Feature
Generates a complete Clean Architecture folder structure with boilerplate code.

```bash
packed generate feature <feature_name>
```

**Example:**
```bash
packed generate feature Home
```

**Generated Structure:**
```text
lib/features/home/
├── data/
│   ├── datasources/home_remote_datasource.dart
│   ├── models/home_model.dart
│   └── repositories/home_repository_impl.dart
├── domain/
│   ├── entities/home_entity.dart
│   ├── repositories/home_repository.dart
│   └── usecases/get_home_usecase.dart
├── presentation/
│   ├── cubit/home_cubit.dart & home_state.dart
│   ├── pages/home_page.dart & home_view.dart
│   └── widgets/
└── di/
    └── home_di.dart (Dependency Injection)
```

### 2. Generate a Standalone Usecase
Adds a new usecase to an existing feature and automatically registers it in the feature's DI file.

```bash
packed generate usecase <usecase_name> <feature_name>
```

**Example:**
```bash
packed generate usecase UpdateProfile Home
```

This will:
1. Create `update_profile_usecase.dart` in the `home` feature.
2. Add the import to `home_di.dart`.
3. Register `UpdateProfileUseCase` in the `GetIt` container.

## Architecture Overview

### Presentation Layer
- **Cubit**: Handles state management.
- **Page**: Entry point that provides the Cubit using `GetIt`.
- **View**: The actual UI layout.

### Domain Layer
- **Entities**: Simple business objects (using `Equatable`).
- **Repositories**: Abstract interfaces.
- **Usecases**: Single-responsibility business logic classes.

### Data Layer
- **Models**: DTOs with JSON serialization (extends Entities).
- **Datasources**: Remote/Local data handling.
- **Repository Impl**: Implementation of domain repositories.

## Dependencies
- `flutter_bloc`
- `get_it`
- `equatable`
- `dartz` (for Either)

## License
MIT
