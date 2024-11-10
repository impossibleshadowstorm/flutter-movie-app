import 'package:flutter/material.dart';
import '../screens/details_screen.dart';

class SearchedMoviesSlider extends StatelessWidget {
  const SearchedMoviesSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 8.0, // Space between columns
        mainAxisSpacing: 8.0, // Space between rows
        childAspectRatio: 0.75, // Aspect ratio of each item
      ),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  movie: snapshot.data![index],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 200,
              width: 150,
              child: Image.network(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                '${snapshot.data![index].posterPath}',
              ),
            ),
          ),
        );
      },
    );
  }
}
