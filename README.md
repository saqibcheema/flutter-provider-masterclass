# Flutter Provider Manager

A Flutter application demonstrating state management using the Provider package. This project showcases various Provider patterns including theme switching, slider controls, and contact list management.

## Features

### 🎨 Theme Management
- Light and Dark theme switching
- Dynamic theme toggle with icon indicators
- Persistent theme state across widgets

### 🎚️ Slider Controls
- Interactive slider with real-time value updates
- Dynamic opacity changes on containers based on slider value
- Smooth animations and responsive UI

### 📱 Contact Management
- Add new contacts
- Update existing contacts
- Delete contacts
- Real-time list updates

## Project Structure

```
lib/
├── Provider/
│   ├── SliderProvider.dart      # Manages slider state
│   ├── ThemeProvider.dart       # Handles theme switching
│   └── listProvider.dart        # Contact list UI component
├── Screens/
│   ├── Slider.dart              # Main slider screen
│   ├── addScreen.dart           # Add contact screen
│   ├── counter.dart             # Counter provider (utility)
│   └── listScreen.dart          # Contact list data provider
└── main.dart                    # App entry point
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  provider: ^6.1.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

## Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd provider_manager
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## Provider Classes

### ThemeProvider
Manages application theme state with light/dark mode switching:
```dart
class ThemeProvider extends ChangeNotifier {
  var _themeMode = ThemeMode.light;
  
  ThemeMode get themeMode => _themeMode;
  
  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeMode.light 
        ? ThemeMode.dark 
        : ThemeMode.light;
    notifyListeners();
  }
}
```

### SliderProvider
Controls slider value and triggers UI updates:
```dart
class SliderProvider extends ChangeNotifier {
  double _value = 1;
  double get value => _value;
  
  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}
```

### ListMapProvider
Manages contact list data with CRUD operations:
```dart
class ListMapProvider extends ChangeNotifier {
  List<Map<String,dynamic>> _data = [];
  
  void addData(Map<String,dynamic> data) { /* ... */ }
  void updateData(Map<String,dynamic> data, int index) { /* ... */ }
  void deleteData(int index) { /* ... */ }
  List<Map<String,dynamic>> getData() => _data;
}
```

## Key Features Implementation

### Multi-Provider Setup
The app uses `MultiProvider` to inject multiple providers:
```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => SliderProvider()),
  ],
  child: MaterialApp(/* ... */),
)
```

### Consumer Pattern
UI components consume provider state using `Consumer` widget:
```dart
Consumer<SliderProvider>(
  builder: (ctx, value, child) {
    return Slider(
      value: value.value,
      onChanged: (val) => ctx.read<SliderProvider>().setValue(val),
    );
  },
)
```

### Context.read() Pattern
For actions that don't require rebuilding:
```dart
context.read<ListMapProvider>().addData({
  'name': 'Contact',
  'mobNo': '0323932342'
});
```

## Screens Overview

### Slider Screen (Main)
- Interactive slider control
- Theme toggle button in app bar
- Dynamic container opacity based on slider value
- Real-time visual feedback

### Add Contact Screen
- Simple contact addition interface
- Integration with ListMapProvider
- Navigation back to contact list

### Contact List Screen
- Display all contacts
- Edit and delete functionality
- FloatingActionButton for adding new contacts

## Color Scheme

The app implements custom color schemes for both light and dark themes:

**Light Theme:**
- Primary: Blue
- Secondary containers: Green/Red

**Dark Theme:**
- Primary: Blue
- Secondary containers: Green/Teal
- App bar: Dark grey

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Learning Resources

This project demonstrates key Provider concepts:
- **ChangeNotifier**: Base class for providers
- **Consumer**: Widget that listens to provider changes
- **Provider.of()**: Alternative way to access providers
- **context.read()**: For actions without rebuilding
- **MultiProvider**: Managing multiple providers

## License

This project is created for educational purposes. Feel free to use and modify as needed.

## Contact

**Developer:** Saqib Cheema  
**LinkedIn:** [Connect with me on LinkedIn](https://www.linkedin.com/in/saqib-cheema-77bab0297/)

For questions, collaboration opportunities, or issues, feel free to reach out via LinkedIn or open an issue in the repository.

---
 
