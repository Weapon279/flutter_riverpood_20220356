import 'package:flutter/material.dart';
import 'package:act13/model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador',
      debugShowCheckedModeBanner: false,
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  static List<MovieModel> mainMovieList = [
    MovieModel("The Godfather", 1972, 9.5,
        "https://th.bing.com/th/id/OIP.7d6RdxocvhZaE0f7Li9UyAHaKh?w=140&h=199&c=7&r=0&o=5&pid=1.7"),
    MovieModel("The Godfather II", 1983, 9.1,
        "data:image/jpeg;base64,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"),
    MovieModel("The Godfather III", 2006, 9.3,
        "https://upload.wikimedia.org/wikipedia/en/5/55/GodfatherIII2.jpg"),
    MovieModel("Wall Street", 1987, 9.3,
        "https://vnwriter.net/wp-content/uploads/2018/05/phim-pho-wall.jpg"),
    MovieModel("El Abogado Del Diablo", 1997, 9.2,
        "https://m.media-amazon.com/images/S/pv-target-images/c95519e5801cefd81eba0152f2747748ae500e7fe70695d31c7e298a824ef312.jpg"),
    MovieModel("Casino", 1995, 9.0,
        "https://moviepostermexico.com/cdn/shop/products/casino_ver3_xxlg_1024x1024@2x.jpg?v=1609623498"),
    MovieModel("GoodFellas", 1990, 9.4,
        "https://http2.mlstatic.com/D_NQ_NP_892893-MLM54128383480_032023-O.webp"),
    MovieModel("Una Historia Del Bronx", 1993, 9.7,
        "https://lh3.googleusercontent.com/-tVwpWaftNYI/Xlau2COiwSI/AAAAAAAA63U/QijUhmDwRTcN1-j9N-yJalBYlnNDjh30ACKgBGAsYHg/w735-rw-l75-e365/1725.jpg"),

  ];

  List<MovieModel> displayList = List.from(mainMovieList);

  void updateList(String value) {
    setState(() {
      displayList = mainMovieList
          .where((element) => element.movieTitle!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buscador de películas',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Color.fromARGB(255, 167, 69, 13)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: displayList.length == 0
                  ? Center(
                      child: Text(
                        "No Hay Resultados",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: displayList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                        },
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  displayList[index].imageUrl!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      displayList[index].movieTitle!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${displayList[index].releaseYear!}',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    Text(
                                      "${displayList[index].rating}",
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

