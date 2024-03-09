import 'package:flutter/material.dart';
import 'package:act13/model/movie_model.dart';
import 'package:act13/vista/catalogo.dart';

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
  List<MovieModel> mainMovieList = [
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

  List<MovieModel> displayList = [];

  @override
  void initState() {
    super.initState();
    displayList = List.from(mainMovieList);
  }

  void updateList(String value) {
    setState(() {
      displayList = mainMovieList
          .where((element) =>
              element.movieTitle!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Future<List<MovieModel>> downloadDataFromServer() async {
    // Simula la descarga de datos desde una fuente externa
    await Future.delayed(Duration(seconds: 2));

    // Aquí debes realizar la lógica para descargar los datos desde el servidor
    // y devolver una lista de objetos MovieModel
    return [
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
  }

  Future<void> _refreshList() async {
    try {
      // Descargar los datos nuevamente desde el servidor
      List<MovieModel> updatedList = await downloadDataFromServer();

      setState(() {
        mainMovieList = updatedList;
        displayList = List.from(mainMovieList);
      });
    } catch (error) {
      print("Error al actualizar la lista: $error");
    }
  }

  void deleteAllMovies() {
    setState(() {
      mainMovieList.clear();
      displayList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: deleteAllMovies,
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: _refreshList,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buscador de películas',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar",
                prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshList,
                child: displayList.isEmpty
                    ? Center(
                        child: Text(
                          "No Hay Resultados",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
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
                            // Manejar el evento de toque en la película
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
                                        style: TextStyle(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
