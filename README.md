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

## Project Detailing
- First create a MyApp class statelesswidget widget that will run the app in main function.
- Create a superclass for the subclass wedget by key which is used to uniquely identify widgets.
- `Override` - A method in a subclass is intended to override a method with the same name in its superclass.
- build widget return MaterialApp which contain the title , theme and home section of app.
- Home extends the statefulwidget for updating the change of project by its state wth `setState` method after correctly initialize the state of the widget by `initState`.
- Check for loading indicator.
- Check for error while fetch or server error.
- Fetch the data from api by get method created in node backend in the form of list by returning `ListTile` which contain title and subtitle with some styling in it.

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