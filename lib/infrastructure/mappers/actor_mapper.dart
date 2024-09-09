import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null ? 
    'https://image.tmdb.org/t/p/w500${cast.profilePath}' : 
    'https://imgs.search.brave.com/urF8FbrZXLObJsFKVlzVgKROpbHRvjT24j03KO9nOZI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by91/c2VyLWZyb250LXNp/ZGUtd2l0aC13aGl0/ZS1iYWNrZ3JvdW5k/XzE4NzI5OS00MDAw/Ny5qcGc_c2l6ZT02/MjYmZXh0PWpwZw',
    character: cast.character
  );
}

