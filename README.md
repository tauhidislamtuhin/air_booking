<div align="center">

  <h1>✈️ Air Booking App</h1>
  <p>A seamless, modern, and cross-platform Flight Booking Mobile Application built with Flutter.</p>

  [![Download APK](https://img.shields.io/badge/Download-APK-2ea44f?style=for-the-badge&logo=android&logoColor=white)](https://github.com/tauhidislamtuhin/air_booking/releases/download/v1.0.0/Air.Booking.apk)
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)

</div>

---

## 🌟 Key Features

* **Flight Search & Filtering:** Dynamic airport auto-complete search with real-time route swap capability.
* **Trip Types Support:** Seamless workflow for One-Way, Round Trip, and Multi-City booking.
* **Interactive Selection:** Custom bottom-sheets for date picker, passenger seating, and travel class selection.
* **Dynamic Theme Toggle:** Fully responsive Light and Dark mode UI support with unified color tokens.
* **E-Ticket Generation:** Real-time summary and downloadable digital pass interface after payment confirmation.

---

### ☀️ Light Mode Showcase

| Home | Search Flights | Flight Details | Fill Details | Payment | E-Ticket | Profile |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/50dce7c5-a36d-4a6b-988a-4b3cca8cf91a" width="120" /> | <img src="https://github.com/user-attachments/assets/cd4d4934-ee55-42ed-9f58-380933ff2e88" width="120" /> | <img src="https://github.com/user-attachments/assets/c6954517-122e-4329-a4e3-a8fae24f91f1" width="120" /> | <img src="https://github.com/user-attachments/assets/126749f5-6a2e-4fa6-ab71-89704e8bb4cf" width="120" /> | <img src="https://github.com/user-attachments/assets/dd225d90-c804-42e8-8d9b-75c82875704b" width="120" /> | <img src="https://github.com/user-attachments/assets/4afa9019-5272-40dc-92ea-a4a7ae52c6c8" width="120" /> | <img  src="https://github.com/user-attachments/assets/60c68362-a74d-457e-989d-6bc191ee4fe5" width="120" />

---

### 🌙 Dark Mode Showcase

| Home | Search Flights | Flight Details | Fill Details | Payment | E-Ticket |
| :---: | :---: | :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/7f7bcc61-90ea-4976-b51c-c334a8c57e5e" width="130" /> | <img src="https://github.com/user-attachments/assets/dd0338ad-22bb-4d4a-a890-135ad4128a17" width="130" /> | <img src="https://github.com/user-attachments/assets/1b1a76df-0f0c-4799-8b89-9a13238afe6e" width="130" /> | <img src="https://github.com/user-attachments/assets/b5801165-78db-497c-8259-0ae6ec82ec6c" width="130" /> | <img src="https://github.com/user-attachments/assets/c868903c-b5b6-42bd-aee1-3cfd1cf43fa5" width="130" /> | <img src="https://github.com/user-attachments/assets/5319d589-e9cb-41a8-a568-96c9e129d4aa" width="130" /> |

---

## 🏗️ Architecture & Project Structure

This application follows clean code principles and structured layout design:

```text
lib/
 ├── models/        # Data models (Airport, Flight, Offer, etc.)
 ├── screens/       # Core app screens (Home, Search, Details, Payment, E-Ticket)
 ├── utils/         # Helpers (Custom Colors, Date Formatters, BottomSheets)
 └── widgets/       # Reusable components (TextFields, Buttons, Headers, Cards)

