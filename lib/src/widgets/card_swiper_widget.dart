import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  
  final List<dynamic> peliculas;

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
            child: Image.network("http://via.placeholder.com/350x150",fit: BoxFit.cover,),
          ); 
        },
          itemCount: peliculas.length, //tamaño de la lista
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ),
   );
  }
}