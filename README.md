# CampusEase – Campus Management Application

CampusEase is a student-focused campus management application developed using **Flutter and Dart**. It provides a centralized interface for students to access their academic timetable, campus events, notices, and profile information.

The project focuses on creating a simple, organized, and user-friendly interface to make campus-related information easily accessible.

## Features

### 1. Home Dashboard
- Displays an overview of the application.
- Provides quick access to important sections.
- Shows today's classes and upcoming event information.

### 2. Timetable
- Allows users to select weekdays.
- Displays the class schedule for the selected day.
- Organizes academic information in an accessible format.

### 3. Events
- Displays upcoming campus events.
- Allows users to view event information.
- Provides an event registration form with basic input validation.

### 4. Notices
- Displays campus notices and announcements.
- Allows users to open individual notices and view their details.

### 5. Student Profile
- Displays student information such as name, roll number, email, and phone number.
- Provides an option to edit profile details.

### 6. Navigation
- Uses a bottom navigation bar to switch between Home, Timetable, Events, Notices, and Profile.

## Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | Framework for building the application interface |
| Dart | Programming language used for application logic |
| Material Design | UI components and design conventions |
| Flutter Widgets | Building screens, layouts, forms, and buttons |
| StatefulWidget and setState | Managing interactive UI changes |
| VS Code | Code editor used for development |
| Flutter SDK | Building and running the application |
| Google Chrome | Running and testing the web version |

## Project Structure

```text
campusease/
├── lib/
│   └── main.dart
├── web/
├── android/
├── ios/
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

*Note: The folders shown may vary depending on the platforms and files generated in the project.*

### Important Files

- **lib/main.dart:** Contains the main application code, screen layouts, navigation, sample data, and UI interactions.
- **pubspec.yaml:** Contains project configuration, dependencies, and asset declarations.
- **pubspec.lock:** Records resolved dependency versions.
- **README.md:** Contains project documentation and setup instructions.

## Application Workflow

1. The application starts through the `main()` function.
2. The root widget initializes the application and theme.
3. The home dashboard displays quick-access information.
4. Users navigate between the five main sections using the bottom navigation bar.
5. Each section displays its relevant information and interactive elements.
6. Forms and dialogs demonstrate profile editing, event registration, and notice viewing.

## Technologies and Implementation

### Flutter and Dart
Flutter is used to construct the application's interface, while Dart implements the application logic and interactions.

### Widgets
Flutter widgets are used to build layouts, text, buttons, cards, forms, dialogs, and navigation elements.

### State Management
The current implementation uses `StatefulWidget` and `setState()` to update the interface when users interact with elements such as the timetable selector and profile form.

### Data Handling
The current version uses sample data and in-memory state. A backend server and database are not currently integrated.

## Installation and Setup

### Prerequisites
- Flutter SDK
- Dart SDK
- Visual Studio Code or another compatible editor
- Google Chrome

### Steps to Run

**1. Open the project directory**

```bash
cd C:\Users\aashi\campusease
```

**2. Install dependencies**

```bash
flutter pub get
```

**3. Check available devices**

```bash
flutter devices
```

**4. Run the application in Chrome**

```bash
flutter run -d chrome
```

## Current Limitations

- Uses sample timetable, event, and notice data.
- Does not currently include backend or database integration.
- Does not provide real user authentication.
- Event registrations are not submitted to a server.
- Profile changes are not permanently stored.
- Data is not synchronized between different users or devices.

## Future Enhancements

- Integrate a backend server and database.
- Add secure student authentication.
- Store profile changes permanently.
- Implement actual event registration.
- Add notifications for events and announcements.
- Support real-time timetable and notice updates.
- Introduce administrative features for managing campus information.

## Project Status

**Status:** Frontend prototype

CampusEase demonstrates the main user interface, navigation, and student-facing features of a campus management application. Backend integration and persistent data storage can be added in future versions.

## Author

**Aashika Janga**  
B.Tech – Computer Science and Engineering  
BVRIT Hyderabad
