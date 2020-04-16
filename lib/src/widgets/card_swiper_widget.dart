import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:app_peliculas/src/models/peliculas_model.dart';

class CardSwiper extends StatelessWidget {
  
  final List<Pelicula> peliculas;

  CardSwiper({ @required this.peliculas});
  
  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size; //para obtejer variables de la pantalla

    return Container(
     padding: EdgeInsets.only(top: 10.0),
   
      child: Swiper( 
        layout: SwiperLayout.STACK,
        itemWidth : _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,      
        itemBuilder: (BuildContext context,int index){
          return ClipRRect( //widget para hacer los bordes redondeados
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/loading.gif'), 
              image: NetworkImage(peliculas[index].getPosterImg()),
              fit: BoxFit.cover, //adapta la imagen a todo el ancho que tiene.
              )
          ); 
        },
          itemCount: peliculas.length, //tamaño de la lista
          //pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        ),
   );
  }
}