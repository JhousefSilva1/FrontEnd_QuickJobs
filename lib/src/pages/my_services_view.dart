import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class MyServicesView extends StatefulWidget {
  MyServicesView({super.key, required this.serviceType});
  int serviceType;

  @override
  State<MyServicesView> createState() => _MyServicesViewState();
}

class _MyServicesViewState extends State<MyServicesView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                            Text('Nombres',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                            ),
                            Text('Carlos Benavides',
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
                            Text('Apellidos',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                            ),
                            Text('Herrera Quispe',
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
                            Text('Servicio',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                            ),
                            Text('Electricista',
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
                            Text('Fecha',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                            ),
                            Text('12 mayo 2023',
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
                            Text('Descripcion',
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
                        SizedBox(child: Divider(thickness: 0.5, color: Theme.of(context).hintColor.withOpacity(0.9))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Costo Total',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.primaryColor)),
                            ),
                            Text('300 BS',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: PalleteColor.greyColor, fontWeight: FontWeight.normal)),
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
    );
  }
}