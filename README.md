📦 App de Mensajería de Mercancía

Aplicación móvil desarrollada en Flutter para la gestión y seguimiento de envíos de mercancía.

🚀 Descripción del Proyecto
Esta aplicación de mensajería de mercancía está diseñada para facilitar:

📍Visualizar una lista con los pedidos

El proyecto está orientado a dispositivos Android, iOS y Web, aprovechando la arquitectura multiplataforma de Flutter.

🛠️ Tecnologías Utilizadas
Flutter (SDK ^3.10.3)
Dart
Material Design
Cupertino Icons
flutter_launcher_icons (para iconos personalizados)

📱 Plataformas Soportadas

✅ Android
✅ iOS
✅ Web
✅ Windows
✅ macOS

📂 Estructura del Proyecto
app/
│
├── lib/
│   ├── main.dart
│   ├── screens/
│   ├── widgets/
│   └── data/
│
├── assets/
│   ├── images/
│   │   └── Logo.avif
│   └── icon/
│       └── icon.png
│
├── pubspec.yaml
└── README.md

⚙️ Instalación y Configuración
1️⃣ Requisitos Previos

Flutter SDK instalado

Dart SDK
Android Studio / VS Code
Emulador o dispositivo físico

Verifica Flutter con:
flutter doctor
2️⃣ Clonar el Repositorio
git clone git@github.com:villamiljuan14/Enviart-Flutter.git
cd app

3️⃣ Instalar Dependencias
flutter pub get

4️⃣ Ejecutar la Aplicación
flutter run

🎨 Iconos de la Aplicación
Para generar los iconos personalizados:
flutter pub run flutter_launcher_icons
Asegúrate de que el archivo exista:
assets/icon/icon.png