import 'package:flutter/material.dart';

class ArtworkWidget extends StatefulWidget {
  const ArtworkWidget({super.key});

  @override
  State<ArtworkWidget> createState() => _ArtworkWidgetState();
}

class _ArtworkWidgetState extends State<ArtworkWidget> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void switchFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      if (_isFavorite) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Oeuvre ajoutée à vos favoris.'),
          ),
        );
      }
    });
  }

  void switchDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mona Lisa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5.0,
        shadowColor: Colors.black,
      ),
      body: Column(children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Image
            const Image(image: AssetImage("images/Mona_Lisa.jpg")),

            // Text superposé à l'image
            Positioned.fill(
              child: GestureDetector(
                onTap: switchDescription,
                child: !_showDescription
                    ? GestureDetector(
                        onTap: switchFavorite,
                        child: Icon(
                          Icons.favorite,
                          size: 100,
                          color: _isFavorite
                              ? Colors.red
                              : Colors.white.withOpacity(0.75),
                        ),
                      )
                    : const FractionallySizedBox(
                        widthFactor: 0.75,
                        heightFactor: 0.5,
                        alignment: FractionalOffset.center,
                        child: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
        const Column(children: [
          Text(
            "Mona Lisa",
            style: TextStyle(fontSize: 30, color: Colors.brown),
          ),
          Text(
            "Léonard De Vinci",
            style: TextStyle(
                fontSize: 15, color: Colors.brown, fontWeight: FontWeight.bold),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: const Icon(Icons.article), onPressed: switchDescription),
            const SizedBox(width: 80),
            IconButton(
              icon: const Icon(Icons.favorite),
              color: _isFavorite ? Colors.red : Colors.brown,
              onPressed: switchFavorite,
            ),
          ],
        )
      ]),
    );
  }
}
