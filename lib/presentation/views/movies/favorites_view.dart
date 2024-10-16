import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if(isLoading || isLastPage) return;
    isLoading = true;
    final favoritesMovies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if(favoritesMovies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if(favoritesMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 60, color: colors.primary),
            Text('Oops!!', style: TextStyle(fontSize: 30, color: colors.primary)),
            const SizedBox(height: 10),
            const Text('No hay favoritos...', style: TextStyle(fontSize: 15, color: Colors.black45)),
            const SizedBox(height: 30),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: const Text('Empezar a buscar'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: MovieMasonry(movies: favoritesMovies, loadNextPage: loadNextPage),
    );
  }
}


