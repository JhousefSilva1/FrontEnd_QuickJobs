import 'package:flutter/material.dart';
import 'package:quickjobsbol/src/pages/my_services_view.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: PalleteColor.primaryColor), 
              onPressed: () =>  Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Align(
              alignment: Alignment.center,
              child: Text('Mis Servicios', style: Theme.of(context).textTheme.headlineSmall!.merge(const TextStyle(color: PalleteColor.primaryColor, fontWeight: FontWeight.bold)))
            ),
            bottom: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), 
                color: PalleteColor.primaryColor
              ),
              indicatorPadding: EdgeInsets.symmetric(horizontal: size.width*0.01),
              isScrollable: true,
              labelColor: PalleteColor.whiteColor,
              labelPadding: EdgeInsets.symmetric(horizontal: size.width*0.007),
              unselectedLabelColor: PalleteColor.primaryColor,
              tabs: [
                orderTab('Completados', size),
                orderTab('Actuales', size),
                orderTab('Pendientes', size),
                orderTab('Cancelados', size),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MyServicesView(serviceType: 1),
              MyServicesView(serviceType: 2),
              MyServicesView(serviceType: 3),
              MyServicesView(serviceType: 4),
            ],
          )
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget orderTab(String text, Size size){
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: PalleteColor.primaryColor, 
            width: 1
          )
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(text),
        ),
      ),
    );
  }
}