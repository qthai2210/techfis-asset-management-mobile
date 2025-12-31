# Techfis Asset Management Mobile

This is the mobile application for Techfis Asset Management, built with Flutter.

## Getting Started

1.  **Dependencies:** Run `flutter pub get` to install dependencies.
2.  **Code Generation:** Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate DI and JSON code.
3.  **Run:** Run `flutter run` to start the app.

## Architecture

This project follows **Feature-first Clean Architecture**.
- `lib/features/`: Contains feature modules (Auth, Dashboard, etc.).
- `lib/core/`: Contains shared logic (Config, Network, Utils).

## Stack

- **Framework:** Flutter
- **State Management:** flutter_bloc
- **Navigation:** go_router
- **DI:** get_it + injectable
