# StudyBuddy - Flutter App

A modern study group application for college students to form virtual and in-person study groups, collaborate through shared notes, and schedule study sessions.

## 🎯 Project Overview

StudyBuddy is a Flutter-based mobile application designed to help students:
- Search and join study groups by subject
- Schedule and manage study sessions
- Share and collaborate on notes
- Connect with peers for academic support

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.7.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Git

### Installation
```bash
# Clone the repository
git clone <repository-url>
cd study_buddy

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## 📱 Features

### Core Functionality
- **Study Group Management**: Create, join, and manage study groups
- **Session Scheduling**: Schedule and organize study sessions
- **Note Sharing**: Upload and share study materials
- **Real-time Collaboration**: Live chat and document collaboration
- **User Authentication**: Secure login and profile management

### Technical Features
- **Cross-platform**: iOS and Android support
- **Modern UI**: Material 3 design with Morehouse branding
- **Offline Support**: Basic functionality without internet
- **Push Notifications**: Real-time updates and reminders

## 🏗️ Architecture

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── screens/                  # UI screens
│   ├── splash_screen.dart    # Animated splash screen
│   └── home_screen.dart      # Main navigation screen
├── models/                   # Data models
├── services/                 # Business logic
├── utils/                    # Helper functions
└── widgets/                  # Reusable components
```

### Dependencies
- `flutter_animate`: Smooth animations
- `animated_text_kit`: Text animations
- `google_fonts`: Typography
- `flutter_svg`: SVG support
- `video_player`: Video background support

## 🚀 Deployment Process

### 1. Development Environment

#### Local Development
```bash
# Run in debug mode
flutter run

# Run with specific device
flutter run -d <device-id>

# Hot reload for development
flutter run --hot
```

#### Testing
```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widget_test.dart

# Generate test coverage
flutter test --coverage
```

### 2. Build Process

#### Android Build
```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release

# App bundle for Play Store
flutter build appbundle --release
```

#### iOS Build
```bash
# Debug build
flutter build ios --debug

# Release build
flutter build ios --release

# Archive for App Store
flutter build ipa --release
```

#### Web Build
```bash
# Debug build
flutter build web --debug

# Release build
flutter build web --release
```

### 3. CI/CD Pipeline

#### GitHub Actions Workflow
The project uses automated CI/CD with the following stages:

1. **Code Quality Checks**
   - Static analysis with `flutter analyze`
   - Code formatting with `flutter format`
   - Dependency validation

2. **Testing**
   - Unit tests execution
   - Widget tests
   - Integration tests

3. **Build Process**
   - Android APK generation
   - iOS IPA generation
   - Web build compilation

4. **Security Scan**
   - Dependency vulnerability check
   - Code security analysis

5. **Deployment**
   - Staging deployment for testing
   - Production deployment after approval

### 4. Environment Configuration

#### Development
- **Database**: SQLite (local)
- **API**: Mock services
- **Authentication**: Development Firebase project
- **Storage**: Local file system

#### Staging
- **Database**: Firebase Firestore (staging)
- **API**: Staging backend services
- **Authentication**: Staging Firebase project
- **Storage**: Firebase Storage (staging)

#### Production
- **Database**: Firebase Firestore (production)
- **API**: Production backend services
- **Authentication**: Production Firebase project
- **Storage**: Firebase Storage (production)

### 5. Platform-Specific Deployment

#### Android Deployment

##### Google Play Store
1. **Prepare Release Build**
   ```bash
   flutter build appbundle --release
   ```

2. **Sign the Bundle**
   ```bash
   jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \
     -keystore ~/upload-keystore.jks \
     build/app/outputs/bundle/release/app-release.aab \
     upload
   ```

3. **Upload to Play Console**
   - Create new release in Google Play Console
   - Upload signed AAB file
   - Configure release notes and metadata
   - Submit for review

##### Internal Testing
```bash
# Build for internal testing
flutter build apk --release

# Distribute via Firebase App Distribution
firebase appdistribution:distribute build/app/outputs/flutter-apk/app-release.apk \
  --app <firebase-app-id> \
  --groups "testers"
```

