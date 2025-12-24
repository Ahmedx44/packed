# Packed CLI 📦

[![Pub Version](https://img.shields.io/pub/v/packed?color=blue)](https://pub.dev/packages/packed)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A powerful CLI tool to rapidly generate Flutter feature structures following **Clean Architecture** and the **BLoC/Cubit** pattern. Stop wasting time on boilerplate and focus on building features.

---

## 🚀 Features

- 🏗️ **Clean Architecture**: Automatically generates Data, Domain, and Presentation layers.
- 📦 **Auto-Dependencies**: Automatically installs `flutter_bloc`, `get_it`, `equatable`, and `dartz` if they are missing.
- 💉 **Dependency Injection**: Automatic `get_it` registration for all layers (Datasources, Repositories, Usecases, and Cubits).
- 🧩 **Modular Structure**: Each feature is self-contained with its own DI file for better maintainability.
- ⚡ **Standalone Usecases**: Generate new usecases for existing features with automatic DI registration.
- 📏 **Smart Naming**: Automatically handles `snake_case` for files and `PascalCase` for classes.

---

## 📥 Installation

```bash
# From pub.dev
dart pub global activate packed

---

## 🛠️ Usage

### 1. Initialize Project
Sets up the core folder structure (`lib/core/`), base classes (Failures, UseCases), and a global Dependency Injection container.

```bash
packed generate init
```

**This command will create:**
- `lib/core/error/failures.dart`
- `lib/core/usecases/usecase.dart`
- `lib/core/network/network_info.dart`
- `lib/injection_container.dart`

### 2. Generate a New Feature
Generates a complete Clean Architecture folder structure with all necessary boilerplate code.

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

### 3. Generate a Standalone Usecase
Adds a new usecase to an existing feature and automatically registers it in the feature's DI file.

```bash
packed generate usecase <usecase_name> <feature_name>
```

**Example:**
```bash
packed generate usecase UpdateProfile Home
```

**This command will:**
1. Create `update_profile_usecase.dart` in `lib/features/home/domain/usecases/`.
2. Add the necessary import to `lib/features/home/di/home_di.dart`.
3. Register `UpdateProfileUseCase` in the `GetIt` container within the DI file.

---

## 🏛️ Architecture Overview

### 🎨 Presentation Layer
- **Cubit**: Handles state management using the Cubit pattern.
- **Page**: The entry point widget that provides the Cubit using `GetIt`.
- **View**: The actual UI layout, separated from the Page for better testing and readability.

### 🌐 Domain Layer
- **Entities**: Simple business objects extending `Equatable`.
- **Repositories**: Abstract interfaces defining the contract for data operations.
- **Usecases**: Single-responsibility classes containing business logic.

### 💾 Data Layer
- **Models**: Data Transfer Objects (DTOs) with JSON serialization (extends Entities).
- **Datasources**: Remote and Local data handling logic.
- **Repository Impl**: Concrete implementation of domain repositories.

---

## 📦 Dependencies
Packed ensures your project has the following industry-standard dependencies:
- `flutter_bloc`: State management.
- `get_it`: Service locator for DI.
- `equatable`: Value-based equality.
- `dartz`: Functional programming (for `Either` type).

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
