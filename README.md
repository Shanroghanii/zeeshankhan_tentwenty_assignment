# task

A new Flutter project.

## Getting Started

lib
view

screens

Contains various screens or pages in the app, such as:
DashboardScreen.dart
MovieDetailScreen.dart
WatchScreen.dart
...
widgets

Contains reusable widgets used across different screens:
CustomButton.dart
MovieCard.dart
UserInfo.dart
...
service

api_services
Includes classes or files responsible for interacting with APIs:
MovieApiService.dart
UserDataApiService.dart
NetworkHelper.dart
...
models

Contains classes to represent data models used within the app:
Movie.dart
User.dart
Comment.dart
...
utils

Holds utility/helper functions or classes used throughout the app:
Constants.dart (for storing constant values)
Helpers.dart (for utility functions)
Validators.dart (for form validation methods)
...
This folder structure helps organize the codebase into logical sections:

View: Separates screens and reusable widgets for better maintainability and readability.
Service: Handles API-related functionalities, separating concerns for data retrieval.
Models: Contains classes to structure and manage data received from APIs or used internally.
Utils: Stores utility functions, constants, validators, and other helper code for general use.


- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
