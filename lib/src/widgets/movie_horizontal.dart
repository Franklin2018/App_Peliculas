import 'package:flutter/material.dart';

import 'package:app_peliculas/src/models/peliculas_model.dart';

class MovieHorizontal extends StatelessWidget {
  
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({ @required this.peliculas, @required this.siguientePagina});
  final _pageController = 
        new PageController(
             initialPage: 1,
             viewportFraction: 0.3,
        );

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener( (){

      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
          siguientePagina(); //llamamos a la funcion si se llega al final
      }
    });

    return Container(
      height: _screenSize.height * 0.30, //controla el porcentaje que se ocupara en la pantalla
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        //children: _tarjetas(context),
        itemCount: peliculas.length,
        itemBuilder: (context, i){
          return _tarjeta(context, peliculas[i]);
        },
        ),
    );
  }
  Widget _tarjeta(BuildContext context, Pelicula pelicula){

     return Container(
          margin: EdgeInsets.only(right: 15.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                  placeholder: AssetImage('assets/img/loading.gif'), 
                  image: NetworkImage(pelicula.getPosterImg()),
                  fit: BoxFit.cover,
                  height: 160.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                pelicula.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map( (pelicula){
        return Container(
          margin: EdgeInsets.only(right: 15.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                  placeholder: AssetImage('assets/img/loading.gif'), 
                  image: NetworkImage(pelicula.getPosterImg()),
                  fit: BoxFit.cover,
                  height: 160.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                pelicula.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        );
    } ).toList();
  }
}