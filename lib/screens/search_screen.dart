import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/searched_movie_slider.dart';
import '../models/movie.dart';
import '../api/api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Movie>> searchedMovies;

  // Controller for the text field
  final TextEditingController _searchController = TextEditingController();

  // For debouncing, we will store the last search timer
  late Timer _debounce;

  // This will hold the current search query
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    // Initializing the debounce timer
    _debounce = Timer.periodic(const Duration(milliseconds: 300), (_) {});
  }

  @override
  void dispose() {
    _debounce.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Box with icon
            TextField(
              controller: _searchController,
              onChanged: (query) {
                // Cancel the previous debounce timer
                if (_debounce.isActive) _debounce.cancel();
                // Start a new debounce timer
                _debounce = Timer(const Duration(milliseconds: 300), () {
                  setState(() {
                    _currentQuery = query;
                  });
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search for movies...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: FutureBuilder<List<Movie>>(
                future: _currentQuery.isNotEmpty
                    ? Api().fetchMovies(_currentQuery)
                    : Future.value([]),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(child: Text('No results found.'));
                    }
                    return SearchedMoviesSlider(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
