import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/bloc/service/service_bloc.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class PrincipalView extends StatefulWidget {
  PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  final ServiceBloc serviceBloc = ServiceBloc();
  var _account;

  @override
  void initState() {
    super.initState();
    serviceBloc.getServices();
    WidgetsBinding.instance.addPostFrameCallback((_){
      getAccount();
      setState(() { });
    });
  }

  Future getAccount() async{
    _account = await serviceBloc.getAccount();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: PalleteColor.whiteColor,
          elevation: 0,
          title: Text('Bienvenid@ ${_account!= null? _account['userName']: ''}', style: Theme.of(context).textTheme.titleLarge),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: PalleteColor.primaryColor),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
        ),
        backgroundColor: PalleteColor.whiteColor,
        body: StreamBuilder(
          stream: serviceBloc.servicesStream,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }else if(snapshot.hasError){
              return const Text('Error');
            }else{
              print(snapshot.data);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return StickyHeader(
                      header: Container(
                        height: 38.0,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        alignment: Alignment.centerLeft,
                        child: Text(Texts.whatDoYouNeed, style: Theme.of(context).textTheme.titleLarge),
                      ),
                      content: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1,),
                        itemBuilder: (contxt, indx){
                          return GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/request', arguments: [snapshot.data![indx].idService, snapshot.data![indx].nameService]),
                            child: Card(
                              shadowColor: PalleteColor.primaryColor,
                              elevation: 0,
                              margin: EdgeInsets.all(4.0),
                              color: PalleteColor.whiteColor,
                              child: Padding(
                                padding: EdgeInsets.only(left: 12.0, top: 6.0, bottom: 2.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      snapshot.data![indx].idService == 1 ? Icon(Icons.lightbulb): snapshot.data![indx].idService == 2? Icon(Icons.water_drop_sharp): snapshot.data![indx].idService == 3? Icon(Icons.brush_sharp): snapshot.data![indx].idService == 4? Icon(Icons.carpenter_rounded): snapshot.data![indx].idService == 5? Icon(Icons.cookie_sharp): snapshot.data![indx].idService == 6? Icon(Icons.eco_outlined): snapshot.data![indx].idService == 7? Icon(Icons.car_repair_sharp): Icon(Icons.wash_outlined),
                                      SizedBox(height: 8),
                                      Text(snapshot.data![indx].nameService)
                                    ],
                                  )
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  shrinkWrap: true,
                ),
              );
            }
          },
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: PalleteColor.primaryColor),
                accountName: Text(
                '${_account!= null? _account['userName']: ''} ${_account!= null? _account['surnamesName']: ''}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  '${_account!= null? _account['emailName']: ''}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: const Icon(Icons.account_circle, color: PalleteColor.whiteColor, size: 70),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle_rounded),
                title: Text(Texts.myProfile),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.file_present_sharp),
                title: Text(Texts.myDocuments),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/documents');
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_shopping_cart_rounded),
                title: Text(Texts.myServices),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/services');
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(Texts.myAddress),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/address');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(Texts.logout),
                onTap: () async{
                  await serviceBloc.logout();
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}