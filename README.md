# Flutter Movie App

A simple Flutter app that fetches movie data from the TVMaze API, displays a list of movies, and provides a detailed view for each movie. The app also features a search screen that allows users to search for movies.

## Features

- **Home Screen**: Displays a list of trending movies.
- **Top Movies Screen**: Displays a list of top-rated movies.
- **Movie Details Screen**: Shows detailed information about a movie.
- **Search Screen**: Allows users to search for movies by name.
- **Debounced Search**: Efficiently fetches movie data as the user types in the search box.

## Technologies Used

- **Flutter**: The framework used to build the app.
- **Dart**: The programming language used in Flutter.
- **TVMaze API**: Provides movie data.
- **HTTP**: For making network requests to fetch data from the API.
- **Google Fonts**: For custom fonts in the app.
- **FutureBuilder**: Used to handle asynchronous data loading and display data dynamically.
- **GridView/ListView**: For displaying movie posters in a grid or list format.

## Setup Instructions

### Prerequisites

- **Flutter SDK**: You must have Flutter installed on your machine.
- **API Key**: The app fetches data from the TVMaze API (no authentication is required).

### Steps to Run the Project

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/flutter_movie_app.git
    ```
2. Navigate to the project directory:
    ```bash
   cd flutter_movie_app
    ```
3. Install the dependencies:
    ```bash
   flutter pub get
    ```
4. Run the app:
    ```bash
   flutter run
    ```

## API Endpoints

The app uses the following TVMaze API endpoints:
* Trending Movies: https://api.tvmaze.com/search/shows?q=all
* Search Movies: https://api.tvmaze.com/search/shows?q={search_query}

## File Structure

```bash
lib/
├── api/
│   └── api.dart           # Handles API requests
├── models/
│   └── movie.dart         # Movie data model
├── screens/
│   ├── home_screen.dart   # Home screen showing trending movies
│   ├── details_screen.dart # Movie details screen
│   └── main_screen.dart # Main screen with Bottom Navigation bar
│   └── search_screen.dart # Search screen
├── widgets/
│   ├── movies_slider.dart # Widget for displaying movies in a slider
│   └── searched_movies_slider.dart # Widget for displaying searched movies
│   └── trending_slider.dart # Widget for displaying trending movies
│   └── back_button.dart # Widget for back button
└── main.dart               # Entry point of the app
└── colors.dart               # Colors used in the app
```

## Contributing

* Fork this repository.
* Create a new branch (git checkout -b feature-name).
* Commit your changes (git commit -am 'Add new feature').
* Push to the branch (git push origin feature-name).
* Open a pull request.