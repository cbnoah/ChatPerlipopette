# 🐱 ChatPerlipopette

A Flutter mobile application to discover cat breeds from around the world, locate shelters and available kittens, and share your favorite discoveries.

## 📱 Features

- **Breed Catalog** - Browse a comprehensive collection of cat breeds with detailed descriptions
- **Advanced Search** - Find breeds that interest you by name or characteristics
- **Interactive Mapping** - Locate shelters and breeders nearby on an interactive map
- **Geolocation** - Use your location to discover the closest feline resources
- **Social Sharing** - Share your favorite breeds with friends via social networks
- **Intuitive Interface** - Modern and accessible design, compatible with light/dark theme

## 🛠️ Tech Stack

- **Flutter 3.10.0+** - Cross-platform mobile development framework
- **Dart** - Primary programming language
- **flutter_map** (v6.1.0) - Interactive mapping
- **go_router** (v17.1.0) - Navigation and routing
- **geolocator** (v9.0.2) - Geolocation services
- **geocoding** (v2.1.1) - Address-to-coordinates conversion
- **http** (v1.1.0) - HTTP requests for API integration
- **share_plus** (v12.0.1) - Social sharing
- **just_audio** (v0.9.34) - Audio playback (cat sounds 🎵)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.10.0 or higher
- Dart SDK (included with Flutter)
- An emulator or physical device

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/your-username/chatperlipopette.git
cd chatperlipopette
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the application**
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── main.dart              # Entry point and router configuration
├── pages/
│   ├── home.dart         # Home screen with breed catalog
│   ├── search.dart       # Advanced search page
│   └── catsInfos.dart    # Breed details page
├── components/
│   ├── app_shell.dart    # Main app shell
│   ├── cat_carousel_card.dart      # Carousel card for breeds
│   ├── cat_horizontal_card.dart    # Horizontal card layout
│   ├── family_category_carousel.dart # Family category carousel
│   ├── calm_category_section.dart   # Temperament category section
│   ├── search_results.dart         # Search results display
│   ├── section_title.dart          # Section title component
│   ├── introduction_section.dart   # Introduction section
│   └── search_page_container.dart  # Search page container
├── themes/
│   ├── light_theme.dart   # Light theme
│   └── dark_theme.dart    # Dark theme
└── utils/                 # Utilities and helpers
```

## 🎯 Main Pages

### Home (`pages/home.dart`)
- Breed catalog display
- Category carousels
- Temperament sections
- Quick access to searches

### Search (`pages/search.dart`)
- Text search functionality
- Advanced filters
- Results display
- Search suggestions

### Cat Info (`pages/catsInfos.dart`)
- Complete breed details
- Physical characteristics
- Temperament and behavior
- Shelter localization
- Social sharing options

## 📍 Geographic Features

The application uses:
- **Flutter Map** to display shelters and breeders
- **Geolocator** to access user location
- **Geocoding** to convert addresses to coordinates
- An API to fetch available kitten locations

## 🎨 Themes

The application automatically supports:
- **Light Mode** - Clean and bright design
- **Dark Mode** - Easy on the eyes at night
- System theme detection

## 🔐 Permissions

The application requires the following permissions:
- **Location** - To locate nearby shelters and breeders
- **Sharing** - To share your favorite breeds

## 📝 License

This project is private and not published on pub.dev.

## 🐾 About

ChatPerlipopette is an application created with passion for cat lovers worldwide, enabling you to discover cat breeds from around the globe and find the perfect kitten to join your family.

**Tagline** - Meow! 🐱

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs via issues
- Suggest improvements
- Submit pull requests

## 📧 Support

For questions or assistance, please create an issue in the repository.

---

Made with ❤️ for cat lovers.
