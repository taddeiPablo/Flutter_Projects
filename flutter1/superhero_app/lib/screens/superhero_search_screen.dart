//
import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_details_response.dart';
import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:superhero_app/data/repository.dart';
import 'package:superhero_app/screens/superhero_details_screen.dart';

//
class SuperHeroSearchScreen extends StatefulWidget {
  const SuperHeroSearchScreen({super.key});

  @override
  State<SuperHeroSearchScreen> createState() => _SuperHeroSearchScreenState();
}

//
class _SuperHeroSearchScreenState extends State<SuperHeroSearchScreen> {
  //
  Future<SuperHeroResponse?>? _superheroInfo;
  //
  Repository repository = Repository();
  //
  bool _isTextFieldEmpty = true;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SuperHero App")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "busca un superheroe",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  _isTextFieldEmpty = text.isEmpty;
                  _superheroInfo = repository.fetchSuperheroInfo(text);
                });
              },
            ),
          ),
          //
          createList(_isTextFieldEmpty),
        ],
      ),
    );
  }

  //
  FutureBuilder<SuperHeroResponse?> createList(bool isEmpty) {
    //
    return FutureBuilder(
      future: _superheroInfo,
      builder: (context, snapshot) {
        if (isEmpty) return Text("Introduce un Nombre!!!");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          // snapshot.data?.response
          var superheroList = snapshot.data?.result;
          return Expanded(
            child: ListView.builder(
              itemCount: superheroList?.length ?? 0,
              itemBuilder: (context, index) {
                if (superheroList != null) {
                  //Text(superheroList[index].name);
                  return itemSuperHero(superheroList[index]);
                } else {
                  return Text("Error !!!");
                }
              },
            ),
          );
        } else {
          return Text("no se encontraron resultados");
        }
      },
    );
  }

  Padding itemSuperHero(SuperheroDetailsResponse item) => Padding(
    padding: const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
    child: GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => SuperHeroDetailScreen(superheroDetails: item),
            ),
          ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          color: Colors.blue,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.url,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.6),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
