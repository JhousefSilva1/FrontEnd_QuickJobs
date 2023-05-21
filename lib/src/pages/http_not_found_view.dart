import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class HttpNotFoundView extends StatelessWidget {
  const HttpNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Text('404');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: PalleteColor.primaryColor,),
          onPressed: () => Navigator.of(context).canPop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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