<div align="center">
<!-- TODO: add link to website once it is ready -->
<h1><a href="https://nestorbird.com/notibell/" _blank=true>NotiBell</a></h1>
Manage approvals at your fingertips
</div>

# NotiBell Flutter App

## About

<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
<img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" /> 
<img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" />

NotiBell offers a transformative solution, revolutionizing your approval processes and empowering your business. Say Goodbye to missed transactions, delayed approvals, and overlooked quality requests.

With NotiBell, you can easily control your business approvals and related activities, ensuring you never miss an approval again. Seamlessly manage approvals, streamline check-ins, and enable informed decision-making with our advanced features.
Experience the future of efficient operations with facial recognition for precise attendance tracking, automated approvals for sales orders, payments, and stock, and real-time progress monitoring.

Enjoy secure, cross-platform compatibility and personalized insights, all while reducing delays and enhancing efficiency.
Get Notified, Get Ahead with NotiBell!

### Features
1. ERP Approvals on the go. You can approve/reject any approvals like Purchase Orders, Sales Orders, Leave Applications, etc. directly through your mobile app.
2. You can get push notifications for approvals on your mobiles.
3. Check-in and Check-out feature through face recognition.


## Project Requirements and Dependencies

The very first requirement to run this mobile app is, that you should set up the active & working Frappe ERPNext instance. To set up the ERPNext you can visit [here](https://github.com/frappe/erpnext#readme).
After setting up the instance you need to install the [NotiBell](https://frappecloud.com/marketplace/apps/notibell) custom app from Frappe Marketplace

The following are the requirements that you'll need to run the mobile app - 

1. [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)
2. Flutter SDK installation
3. Android SDK
4. [XCode](https://developer.apple.com/xcode/) (if working on MacOS for iOS)
5. Apple SDK (if working on MacOS for iOS)
6. Virtual or physical Android or iOS Device for testing

## How to Setup and Run the Mobile App

Follow the following steps to set up and run the mobile app -

1. First, clone the project from the [Development branch](https://github.com/nestorbird/NotiBell/tree/Development).
2. Open the project in Android Studio or in Visual Studio Code.
3. Open the terminal and run the command - ```flutter pub get```. This command will remove all the errors that you are getting in the project.
4. Select the target device from the device explorer menu.
5. Run the project by pressing Function + F5 or execute the command - ```flutter run``` from the terminal.

## How to Make Use of The Project

Users can log in with their user credentials along with the instance URL. 

<a href="https://github.com/nestorbird/NotiBell-Flutter-App/assets/145128044/a8537d90-26fe-4d51-91b8-e076a6c7ca05" target="blank"><img align="center" src="https://github.com/nestorbird/NotiBell-Flutter-App/assets/145128044/a8537d90-26fe-4d51-91b8-e076a6c7ca05" height="500" /></a>

At the Home Screen, Users will have the option to check the approvals and their past approvals as well.

<a href="https://github.com/nestorbird/NotiBell-Flutter-App/assets/145128044/eb57f4a6-b308-4e50-9cfa-d69024423398" target="blank"><img align="center" src="https://github.com/nestorbird/NotiBell-Flutter-App/assets/145128044/eb57f4a6-b308-4e50-9cfa-d69024423398" height="500" /></a>

When the user checks for the approvals, they will get the list of approvals on which the user can check who the sender of the approval is, its ID, doctype, status, etc. from where they can either discard the approval or take action on it, as per the configured workflow.

If users tap on the card, then they will move on to the Approval Details Screen.

<a href="https://github.com/nestorbird/NotiBell-Flutter-App/assets/145128044/1e2fb173-7443-4d4a-8cef-bee84eb4d657" target="blank"><img align="center" src="https://github.com/nestorbird/NotiBell-Flutter-App/assets/145128044/1e2fb173-7443-4d4a-8cef-bee84eb4d657" height="500" /></a>

On the Approval Detail screen, the user can view the details of the doctype. From this screen also the user is allowed to take the actions and discard the approvals.

<a href="https://github.com/nestorbird/NotiBell-Flutter-App/assets/145128044/359ef054-01b4-422e-9547-89911ae2aee5" target="blank"><img align="center" src="https://github.com/nestorbird/NotiBell-Flutter-App/assets/145128044/359ef054-01b4-422e-9547-89911ae2aee5" height="500" /></a>

## License
MIT License (see [License](https://github.com/nestorbird/NotiBell/blob/Development/LICENSE))

The NotiBell Mobile App code is licensed as MIT license and the Documentation is licensed as Creative Commons (CC-BY-SA-3.0) and the copyright is owned by NestorBird India Private Limited and Contributors.

By contributing to NotiBell, you agree that your contributions will be licensed under MIT license.
