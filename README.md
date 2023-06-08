# kapiva-assignment

## Flutter App: Fetch Data from Node.js Backend
This is a Flutter application that fetches data from a Node.js backend and displays it in a list. 
The app uses Flutter's `http` package to make HTTP requests to a specific API endpoint in the Node.js backend.

## Requirements
- Flutter SDK
- Node.js
- Visual Studio Code

## Resources
- https://docs.flutter.dev/
- https://dart.dev/guides

## Features
- Fetches data from a Node.js backend using HTTP GET request.
- Parses the JSON response received from the backend.
- Displays the fetched data in a list view.
- Implements pull-to-refresh functionality to manually update the data. `Refresh Indicator`
- Implements error handling to display a message in case of network or server errors.
- Implements loading indicators to show the progress of data fetching and refreshing. `Circular Progress Indicator`

## Dependencies
- http: ^0.13.4

## Directory Structure
- `lib/` - Contains the main Dart code for the Flutter app.
- `main.dart` - Entry point of the Flutter app.
- `home.dart` - Display the home page widget of the project.
- Other Dart files for widgets, screens, or utilities.
- `pubspec.yaml` - Defines the Flutter project's dependencies.

## API EndPoint
- POST - `/book/add`
    - To add the book
- GET - `/book/`
    - To get all the book data
- GET - `/book/:id`
    - To get particular book data with given id
- PUT - `/book/:id` 
    - To update the particular book data with given id
- DELETE - `/book/:id` 
    -  To delete the particular book data with id

## Node Installation
```
- npm init -y
- npm install
- npm run server
```

## NPM Packages
- express
- nodemon
- dotenv
- mongoose

## Backend Deploy
- https://yif-library-be.onrender.com/

## Flutter App Deploy
- https://flutter-app-275.netlify.app/