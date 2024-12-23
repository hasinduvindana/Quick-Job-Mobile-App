**QuickJob Mobile Application**

**File Structure  : **

quickjob/

├── lib/

│   ├── main.dart

│   ├── firebase_options.dart         # Firebase initialization (auto-generated by Firebase CLI)

│   ├── components/                  # Reusable widgets

│   │   ├── rounded_button.dart

│   │   ├── hover_effect.dart

│   ├── models/                      # Data models

│   │   ├── employee_model.dart

│   │   ├── publisher_model.dart

│   ├── screens/

│   │   ├── landing_page.dart        # Landing page

│   │   ├── employee_register.dart   # Employee register page

│   │   ├── publisher_register.dart  # Publisher register page

│   │   ├── login_page.dart          # Login page

│   │   ├── employee_dashboard.dart  # Employee dashboard

│   │   ├── publisher_dashboard.dart # Publisher dashboard

│   │   ├── view_ad_page.dart        # View ad details

│   │   ├── list_new_ad.dart         # List new ad

│   ├── services/                    # Firebase CRUD operations

│   │   ├── auth_service.dart

│   │   ├── database_service.dart

│   ├── utils/                       # Utility functions

│       ├── validators.dart

│       ├── constants.dart




**Clone Project    : ** git clone https://github.com/hasinduvindana/Quick-Job-Mobile-App

**Change directory :**  cd quickjob

**Run application  :**  flutter run


Tasks Completed - [28/11/2024]
1. Firebase Integration
   
Configured Firebase with google-services.json and GoogleService-Info.plist.

Integrated Firebase packages:

firebase_core: ^2.16.0

firebase_auth: ^4.6.0

cloud_firestore: ^4.6.0

2. Assets Management
   
Added assets/logo.png to the project.

Updated pubspec.yaml to include the asset under the flutter section.

3. Code Fixes
   
Undefined Method: Fixed the LandingPage error in main.dart.

Private Types: Resolved library_private_types_in_public_api warnings in employee_register.dart, login_page.dart, and other files.

Logging: Replaced print statements in auth_service.dart and database_service.dart with a proper logging framework.

4. Dependencies Used
   
flutter_lints: ^4.0.0 (for linting)

provider: ^5.0.0 (for state management)

5. Testing & Debugging
   
Verified image loading and resolved assets/logo.png not found issue.

Checked functionality of Firebase authentication and Firestore database connections.


