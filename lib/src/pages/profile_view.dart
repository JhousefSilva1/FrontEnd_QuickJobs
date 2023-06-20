import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickjobsbol/src/app/texts.dart';
import 'package:quickjobsbol/src/bloc/user/user_bloc.dart';
import 'package:quickjobsbol/src/style/pallete_color.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  void initState() {
    super.initState();
    final perfilBloc = BlocProvider.of<UserBloc>(context);
    perfilBloc.add(LoadUser());
  }

  @override
  Widget build(BuildContext context) {
    // final perfilBloc = BlocProvider.of<UserBloc>(context);
    // perfilBloc.add(LoadUser());
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
          title: Text(Texts.myProfile, style: Theme.of(context).textTheme.headlineSmall!.merge(const TextStyle(color: PalleteColor.primaryColor, fontWeight: FontWeight.bold))),
        ),
        backgroundColor: PalleteColor.whiteColor,
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserUploaded){
              return Padding(
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
                              Text('${state.user.names} ${state.user.surnames}', style: Theme.of(context).textTheme.bodyLarge!.merge(const TextStyle(color: Colors.black))),
                              const SizedBox(height: 10),
                              Text('${state.user.email}', style: Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.greyColor))),
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
                          BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), offset: const Offset(0, 3), blurRadius: 10)
                        ],
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.verified_user),
                            title: Text(Texts.profile, style: Theme.of(context).textTheme.bodyLarge),
                          ),
                          ListTile(
                            dense: true,
                            title: Text(Texts.dni, style: Theme.of(context).textTheme.bodyMedium),
                            trailing: Text('${state.user.dni}', style: Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.greyColor))),
                          ),
                          ListTile(
                            dense: true,
                            title: Text(Texts.birthOfDay, style: Theme.of(context).textTheme.bodyMedium),
                            trailing: Text('${state.user.born}', style: Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.greyColor))),
                          ),
                          ListTile(
                            dense: true,
                            title: Text(Texts.cellphone, style: Theme.of(context).textTheme.bodyMedium),
                            trailing: Text('${state.user.cellphone}', style: Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.greyColor))),
                          ),
                          ListTile(
                            dense: true,
                            title: Text(Texts.gender, style: Theme.of(context).textTheme.bodyMedium),
                            trailing: Text('${state.user.gender}', style: Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.greyColor))),
                          ),
                          ListTile(
                            dense: true,
                            title: Text(Texts.email, style: Theme.of(context).textTheme.bodyMedium),
                            trailing: Text('${state.user.email}', style: Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.greyColor))),
                          ),
                          ListTile(
                            dense: true,
                            title: Text(Texts.accountType, style: Theme.of(context).textTheme.bodyMedium),
                            trailing: Text('${state.user.accountType}', style: Theme.of(context).textTheme.bodyMedium!.merge(const TextStyle(color: PalleteColor.greyColor))),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: PalleteColor.whiteColor,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), offset: const Offset(0, 3), blurRadius: 10)
                        ],
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.settings),
                            title: Text(
                              Texts.accountAdjustment,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          ListTile(
                            onTap: () async{
                            },
                            dense: true,
                            title: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.logout,
                                  size: 22,
                                  color: PalleteColor.primaryColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  Texts.logout,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }else if(state is UserLoading){
              return const Center(child: CircularProgressIndicator());
            }else if(state is UserError){
              return const Text('Error al cargar el perfil');
            }else{
              return const Text('Error al cargar el perfil');
            }
          },
        ),
      ),
    );
  }
}