import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class AddressView extends StatelessWidget {
  AddressView({super.key});

  bool isEmpty = true;

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
          title: Text('Mis Direcciones', style: Theme.of(context).textTheme.headlineSmall!.merge(const TextStyle(color: PalleteColor.primaryColor, fontWeight: FontWeight.bold))),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                icon: const Icon(Icons.add_location_alt_rounded, color: PalleteColor.primaryColor,),
                onPressed: () {
                  Navigator.of(context).pushNamed('/addAddress');
                },
              )
            )
          ],
        ),
        backgroundColor: PalleteColor.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: MediaQuery.of(context).size.height*0.01);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(10,10,10,0),
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Alias',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                  ),
                                  Text('Casa',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ciudad',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                  ),
                                  Text('La Paz',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Avenida',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                  ),
                                  Text('Javier del Granado',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Calle',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                  ),
                                  Text('2',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Numero',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                  ),
                                  Text('234',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Edificio',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                  ),
                                  Text('Holada Entel',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Departamento',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                  ),
                                  Text('2',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Refencia',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                                  ),
                                  Expanded(
                                    child: Text('Cambio de toma corrientes empalmes nuevos',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textAlign: TextAlign.end,
                                      style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}