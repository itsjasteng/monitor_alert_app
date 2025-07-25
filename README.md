# Child Safety Monitoring And Alert Application 

## 🌟 Overview

The Child Safety Monitoring and Alert Application is a robust and intuitive mobile solution designed to provide caregivers with real-time insights into their children's well-being and location. Leveraging wearable technology, this application aims to enhance peace of mind by offering features such as live location tracking, vital sign monitoring, activity logging, and customizable alerts.

This project demonstrates a modern Flutter application architecture, showcasing effective state management, navigation, and user interface design for a critical safety application.

## ✨ Features

Our application comes packed with essential functionalities to ensure comprehensive child monitoring:

* **User Authentication & Profile Management:**
    * Secure login system with email and password validation.
    * Password visibility toggle for enhanced usability.
    * Ability for caregivers to view and update their personal profile information.

* **Child Profile Management:**
    * Comprehensive list view of all registered child profiles.
    * Functionality to add new child profiles with essential details.
    * Ability to delete existing child profiles with a confirmation prompt.
    * Detailed view for each child, including notes, wearable ID, battery status, and last updated time.
    * Seamless child selection via a dropdown to switch monitoring focus.

* **Real-time Monitoring & Alerts:**
    * **Dynamic Home Dashboard:** Provides an at-a-glance summary of the selected child's simulated real-time heart rate, temperature, activity status, and session duration.
    * **Instant Alert Display:** Shows the most recent alert directly on the home screen for immediate attention.
    * **Dedicated Alerts Page:** A comprehensive screen to review all triggered alerts, categorized by severity (critical, warning, informational).
    * **Simulated Dynamic Alerts:** Alerts are generated and displayed across relevant pages (Home and Alerts) to demonstrate real-time notification capabilities.

* **Location Tracking & Geofencing:**
    * **Simulated Map View:** Visual representation of the child's location within a predefined environment.
    * **Customizable Geofence:** Caregivers can select specific areas (e.g., classrooms) and define a safe zone radius in meters, with visual feedback on the map.

* **Activity Logging:**
    * **Detailed Activity Log:** Presents a chronological record of a child's movements, activities, and system events.
    * **Time Range Filtering:** Users can filter activity data by "Last Hour," "Today," or "This Week" for focused review.

* **Reporting:**
    * **Simulated Report Generation:** Displays a sample report summarizing child identification, location, movement patterns, and heart rate monitoring data.
    * **Report Submission (Placeholder):** A button to simulate submitting a report, triggering an in-app notification.
    * **Report Download (Placeholder):** A button to simulate downloading a report, also triggering an in-app notification.

* **Application Settings:**
    * **Dark Mode Toggle:** Allows users to personalize their viewing experience by switching between light and dark themes.
    * **Granular Notification Control:** Users can enable or disable specific types of alerts (critical, warning, informational) based on their preferences.
    * **Help & Support Section:** Provides a list of frequently asked questions (FAQs) and a placeholder for direct support contact.

* **Enhanced User Experience:**
    * **Intuitive Navigation:** Utilizes `go_router` for smooth and robust navigation throughout the application via an accessible side drawer.
    * **Contextual Feedback:** Provides subtle `SnackBar` messages for user actions (e.g., "Submitting report...").
    * **Gradient Styling:** Features gradient text and loading indicators on the login page for a modern aesthetic.

## 🛠️ Technologies Used

* **Flutter:** The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
* **Dart:** The programming language used by Flutter.
* **go_router:** A declarative routing package for Flutter, simplifying navigation management.

## 🛣️ Future Enhancements

* Integration with real wearable devices and backend APIs.
* Implementation of actual "Forgot Password" and "Create Account" flows.
* Advanced geofencing features with custom shapes and multiple zones.
* Detailed analytics and customizable report parameters.
* User-specific notification preferences (e.g., sound, vibration).
* Cloud-based data storage (e.g., Firebase Firestore) for persistent data.

## 🤝 Contributing

Contributions are welcome! If you have suggestions for improvements or new features, please open an issue or submit a pull request.

