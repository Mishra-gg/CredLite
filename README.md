🚀 CRED Clone – Bill Payment App

A full-stack bill management system inspired by CRED, built by Neeraj Mishra

📌 Overview

CRED Clone is a full-stack bill payment application that lets users:

✔ Log in using JWT-based authentication
✔ View all pending bills
✔ Pay bills (simulated)
✔ Store sensitive notes with AES encryption
✔ Access a mobile UI built in Flutter

This project was created for placements to demonstrate backend development, mobile development, API design, security, testing, and CI/CD.

🛠️ Tech Stack
Frontend

Flutter (Material UI)

Riverpod (state management)

HTTP client

Dart

Backend

Spring Boot (3.x)

Spring Security (JWT)

Spring Data JPA

H2 In-memory Database

AES encryption utility

DevOps

GitHub Actions CI – runs backend tests + Flutter tests

Testing

JUnit (Backend)

Flutter Widget Tests

📁 Project Structure
/
├─ backend_spring/
│  ├─ src/main/java/com/example/demo/
│  │  ├─ controller/
│  │  ├─ service/
│  │  ├─ model/
│  │  ├─ repository/
│  │  ├─ security/   # JWT + AES
│  ├─ src/main/resources/
│  │  ├─ application.properties
│  │  └─ data.sql
│  └─ pom.xml
│
├─ frontend_flutter/
│  ├─ lib/src/services/api_service.dart
│  ├─ lib/src/providers/app_providers.dart
│  ├─ lib/src/screens/
│  ├─ test/widget_test.dart
│  └─ pubspec.yaml
│
├─ .github/workflows/ci.yml
├─ README.md
└─ postman_collection.json  (optional)

🔐 Authentication Flow (JWT)

User sends email + password to /api/auth/login

Backend returns a signed JWT

Flutter stores the token in memory

Every API call includes:

Authorization: Bearer <token>


JwtFilter validates the token for all secured endpoints

If valid → request proceeds

If invalid → 403 Forbidden

🔏 Encryption (AES)

Sensitive fields like encryptedNote are encrypted using AES before saving in the database:

AES key is stored in application.properties (demo purpose only)

BillService encrypts + decrypts the note

🗄️ Database (H2)

H2 in-memory database is used for fast local development.

Seeded using data.sql:

BILL:
- user 1 → electricity, shopping
- user 2 → rent


View DB in browser:

👉 http://localhost:8080/h2-console
JDBC URL: jdbc:h2:mem:credlite

🧪 Run Backend
cd backend_spring
mvn spring-boot:run

Demo Login:
email: test@demo.com
password: 1234

📱 Run Flutter App
cd frontend_flutter
flutter pub get
flutter run

Important

If using Android Emulator, backend URL should be:

http://10.0.2.2:8080


Flutter ApiService:

final apiProvider = Provider((ref) => ApiService(baseUrl: "http://10.0.2.2:8080"));

🌐 API Documentation
🔹 POST /api/auth/login

Body (x-www-form-urlencoded):

email=test@demo.com
password=1234


Response:

<JWT token>

🔹 GET /api/bills

Headers:

Authorization: Bearer <token>

🔹 POST /api/bills/{id}/pay

Marks bill as paid.

🧪 Testing
Backend tests:
cd backend_spring
mvn test

Flutter tests:
cd frontend_flutter
flutter test

🤖 CI/CD Workflow (GitHub Actions)

Located at:

.github/workflows/ci.yml


Runs:

Backend tests (mvn test)

Flutter tests (flutter test)

Flutter build (flutter build apk)

Ensures your project never breaks on new commits.

🧩 Postman Collection

Import postman_collection.json to test all APIs easily.

Included requests:

Login

Get Bills

Pay Bill

🎯 Tradeoffs / Decisions (For Interview)
✔ Chose H2 in-memory

Faster for development; in production would use Postgres.

✔ JWT stored in memory (not persistent)

In real apps, store in secure storage.

✔ No refresh tokens

Simplified flow for demo.

✔ Payment simulated

Real integration with Razorpay/Stripe can be added.

✔ AES key inside config

In production → move to environment variables / Vault.

🚀 Future Enhancements

Add Razorpay integration + webhooks

Add charts (insights screen)

Add secure storage for JWT

Add categories, reminders, due date notifications

Dockerize backend and frontend

Deploy on cloud (Render / AWS)

👨‍💻 Author

Built by: Neeraj Mishra
B.Tech CSE — Full Stack (Spring Boot + Flutter)

🎉 End of README
