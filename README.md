# Smart Garbage Collection System

A smart garbage collection system built using Flutter and Firebase that uses sensors to detect the percentage of garbage bin fill levels. The app allows the waste management team to view the status of all garbage bins. Additionally, the app helps users find the shortest route to a selected garbage bin.

## Screenshots

| ![](./screenshots/image1.jpg) | ![](./screenshots/image2.jpg) | ![](./screenshots/image3.jpg) |
| ----------------------------- | ----------------------------- | ----------------------------- |

## Features

- Real-time monitoring of garbage bins
- Finding the shortest route to a selected garbage bin

## Technologies Used

- Flutter for the mobile app development
- Firebase for real-time database and notification services
- ESP32 and HC-SR05 sensors for garbage bin monitoring

## Getting Started

### Prerequisites

- Install the latest version of Flutter on your machine
- Set up a Firebase project and download the configuration files

### Installing

1. Clone the repository to your local machine
2. In the terminal, navigate to the project directory and run `flutter pub get`
3. Add the Firebase configuration files to the project in the `android/app` and `ios/Runner` directories
4. Run the app using `flutter run` or through an IDE

### Configuration

1. Set up the ESP32 and sensors.
2. Connect the Arduino to the Firebase firestore database using the configuration files

### Note about `FirestorePoubelle.ino`

The `FirestorePoubelle.ino` file in the repository contains the sketch used for the ESP32 microcontroller to communicate with Firebase Firestore. The sketch should be uploaded to the ESP32 using the Arduino IDE or a similar programming environment.

## Finding the Shortest Route to a Selected Garbage Bin

If the user wants to navigate to a specific garbage bin, they can select the bin on the map and click on it. The app will then show the shortest route to the selected garbage bin on the map.
