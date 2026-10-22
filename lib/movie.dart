
class Movie {
final String title;
final String genre;
final int year;
final double rating;
final String image;

const Movie({
required this.title,
required this.genre,
required this.year,
required this.rating,
required this.image,
});
}

final List<Movie> movies = [
const Movie(
title: 'Shutter Island',
genre: 'Mystery',
year: 2010,
rating: 8.2,
image: 'assets/posters/shutter-island.jpg',
),
const Movie(
title: 'Good Will Hunting',
genre: 'Drama',
year: 1997,
rating: 8.3,
image: 'assets/posters/good will hunting1.jpg',
),
const Movie(
title: 'Interstellar',
genre: 'Sci-Fi',
year: 2014,
rating: 8.7,
image: 'assets/posters/interstellar.jpeg',
),
const Movie(
title: 'Seven',
genre: 'Crime',
year: 1995,
rating: 8.6,
image: 'assets/posters/Seven.jpg',
),
const Movie(
title: 'Public Enemies',
genre: 'Crime',
year: 2009,
rating: 7.0,
image: 'assets/posters/public enemies.jpg',
),
const Movie(
title: 'Inception',
genre: 'Sci-Fi',
year: 2010,
rating: 8.8,
image: 'assets/posters/inception.jpeg',
),
const Movie(
title: 'Harry Potter',
genre: 'Fantasy',
year: 2001,
rating: 7.6,
image: 'assets/posters/harry potter.jpg',
),
const Movie(
title: 'The Amazing Spider-Man',
genre: 'Action',
year: 2012,
rating: 6.9,
image: 'assets/posters/amazing-spiderman.jpg',
),
];

