# Smart Garbage Collection System

A smart garbage collection system built using Flutter and Firebase that uses sensors to detect the percentage of garbage bin fill levels. The app allows the waste management team to view the status of all garbage bins. Additionally, the app helps users find the shortest route to a selected garbage bin.

## Screenshots

| ![](./screenshots/image1.jpg) | ![](./screenshots/image2.jpg) | ![](./screenshots/image3.jpg) |
| ----------------------------- | ----------------------------- | ----------------------------- |


| ![](./screenshots/287799696_539609414582501_1011414851616122114_n.jpg) | !![](./screenshots/280270009_441553114325299_3471035679002628739_n.png) |
| ----------------------------- | ----------------------------- |


## Features

- Real-time monitoring of garbage bins
- Finding the shortest route to a selected garbage bin

## Technologies Used

- Flutter for the mobile app development
- Firebase for real-time database and notification services
- ESP32 and HC-SR05 sensors for garbage bin monitoring

### Note about `Firestore_Poubelle.ino`

The `FirestorePoubelle.ino` file in the repository contains the sketch used for the ESP32 microcontroller to communicate with Firebase Firestore. The sketch should be uploaded to the ESP32 using the Arduino IDE or a similar programming environment.

## Finding the Shortest Route to a Selected Garbage Bin

If the user wants to navigate to a specific garbage bin, they can select the bin on the map and click on it. The app will then show the shortest route to the selected garbage bin on the map.
