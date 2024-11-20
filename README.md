# 📱 Phone Authentication with Firebase  

This project demonstrates a simple **phone authentication mechanism** using **Firebase** in Flutter. It provides a clean and efficient way to verify phone numbers through OTP (One Time Password) and navigate to the next screen after successful authentication.  

---

## 📚 Table of Contents  

- [Project Overview](#project-overview)  
- [Features](#features)  
- [Prerequisites](#prerequisites)  
- [Setup Instructions](#setup-instructions)  
  - [Firebase Setup](#firebase-setup)  
    - [Firebase Configuration for Android](#firebase-configuration-for-android)  
    - [Firebase Configuration for iOS](#firebase-configuration-for-ios)  
- [Usage](#usage)  
- [Contributing](#contributing)  
- [License](#license)  

---

## 📝 Project Overview  

This Flutter application integrates Firebase for **phone authentication**. It verifies a user's phone number by sending an OTP (One Time Password) and navigating the user to a profile selection screen upon successful verification.  

The app supports both Android and iOS, with Firebase configured accordingly for both platforms.  

---

## 🎨 Screenshots  

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/7cb5d4a6-f647-4703-a0d0-05f5c7618ec7" alt="Frame" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/b6d45513-7a0e-4a13-acb0-225db3eb3f7e" alt="Mobile Number 001" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/9abeb290-7640-4b06-b5d4-3276f6c09215" alt="Verify Phone" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/ff26b94f-0676-4eb5-ba42-da1bed5fb913" alt="Profile Selection" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/18b40df5-d81e-4444-8f93-f2683d69b3e4" alt="Profile Selection 001" width="200"/></td>
  </tr>
</table>  

---

## ✨ Features  

- **Phone number authentication** using Firebase.  
- **OTP Verification**: Real-time validation of OTP input.  
- **Navigation** to profile selection screen upon successful OTP verification.  
- Seamless **Firebase integration** for authentication and backend functionality.  
- **Cross-platform support** for Android and iOS.  

---

## 🛠 Prerequisites  

Before starting, ensure the following are installed:  

- **Flutter** (> 2.0)  
- **Dart SDK**  
- **Firebase Account**  
- **Android Studio** / **Visual Studio Code** (for development)  
- **Xcode** (for iOS development on macOS)  

Additionally, you'll need to create a Firebase project and configure it for Android and iOS (details below).  

---

## 🚀 Setup Instructions  

### Clone the Repository  

```bash  
git clone https://github.com/YashAhirrao18/phone_auth.git  
cd phone_auth  
```  

### Install Dependencies  

```bash  
flutter pub get  
```  

### Firebase Setup  

Firebase setup is required for both Android and iOS platforms.  

#### Firebase Configuration for Android  

1. **Go to Firebase Console**:  
   - Navigate to [Firebase Console](https://console.firebase.google.com).  
   - Create a new project if you haven't already.  

2. **Add an Android App**:  
   - Register your app with the package name `com.example.phone_auth` (or the actual package name of your app).  
   - Download the `google-services.json` file.  

3. **Add Firebase SDK**:  
   - Place `google-services.json` in the `android/app/` directory.  

4. **Add SHA1 and SHA256 Fingerprints**:  
   - Run the following command to get the SHA1 and SHA256 fingerprints:  
     ```bash  
     keytool -list -v -keystore ~/.android/debug.keystore  
     ```  
   - Add these fingerprints to **Project settings > Your apps > Android > SHA certificate fingerprints**.  

5. **Enable Phone Sign-In**:  
   - Navigate to **Authentication > Sign-In Method** in the Firebase Console.  
   - Enable the **Phone** sign-in provider.  

6. **Sync Firebase SDK**:  
   - Add the following in `android/build.gradle`:  
     ```gradle  
     classpath 'com.google.gms:google-services:4.3.15'  
     ```  
   - Apply the plugin in `android/app/build.gradle`:  
     ```gradle  
     apply plugin: 'com.google.gms.google-services'  
     ```  

#### Firebase Configuration for iOS  

1. **Add an iOS App**:  
   - Register your iOS app in the Firebase Console.  
   - Download the `GoogleService-Info.plist` file.  

2. **Add the `.plist` File**:  
   - Add the file to the `ios/Runner` project in Xcode.  

3. **Enable Phone Sign-In**:  
   - In **Authentication > Sign-In Method**, enable the **Phone** sign-in provider.  

4. **Configure URL Schemes**:  
   - Copy the **REVERSED_CLIENT_ID** from `GoogleService-Info.plist`.  
   - Add the following to `ios/Runner/Info.plist`:  
     ```xml  
     <key>CFBundleURLTypes</key>  
     <array>  
       <dict>  
         <key>CFBundleURLSchemes</key>  
         <array>  
           <string>YOUR_REVERSED_CLIENT_ID</string>  
         </array>  
       </dict>  
     </array>  
     ```  

5. **Install CocoaPods**:  
   - In the `ios/` directory, run:  
     ```bash  
     pod install  
     ```  

---

## ▶️ Usage  

1. Open the app on your device/emulator.  
2. Enter your phone number and click "Send OTP".  
3. Input the OTP received on your phone.  
4. Upon successful verification, proceed to the Profile Selection screen.  

---

## 🤝 Contributing  

Contributions are welcome! Feel free to open issues or submit pull requests.  

---

## 📜 License  

This project is licensed under the [MIT License](LICENSE).  

--- 

This README includes all your requested Firebase setup details and a clean layout. Let me know if further adjustments are needed!