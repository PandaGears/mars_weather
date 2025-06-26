# 🌤️ Flutter Weather App

A clean, modular weather app built in Flutter that uses the OpenWeatherMap API to fetch current weather and a 5-day forecast. Users can enter any city to get real-time weather data, styled with dynamic gradients and weather icons.

---

## 📲 Features

- 🔎 Search weather by city name
- 🌡️ Current weather conditions (temperature, humidity, wind)
- 📅 5-day forecast (midday samples)
- 🖼️ Dynamic background gradient based on weather condition
- 🌈 Weather icons from OpenWeather
- 🧩 Modular architecture with separate models, services, and widgets
- 🔐 Environment-safe API key loading with `.env` file

---

## 🧠 Design Decisions

### 🔧 Architecture

This app is structured into clear logical modules:

lib/
├── models/ # Weather and Forecast data models
├── services/ # API fetching logic
├── widgets/ # UI components (current weather, forecast)
├── utils/ # Gradient helper
├── main.dart # UI state + screen layout


This modular separation:
- Improves maintainability
- Makes testing easier
- Encourages clean code practices

---

### 🎨 UI Design

- **Gradients** visually represent the sky conditions:
    - `Clear` → Yellow to Light blue to sky blue
    - `Rain` → Indigo to grey
    - `Thunderstorm` → Deep purple to black
    - `Snow` → White to blue
    - `Fog/Mist` → Light grey to white
- **Gradient direction** goes from `topCenter` to `bottomCenter` to simulate sky-to-ground fading.

---

### 🌡️ Temperature Unit Choice

We use **Celsius (metric)** by default:
- It’s the **default standard** in OpenWeather’s API with `units=metric`.
- Widely used globally.
- You can change this by modifying the request URL to use:
    - `units=imperial` for Fahrenheit
    - `units=standard` for Kelvin

Example in `weather_service.dart`:
```dart
final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
```
🔐 API Key Security
API keys are stored using the flutter_dotenv package.

Setup:
Create a .env file in /keys/

Add to .gitignore

Load it in main():

```dart
await dotenv.load(fileName: "assets/.env");
```

Access via:
```dart
final apiKey = dotenv.env['OPENWEATHER_API_KEY'];
```
🛠️ Getting Started
1. Clone the repo
  ``` bash
   git clone https://github.com/yourusername/flutter-weather-app.git
   cd flutter-weather-app
   ```
2. Install dependencies
   bash
   Copy
   Edit
   flutter pub get
3. Add your .env file
   Create assets/.env with:

ini
Copy
Edit
OPENWEATHER_API_KEY=your_openweather_api_key
And update pubspec.yaml:
```yaml
flutter:
assets:
- keys/.env
```

4. Run the app
```bash
   flutter run
   ```