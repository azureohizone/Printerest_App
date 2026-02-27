# 📌 Pinterest App Clone — Flutter

A pixel-faithful, static UI clone of the Pinterest mobile application built with Flutter. Replicates the core visual experience and navigation structure of Pinterest across five main screens.

> ⚠️ **Static UI only** — no backend, no API integration. All data is hardcoded for demonstration purposes.

---

## ✨ Features

### 🏠 Home Screen
- Masonry-style (Pinterest-style staggered grid) image feed
- Horizontal category filter tabs — All, Like, Anime, Nature, and more
- Pin save button overlay on each image card
- Bottom navigation bar with 5 tabs

### 🔍 Search Screen
- Search bar with camera icon (visual search UI)
- "Ideas for you" section with a 2-column image grid
- Category tiles with text overlays

### 🔔 Notification Screen
- Updates and Messages tab switcher
- Notification list with thumbnail, title, and timestamp
- Clean list-based layout

### 💬 Messages Screen
- Contacts list with avatar initials and username handles
- New message button
- "Invite your friends" call-to-action row

### 👤 Profile Screen
- Pins and Boards tab switcher
- 3-column staggered grid for saved pins
- Board view with cover image, board name, pin count, and age
- Board suggestions section
- Search saved ideas bar with sort and filter controls

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| UI | Custom widgets, Stack, GridView, ListView |
| Navigation | Bottom NavigationBar with tab state |
| Images | Local assets (`lib/img/`) |
| State | `setState` (local widget state) |
| Platform | iOS · Android · macOS · Linux · Web · Windows |

---

## 📁 Project Structure

```
Printerest_App/
├── lib/
│   ├── main.dart                 # App entry point & bottom nav
│   ├── homeScreen/               # Home feed with masonry grid
│   ├── searchScreen/             # Search & Ideas for you
│   ├── notificationScreen/       # Updates & Messages tabs
│   ├── detailScreen/             # Pin detail view
│   ├── accSettingScreen/         # Profile & account settings
│   └── img/                      # Local image assets
├── assets/
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
├── test/
└── pubspec.yaml
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio / Xcode (for device emulation)

### Run the app

```bash
# Clone the repository
git clone https://github.com/azureohizone/Printerest_App.git
cd Printerest_App

# Install dependencies
flutter pub get

# Run on connected device or emulator
flutter run

# Run on a specific platform
flutter run -d chrome        # Web
flutter run -d macos         # macOS
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  # Add any packages used e.g. google_fonts, cached_network_image
```

> Check `pubspec.yaml` for the full dependency list.

---

## 🎨 Design Notes

- Dark theme throughout (`#000000` background) matching Pinterest's dark mode
- Staggered/masonry grid layout replicating Pinterest's signature feed style
- Rounded image cards with subtle overlay buttons
- Tab-based navigation mirroring Pinterest's 5-tab bottom bar

---

## ⚠️ Disclaimer

This project is built for **educational and academic purposes only**. It is a UI clone exercise and is not affiliated with, endorsed by, or connected to Pinterest, Inc. in any way. All images used are for demonstration only.

---

## 👤 Author

**[Srors Muyyi]**
- GitHub: [@azureohizone](https://github.com/azureohizone)
- LinkedIn: [your-linkedin](https://linkedin.com/in/your-linkedin)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
