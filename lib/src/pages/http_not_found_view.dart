import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class HttpNotFoundView extends StatelessWidget {
  const HttpNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Text('404');
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: Center(child: Text('404', style: TextStyle(color: Colors.blue),)),
      // ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('¡Lo siento, ha ocurrido un error 404 en Quick Job! Nuestros técnicos están trabajando para solucionar el problema. Mientras tanto, ¿por qué no revisas nuestras otras opciones de servicios para el hogar?'),
          Image.asset('assets/images/404.jpg'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: PalleteColor.strokeColor
            ),
            onPressed: ()=> Navigator.of(context).pushNamed('/'), 
            child: const Text('Volver a intentarlo', style: TextStyle(color: PalleteColor.whiteColor, fontWeight: FontWeight.w700))
          )
        ],
      ),
    );
  }
}