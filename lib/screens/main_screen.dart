import 'package:flutter/material.dart';
import '../api/api.dart';
import '../models/movie.dart';
import './search_screen.dart';
import './home_screen.dart';
import '../colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topMoviesList;
  late Future<List<Movie>> upcomingMovies;

  int _selectedIndex = 0; // Track the selected tab index

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topMoviesList = Api().getTopRatedMovies();
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
