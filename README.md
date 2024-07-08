# BODFiT Nutrition and Fitness Mobile Application
- This is the link to the video demo of our app : https://youtu.be/Via1ebsCK8I

### Link to the Firebase Console
- https://console.firebase.google.com/u/0/project/bodfit-6f6ce/authentication/providers

## Members (Group 5):
- Oche David Ankeli
- Isaiah Essien
- David Okonkwo

## 1.0 Summary of BODFiT Mobile Application

### 1.1 Problem Statement
According to the 2020 Global Nutrition Report, Nigeria faces a double burden of obesity and underweight with limited access to nutrition and fitness solutions. Obesity levels are rising in both children and adults, with 13.1% of women and 4.6% of men now considered obese (Global Nutrition Report, 2022). Busy lifestyles, limited access to fitness facilities, lack of nutrition awareness, health consequences, and socioeconomic factors contribute to the problem.

### 1.2 Addressing the Problem
Developing a mobile app tailored to the Nigerian context can mitigate these issues by providing accessible nutrition and feeding suggestions, simple home workout routines, and personalized fitness and nutrition plans. By addressing critical health challenges and promoting well-being and health, BODFiT falls under the Healthcare GCGO. We have designed the BODFiT app to be a for-profit venture and humanitarian initiative.

### 1.3 Project Scope
The project involves developing a mobile application (BODFiT) using Flutter, designed to provide comprehensive nutrition and fitness solutions tailored specifically for Nigerians.

### 1.4 Purpose and Impact of BODFiT
The BODFiT app aims to develop a mobile application tailored to Nigerians' unique nutrition and fitness needs. It seeks to provide personalized diet and fitness plans, simple home workout routines, and accessible health information to help users achieve their health goals. The app aims to empower users to lead healthier lives and make informed decisions about their well-being. The impact of this project will be far-reaching, improving the overall health and well-being of Nigerians across various demographics by providing accessible and personalized nutrition and fitness solutions.

## 2.0 Deliverables
- Fully functional mobile application (Android and iOS) with all key features.
- Documentation of the app's design, development process, and user guides.
- Marketing materials for app promotion.
- Post-launch support and maintenance plan.

## 3.0 Project Phases
1. Planning and Research
2. Design and Development
3. Testing and Quality Assurance
4. Deployment and Launch
5. Maintenance and Updates

## 4.0 Key Components
- **User Registration and Authentication**
- **Personalized Dashboard**
- **Nutrition and Feeding Suggestions**
- **Nutritional Information**
- **Fitness and Workout Routines**
- **Health and Wellness Resources**
- **Community**

## 5.0 Key Functionalities of BODFiT App

### User Authentication
- **Sign Up:** New users can create an account using their email and password.
- **Log In:** Existing users can log in with their email and password.
- **Log Out:** Users can log out of their accounts securely.

### Splash Screen
- Displays the BODFiT logo and a loading animation while the app initializes.
- Automatically transitions to the authentication screen after a brief delay.

### Home Screen with Navigation
- A main screen featuring a bottom navigation bar with four sections: Dashboard, Nutrition, Workouts, and Profile.
- Users can easily switch between these sections to access different functionalities.

### Dashboard Screen
- Provides an overview of the user's fitness and nutrition metrics.
- Displays summary information such as daily caloric intake, exercise duration, and progress towards goals.

### Nutrition Screen
- Offers nutritional information, including meal plans and recipes for Nigeria.
- Users can view detailed information about different foods and their nutritional content.
- Includes features to track daily meals and caloric intake.

### Workout Screen
- Lists various workout routines and exercises based on categories.
- Users can browse through different workout plans tailored to their fitness goals.
- Includes instructions and visual aids for each exercise to ensure proper form.

### Profile Screen
- Displays user profile information such as name, age, weight, and fitness goals.
- Allows users to update their profile details and preferences.
- Provides access to app settings and account management features.

### Community Screen
- Contains FAQ section.
- Has a chat space where users can post and interact with each other on fitness and nutrition matters.

### Subscription Option
- Offers a straightforward subscription option for users to access premium features.
- Users can choose between a monthly or yearly subscription.
- The subscription unlocks exclusive benefits such as advanced workouts and personalized meal plans.

## 6.0 Detailed App Flow

### Launch the App
- The app starts with a Splash Screen displaying the BODFiT logo and a loading animation.
- After a brief delay, the app transitions to the Authentication Screen.

### User Authentication
- **Sign Up:** Users create an account by providing their email and password. Upon successful registration, they are redirected to the Home Screen.
- **Log In:** Existing users enter their email and password to log in. Successful authentication takes them to the Home Screen.
- **Log Out:** Users can log out from their account via the Profile Screen, which redirects them back to the Authentication Screen.

### Home Screen Navigation
- The home screen features a bottom navigation bar with four icons: Dashboard, Nutrition, Workouts, and Profile.
- Tapping each icon switches the view to the corresponding screen.

### Dashboard Screen
- Shows a summary of the user's daily activities and health metrics.
- Provides a quick overview of caloric intake, exercise duration, and progress towards fitness goals.

### Nutrition Screen
- Users can browse Nigerian meal plans and recipes.
- Detailed nutritional information is provided for each food item.
- Users can track their daily meals and caloric intake to ensure they are meeting their nutritional goals.

### Workout Screen
- Lists various workout routines tailored to different fitness goals (e.g., strength training, cardio, flexibility).
- Each workout routine includes a list of exercises with detailed instructions and visual aids.
- Users can track their workout progress and mark completed exercises.

### Profile Screen
- Displays user information such as name, age, weight, and fitness goals.
- Users can edit their profile details and update their preferences.
- Provides access to app settings, subscription management, and the option to log out.

### Community Screen
- Contains FAQ section.
- Has a chat space where users can post and interact with each other on fitness and nutrition matters.

### Subscription Option
- Offers a straightforward subscription option for users to access premium features.
- Users can choose between a monthly or yearly subscription.
- The subscription unlocks exclusive benefits such as advanced workouts and personalized meal plans.

## Project Folder Structure

BODFiT/
├── android/
├── assets/
│ ├── images/
│ └── gifs/
│ └── icons/
│ └── logos/
├── ios/
├── lib/
│ ├── components/
│ ├── models/
│ ├── screens/
│ │ ├── auth/
│ │ ├── dashboard/
│ │ ├── nutrition/
│ │ ├── profile/
│ │ └── workout/
│ ├── services/
│ ├── utils/
│ └── main.dart
│ └── app.dart
├── test/
└── README.md

## Important Notes:
- The Utils folder contain all the app logis and background configurations, like themes, modes, coversions, constatsnts , images and text strings, etc.

- There are some unused files which are added to the Unused files folder. The files are files which, at one point, were potential widgets, but were upadted. We believe those files may be handy in future projects. 

- All modules crry comments and documantations.

## To see the project:
1. clone the repository https://github.com/Isaiah-Essien/BodFit
2. cd into BodFit
3. run flutter pub get
4. run flutter run
5. choose an emulator

## Rights:

- This project soley belongs to the aforementioned members of the Group 5, hereafter refferd to as Authors.
- The Authors reserve the rights to this project within and without the settings of the African Leadership University.
- This repository must not be forked at any insatance. Contact the Authours for contributions