#### iOS Deployment

##### App Store Connect
1. **Prepare Release Build**
   ```bash
   flutter build ipa --release
   ```

2. **Archive and Upload**
   - Open Xcode
   - Archive the project
   - Upload to App Store Connect
   - Configure app metadata and screenshots

##### TestFlight
```bash
# Build for TestFlight
flutter build ipa --release

# Upload to TestFlight via Xcode
# Or use fastlane for automation
```

#### Web Deployment

##### Firebase Hosting
```bash
# Build web version
flutter build web --release

# Deploy to Firebase Hosting
firebase deploy --only hosting
```

##### Other Platforms
- **Netlify**: Connect repository for automatic deployment
- **Vercel**: Deploy with Vercel CLI
- **GitHub Pages**: Configure GitHub Actions for deployment

### 6. Monitoring and Analytics

#### Firebase Analytics
```dart
// Initialize Firebase Analytics
await Firebase.initializeApp();
FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// Track custom events
await analytics.logEvent(
  name: 'study_group_created',
  parameters: {'subject': 'Computer Science'},
);
```

#### Crash Reporting
```dart
// Initialize Crashlytics
FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;

// Report custom errors
crashlytics.recordError(error, stackTrace);
```

### 7. Performance Optimization

#### Build Optimization
```bash
# Analyze app size
flutter build apk --analyze-size

# Optimize images and assets
flutter build apk --tree-shake-icons

# Enable R8 optimization for Android
flutter build apk --release --obfuscate --split-debug-info=build/debug-info
```

#### Runtime Optimization
- Implement lazy loading for images
- Use const constructors where possible
- Optimize widget rebuilds
- Implement proper state management

### 8. Security Considerations

#### Code Signing
- **Android**: Use upload keystore for Play Store
- **iOS**: Configure code signing in Xcode
- **Web**: Use HTTPS for all connections

#### Environment Variables
```bash
# Store sensitive data in environment variables
export FIREBASE_API_KEY="your-api-key"
export FIREBASE_PROJECT_ID="your-project-id"
```

### 9. Rollback Strategy

#### Automatic Rollback
- Monitor error rates and performance metrics
- Automatic rollback on critical issues
- Feature flag toggles for quick fixes

#### Manual Rollback
1. Identify the issue
2. Stop new deployments
3. Rollback to previous stable version
4. Verify system stability
5. Investigate root cause

## 📊 Testing Strategy

### Test Types
- **Unit Tests**: Business logic validation
- **Widget Tests**: UI component testing
- **Integration Tests**: End-to-end user flows
- **Performance Tests**: Load and stress testing

### Test Execution
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/unit/auth_service_test.dart

# Run with coverage
flutter test --coverage
```

## 🔧 Configuration

### Environment Setup
```bash
# Copy environment template
cp .env.example .env

# Configure environment variables
FIREBASE_API_KEY=your_api_key
FIREBASE_PROJECT_ID=your_project_id
```

### Firebase Configuration
1. Create Firebase project
2. Add Android and iOS apps
3. Download configuration files
4. Place in appropriate directories

## 📚 Documentation

### Additional Resources
- [Test Plan](./test/test_plan.pdf) - Detailed test cases
- [DevOps Workflow](./docs/devops_workflow.pdf) - CI/CD documentation
- [DevOps Diagram](./docs/devops_diagram.svg) - Visual workflow diagram

### API Documentation
- [Backend API Docs](./docs/api.md)
- [Database Schema](./docs/database.md)

## 🤝 Contributing

### Development Workflow
1. Create feature branch
2. Implement changes
3. Write tests
4. Submit pull request
5. Code review
6. Merge to main

### Code Standards
- Follow Flutter style guide
- Write comprehensive tests
- Update documentation
- Use conventional commits

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation

---

**StudyBuddy** - Empowering students to study smarter, together. 🎓
