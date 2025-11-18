# Flutter Projects

Colección de proyectos desarrollados en **Flutter** para demostrar diferentes conceptos, funcionalidades y patrones de desarrollo mobile.

## 📋 Tabla de Contenidos

- [Requisitos Previos](#requisitos-previos)
- [Proyectos](#proyectos)
- [Instalación y Ejecución](#instalación-y-ejecución)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)

## 📦 Requisitos Previos

- Flutter SDK (v3.0 o superior)
- Dart SDK
- Android Studio / Xcode (para emuladores)
- Git

## 🚀 Proyectos

### 1. **IMC Calculator App** 📊
Calculadora de Índice de Masa Corporal

**Descripción:**
Aplicación interactiva que calcula el Índice de Masa Corporal (IMC) a través de la fórmula estándar. El usuario ingresa su peso (kg), altura (m) y edad para obtener una evaluación visual de su estado de salud corporal.

**Características principales:**
- Interfaz intuitiva con campos de entrada validados
- Cálculo automático del IMC
- Clasificación visual (bajo peso, normal, sobrepeso, obeso)
- Historial de cálculos
- Diseño responsive

**Tecnologías:**
- Flutter
- Dart
- Material Design

**Cómo ejecutar:**
```bash
cd imc_calculator_app
flutter pub get
flutter run
```

---

### 2. **Maps App** 🗺️
Integración de Google Maps

**Descripción:**
Aplicación de demostración que integra y prueba la funcionalidad básica de Google Maps. Permite visualizar mapas interactivos, marcar ubicaciones, navegar y explorar características cartográficas.

**Características principales:**
- Visualización de mapas en tiempo real
- Marcadores personalizados (markers)
- Zoom y navegación interactiva
- Búsqueda de ubicaciones
- Integración con Google Maps API

**Tecnologías:**
- Flutter
- Google Maps API
- google_maps_flutter (package)
- Geolocalization

**Cómo ejecutar:**
```bash
cd maps_app
flutter pub get
flutter run
```

---

### 3. **Settings App** ⚙️
Configuración de Aplicación

**Descripción:**
Aplicación orientada a demostrar cómo implementar un sistema de configuración robusto. Incluye ejemplos de modo oscuro/claro, preferencias de usuario y gestión de estados persisten.

**Características principales:**
- Modo oscuro/claro (Dark Mode)
- Preferencias de usuario persistentes
- Pantalla de configuración modular
- Gestión de temas y estilos
- SharedPreferences para almacenamiento local

**Tecnologías:**
- Flutter
- Provider / GetX (gestión de estado)
- SharedPreferences
- Material Design

**Cómo ejecutar:**
```bash
cd settings_app
flutter pub get
flutter run
```

---

### 4. **Sopa Quiz Example** 🔤🧩
Juego de Sopa de Letras + Trivia

**Descripción:**
Aplicación gamificada que combina la mecánica de un juego de sopa de letras con preguntas de trivia. El usuario selecciona categorías temáticas y debe encontrar palabras ocultas mientras responde preguntas relacionadas.

**Características principales:**
- Múltiples categorías temáticas
- Generación dinámica de sopas de letras
- Sistema de preguntas y trivia integrado
- Efectos de sonido y feedback visual
- Sistema de puntuación y niveles
- Temporizador de juego
- Persistencia de puntuaciones altas

**Tecnologías:**
- Flutter
- Dart (algoritmos de generación)
- Audioplayers (para sonidos)
- Provider (gestión de estado)

**Cómo ejecutar:**
```bash
cd sopa_quiz_example
flutter pub get
flutter run
```

---

### 5. **Superhero App** 🦸
Buscador de Superhéroes

**Descripción:**
Aplicación de búsqueda que permite encontrar información detallada sobre superhéroes utilizando una API externa. Muestra datos como poderes, biografía, apariciones en cómics y películas.

**Características principales:**
- Búsqueda en tiempo real de superhéroes
- Consumo de API REST
- Visualización de detalles (poderes, biografía, estadísticas)
- Favoritos guardados localmente
- Imágenes de alta calidad
- Caché de datos
- Manejo de errores y estados de carga

**Tecnologías:**
- Flutter
- Dart
- HTTP / Dio (peticiones HTTP)
- JSON parsing
- SuperheroAPI (https://www.superheroapi.com/)
- SQLite o Hive (para favoritos)

**Cómo ejecutar:**
```bash
cd superhero_app
flutter pub get
flutter run
```

---

## 💻 Tecnologías Utilizadas

| Tecnología | Descripción |
|-----------|-----------|
| **Flutter** | Framework UI multiplataforma |
| **Dart** | Lenguaje de programación |
| **Material Design** | Sistema de diseño |
| **APIs REST** | Integración de servicios externos |
| **Google Maps API** | Servicios de mapeo |
| **SharedPreferences** | Almacenamiento local |
| **Provider/GetX** | Gestión de estado |

## 📥 Instalación y Ejecución General

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/tu-usuario/Flutter_Projects.git
   cd Flutter_Projects
   ```

2. **Seleccionar un proyecto:**
   ```bash
   cd nombre_del_proyecto
   ```

3. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

4. **Ejecutar en emulador/dispositivo:**
   ```bash
   flutter run
   ```

5. **Generar APK (Android):**
   ```bash
   flutter build apk --release
   ```

## 📄 Licencia

Este proyecto está bajo licencia MIT.

## 👤 Autor

Pablo - Flutter Developer

---

**¡Gracias por explorar estos proyectos!** Si tienes preguntas o sugerencias, siéntete libre de abrir un issue o contactarme.
