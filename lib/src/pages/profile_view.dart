import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: PalleteColor.whiteColor,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: ()=> Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: PalleteColor.primaryColor)
          ),
          title: Text('Mi Perfil', style: Theme.of(context).textTheme.headlineSmall!.merge(TextStyle(color: PalleteColor.primaryColor, fontWeight: FontWeight.bold))),
        ),
        backgroundColor: PalleteColor.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.account_circle, color: PalleteColor.primaryColor, size: 90),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Jose Armando Pozo Silva', style: Theme.of(context).textTheme.bodyLarge!.merge(TextStyle(color: Colors.black))),
                        const SizedBox(height: 10),
                        Text('Jose.pozo@ucb.edu.bo', style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(color: PalleteColor.greyColor))),
                      ],
                    )
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: PalleteColor.whiteColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), offset: Offset(0, 3), blurRadius: 10)
                  ],
                ),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.verified_user),
                      title: Text('Perfil', style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    ListTile(
                      dense: true,
                      title: Text('Carnet de identidad', style: Theme.of(context).textTheme.bodyMedium),
                      trailing: Text('4878544', style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(color: PalleteColor.greyColor))),
                    ),
                    ListTile(
                      dense: true,
                      title: Text('Fecha de nacimiento', style: Theme.of(context).textTheme.bodyMedium),
                      trailing: Text('23/10/1997', style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(color: PalleteColor.greyColor))),
                    ),
                    ListTile(
                      dense: true,
                      title: Text('Celular', style: Theme.of(context).textTheme.bodyMedium),
                      trailing: Text('655578478', style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(color: PalleteColor.greyColor))),
                    ),
                    ListTile(
                      dense: true,
                      title: Text('Genero', style: Theme.of(context).textTheme.bodyMedium),
                      trailing: Text('Masculino', style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(color: PalleteColor.greyColor))),
                    ),
                    ListTile(
                      dense: true,
                      title: Text('Correo', style: Theme.of(context).textTheme.bodyMedium),
                      trailing: Text('jose.pozo@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(color: PalleteColor.greyColor))),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: size.width*0.05, vertical: size.height*0.01),
                decoration: BoxDecoration(
                  color: PalleteColor.whiteColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), offset: Offset(0, 3), blurRadius: 10)
                  ],
                ),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: Text(
                        'Ajustes de cuenta',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    ListTile(
                      onTap: () async{
                      },
                      dense: true,
                      title: Row(
                        children: <Widget>[
                          Icon(
                            Icons.upload,
                            size: 22,
                            color: Theme.of(context).focusColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Cerrar Sesión',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}