import 'package:flutter/material.dart';
import 'package:receipapp/recipe_detail.dart';
import 'recipe.dart';


void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Color.fromARGB(255, 61, 31, 168),
          secondary: Color.fromARGB(255, 156, 40, 40),
        ),
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    //1
    return Scaffold(
      //2
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      //3
      body: SafeArea(
        // TODO: Replace child: Container()
        // 4
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, index) {

            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) {
                     return RecipeDetail(recipe: Recipe.samples[index]); 
                      }
                    )
                  );
                },
                child:  buildRecipeCard(Recipe.samples[index]),
              );   
            },
          
          ),
        ),
      );
  }
  // TODO: Add buildRecipeCard() here
  
  Widget buildRecipeCard(Recipe recipe) {
  // 1
    return Card(
      elevation: 5.0,
    // 2
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0)),
     
     child: Padding(
      padding: const EdgeInsets.all(16.0),
       child: Column(
        // 
        children: <Widget>[
          // 4
          Image(image: AssetImage(recipe.imageUrl)),
          // 5
          const SizedBox(
              height: 14.0,
          ),
          Text(
            recipe.label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino'     
            )
          ),
        ],
      ),
     )
    );
  }

  
}
