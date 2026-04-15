# 🌿 Smart Orchard — Crop Monitoring Mobile App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![FlutterFlow](https://img.shields.io/badge/FlutterFlow-4285F4?style=for-the-badge&logo=google&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=apple&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=for-the-badge)

**A cross-platform mobile application for smart orchard and crop management. Monitor atmospheric conditions, track products by location, manage appointments and payments — all backed by Firebase and built with Flutter.**

[Features](#-features) · [Tech Stack](#-tech-stack) · [Getting Started](#-getting-started) · [Architecture](#-architecture) · [Screens](#-screens) · [Contributing](#-contributing)

</div>

---

## 📋 Table of Contents

- [What is this project?](#-what-is-this-project)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Prerequisites](#-prerequisites)
- [Getting Started](#-getting-started)
- [Firebase Setup](#-firebase-setup)
- [Architecture](#-architecture)
- [Screens](#-screens)
- [Project Structure](#-project-structure)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [Author](#-author)
- [License](#-license)

---

## 🌱 What is this project?

**Smart Orchard** is a cross-platform mobile app (Android, iOS, Web) built with Flutter and Firebase. It provides orchard and crop owners with a centralized tool to register and monitor their products/plants, track atmospheric conditions over time, schedule maintenance appointments, and manage payment records — all from a single mobile interface with real-time Firestore sync.

The app features a full authentication flow, animated onboarding, dark/light theme toggle, and Firebase push notifications.

---

## ✨ Features

- 🔐 **Multi-provider authentication** — Email/password, Google Sign-In, Apple Sign-In, GitHub
- 🧭 **Onboarding** — Multi-step intro screen with smooth page indicator
- 🌿 **Product management** — Register orchard products/plants with name, image, color, default temperature, GPS location and owner reference
- 📊 **Atmospheric charts** — Visualize real-time and historical environmental conditions
- 📅 **Appointment scheduling** — Create, track and manage maintenance appointments with status and description
- 💳 **Payment records** — Log and consult payment history linked to products and users
- 👤 **User profile** — Edit profile info, upload photo via Firebase Storage, change password
- 🌙 **Dark / Light theme** — Persistent theme toggle with `FlutterFlowTheme`
- 🔔 **Push notifications** — iOS notification extension with image support
- 🌐 **Web support** — Progressive Web App via Flutter Web

---

## 🛠 Tech Stack

| Layer | Technology | Version |
|---|---|---|
| Framework | Flutter | `3.x` (stable) |
| Language | Dart | `>=3.0.0 <4.0.0` |
| UI scaffolding | FlutterFlow | — |
| Authentication | Firebase Auth | `4.6.2` |
| Database | Cloud Firestore | `4.8.0` |
| File storage | Firebase Storage | `11.2.2` |
| Performance | Firebase Performance | `0.9.2+2` |
| Navigation | go_router | `7.1.1` |
| State management | Provider + FlutterFlow model | `6.0.4` |
| Animations | flutter_animate | `4.1.1+1` |
| Image loading | cached_network_image | `3.2.1` |
| Fonts | google_fonts | `4.0.3` |
| Icons | font_awesome_flutter | `10.1.0` |
| Progress bars | percent_indicator | `4.2.2` |
| Social auth | google_sign_in + sign_in_with_apple | `6.0.2` / `4.3.0` |

---

## 📋 Prerequisites

Before running the project, make sure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.0.0`
- [Dart SDK](https://dart.dev/get-dart) `>=3.0.0`
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with Flutter extension
- [Firebase CLI](https://firebase.google.com/docs/cli) (for Firebase configuration)
- A Firebase project with Firestore, Auth and Storage enabled

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/FryFr/Smart_Orchard.git
cd Smart_Orchard
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure Firebase

Replace the existing Firebase configuration files with your own (see [Firebase Setup](#-firebase-setup) below):

- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `lib/backend/firebase/firebase_config.dart`

### 4. Run the app

```bash
# Android
flutter run

# iOS (requires Xcode and a Mac)
flutter run -d ios

# Web
flutter run -d web-server
```

---

## 🔥 Firebase Setup

The app requires a Firebase project with the following services enabled:

### Authentication

Go to **Firebase Console → Authentication → Sign-in method** and enable:

| Provider | Required |
|---|---|
| Email / Password | ✅ |
| Google | ✅ |
| Apple | ✅ (iOS only) |
| GitHub | Optional |

### Firestore Database

Create the following collections:

| Collection | Description |
|---|---|
| `users` | User profiles (name, email, phone, photo URL) |
| `productName` | Orchard products/plants with GPS location and owner reference |
| `car_appointments` | Maintenance appointments with scheduled date, status and description |
| `payments` | Payment records linked to products and users |

### Firestore Security Rules

The default rules are located at `lib/backend/schema/firestore.rules`. Import them in your Firebase project or adjust them to your needs.

### Google Sign-In (Android)

Add your `SHA-1` key to your Firebase project under **Project Settings → Your apps → Android app**:

```bash
# Get SHA-1 from your keystore
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

---

## 🏗 Architecture

The project follows the **FlutterFlow architecture pattern**: each screen has its own `_widget.dart` (UI) and `_model.dart` (state/logic), backed by a shared Firebase layer.

```
┌─────────────────────────────────────────────────────┐
│                   Flutter UI Layer                  │
│  pages/ ──── widget.dart (UI) + model.dart (state)  │
│  components/ ──── reusable UI widgets               │
└──────────────────────┬──────────────────────────────┘
                       │
┌──────────────────────▼──────────────────────────────┐
│               FlutterFlow Utilities                 │
│  flutter_flow/ ── theme, nav, animations, utils     │
└──────────────────────┬──────────────────────────────┘
                       │
┌──────────────────────▼──────────────────────────────┐
│                  Backend Layer                      │
│  auth/ ─────── Firebase Auth providers              │
│  backend/      Firestore schemas + API calls        │
│  firebase_storage/ ── file upload helpers           │
└──────────────────────┬──────────────────────────────┘
                       │
┌──────────────────────▼──────────────────────────────┐
│                   Firebase                          │
│  Firestore · Auth · Storage · Performance           │
└─────────────────────────────────────────────────────┘
```

---

## 📱 Screens

| Screen | File | Description |
|---|---|---|
| Onboarding | `onboarding_widget.dart` | Multi-step intro with smooth page indicator |
| Login | `login_widget.dart` | Email + social sign-in |
| Create Account | `create_account_widget.dart` | New user registration |
| Create User | `create_user_widget.dart` | Extended user profile setup |
| Forgot Password | `forgot_password_widget.dart` | Password reset via email |
| Home | `home_page_widget.dart` | Dashboard with animated product cards |
| Product Detail | `car_driving_widget.dart` | Full product/plant monitoring view |
| Add Product | `add_car_widget.dart` | Register a new orchard product |
| Edit Product | `edit_car_widget.dart` | Modify existing product data |
| Atmospheric Charts | `atmos_charts_widget.dart` | Environmental condition graphs |
| Profile | `profile_page_widget.dart` | User info, appointments and payments |
| Edit Profile | `edit_profile_widget.dart` | Update name, photo and contact info |
| Change Password | `change_password_widget.dart` | Secure password update |

---

## 📁 Project Structure

```
Smart_Orchard/
│
├── lib/
│   ├── main.dart                    # App entry point, theme & routing
│   ├── index.dart                   # Page exports
│   │
│   ├── auth/                        # Firebase Auth providers
│   │   └── firebase_auth/           # Email, Google, Apple, GitHub, JWT
│   │
│   ├── backend/
│   │   ├── api_requests/            # External API calls
│   │   ├── firebase/                # Firebase initialization
│   │   ├── firebase_storage/        # File upload helpers
│   │   └── schema/                  # Firestore data models
│   │       ├── users_record.dart
│   │       ├── product_name_record.dart
│   │       ├── car_appointments_record.dart
│   │       └── payments_record.dart
│   │
│   ├── components/                  # Reusable UI widgets
│   │   ├── appointment_empty/
│   │   └── empty_payments/
│   │
│   ├── flutter_flow/                # FlutterFlow utilities
│   │   ├── flutter_flow_theme.dart  # Theme + dark mode
│   │   ├── nav/                     # go_router navigation
│   │   └── flutter_flow_animations.dart
│   │
│   └── pages/                       # App screens
│       ├── home_page/
│       ├── atmos_charts/
│       ├── profile_page/
│       └── ...
│
├── assets/
│   ├── images/                      # App images and icons
│   ├── fonts/                       # Custom fonts
│   ├── lottie_animations/           # Lottie JSON files
│   └── rive_animations/             # Rive animation files
│
├── android/                         # Android native project
├── ios/                             # iOS native project + notification extension
└── web/                             # Flutter Web entry point
```

---

## 🗺 Roadmap

- [ ] IoT sensor integration (temperature, humidity, soil moisture via MQTT or HTTP)
- [ ] Real-time atmospheric chart data from hardware sensors
- [ ] Push notification alerts for out-of-range sensor readings
- [ ] Offline mode with local Firestore caching
- [ ] Multi-language support (Spanish / English toggle)
- [ ] Export reports to PDF
- [ ] Admin dashboard on web for fleet-level monitoring

---

## 🤝 Contributing

Contributions are welcome! To get started:

1. **Fork** this repository
2. Create your feature branch:
   ```bash
   git checkout -b feature/your-feature
   ```
3. Commit with clear messages:
   ```bash
   git commit -m "feat: add sensor data integration for temperature readings"
   ```
4. Push and open a **Pull Request**

### Commit convention

| Prefix | Usage |
|---|---|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `ui:` | UI / styling changes |
| `docs:` | Documentation only |
| `refactor:` | Code restructuring |
| `chore:` | Dependency updates or config |

### Pull Request checklist

- [ ] Tested on Android and/or iOS
- [ ] No Firebase credentials or API keys committed
- [ ] Code follows existing FlutterFlow widget/model pattern
- [ ] Updated documentation if needed

---

## 👨‍💻 Author

**Juan Silva Medina**
- GitHub: [@FryFr](https://github.com/FryFr)
- LinkedIn: [linkedin.com/in/jsilva-medina](https://www.linkedin.com/in/jsilva-medina/?skipRedirect=true)
- YouTube: [@juansilva4256](https://www.youtube.com/@juansilva4256)

---

## 📄 License

Distributed under the **MIT License**. See [`LICENSE`](./LICENSE) for more details.

```
MIT License — Copyright (c) 2023 Juan Silva Medina
```

---

<div align="center">
  <sub>Built with ❤️, Flutter and Firebase · Found it useful? Give it a ⭐</sub>
</div>
