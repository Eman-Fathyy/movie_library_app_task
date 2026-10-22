import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String query = '';
  bool isGridView = true;
  int discount = 20;

  void search(String value) {
    setState(() {
      query = value;
    });
  }

  void changeView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  void changeDiscount() {
    setState(() {
      discount = discount == 20 ? 30 : 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Movie> filteredMovies = movies.where((movie) {
      return movie.title.toLowerCase().contains(query.toLowerCase()) ||
          movie.genre.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: changeView,
            icon: Icon(
              isGridView ? Icons.view_list : Icons.grid_view,
            ),
            tooltip: isGridView ? 'List View' : 'Grid View',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: search,
              decoration: const InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(
              child: Text('No movies found'),
            )
                : isGridView
                ? GridView.builder(
              padding: const EdgeInsets.all(4),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.60,
              ),
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: filteredMovies[index],
                  discount: discount,
                  onDiscountTap: changeDiscount,
                );
              },
            )
                : ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                Movie movie = filteredMovies[index];

                return ListTile(
                  leading: Image.asset(
                    movie.image,
                    width: 50,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie.title),
                  subtitle: Text(
                    '${movie.genre} • ${movie.year}',
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('⭐ ${movie.rating}'),
                      GestureDetector(
                        onTap: changeDiscount,
                        child: Text(
                          '$discount% OFF',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}