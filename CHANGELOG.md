## 0.2.7

- Docuemntation:Added a note in README telling the user to initalize the depdency injection container in main.dart.

## 0.2.6
- Refactor: Updated `InternetConnectionChecker` to use `.instance` in core DI template.
- Refactor: Reverted `RemoteDataSourceImpl` to use constructor call `()` instead of `instance` in feature DI template.

## 0.2.5

- Feature: Updated core import paths in templates to use 4-level relative paths (`../../../../core/`).
- Refactor: Updated `RemoteDataSourceImpl` to use a singleton `instance` in DI registration.
- Documentation: Added a note in README that commands must be run from the project's root directory.

## 0.2.4

- Feature: Automatically run `packed generate init` if the project is not initialized when generating a feature or usecase.
- Fix: Added `isInitialized` check to prevent errors when core layers are missing.
- Fix: Resolved missing `dart:io` import in `generate_usecase_command.dart`.

## 0.2.3

- Feature: Added interactive prompt to choose between **Cubit** and **Bloc** when generating a feature.
- Feature: Added Bloc and Event templates for feature generation.
- Refactor: Updated DI, Page, and View templates to support both Cubit and Bloc architectures.

## 0.2.2

- Fix: Added missing documentation comments for public APIs.
- Fix: Added `lints` package and resolved all static analysis warnings.
- Fix: Improved cross-platform compatibility by cleaning up dependencies.

## 0.2.1

- Feature: Added `packed generate init` command to bootstrap project with core layers and DI container.
- Documentation: Improved README with badges, better formatting, and comprehensive usage guides.

## 0.2.0

- Feature: Added automatic installation of required dependencies (`flutter_bloc`, `get_it`, `equatable`, `dartz`).
- Feature: Added Clean Architecture support for feature generation.
- Feature: Added GetIt dependency injection support.
- Feature: Added standalone usecase generation with automatic DI registration.
- Feature: Added Domain layer (entities, repositories, usecases).
- Feature: Added Data layer (datasources, models, repositories).
- Refactor: Moved presentation files to `presentation/` directory.

## 0.1.3

- Chore: Updated versioning and project structure.

## 0.1.2

- Fix: Updated version number to 0.1.2.
