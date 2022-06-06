import 'package:aau_laundary_app/blocs/adminBloc/admin_bloc.dart';
import 'package:aau_laundary_app/blocs/adminBloc/admin_event.dart';
import 'package:aau_laundary_app/blocs/adminBloc/admin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../components/Navigation.dart';
import '../components/total.dart';

// ignore: use_key_in_widget_constructors
// class Admin extends StatefulWidget {
//   @override
//   State<Admin> createState() => AdminState();
// }

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminBloc()..add(LoadAdminData()),
      child: BlocConsumer<AdminBloc, AdminState>(
        listener: (context, state) {
          print(state);
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            drawer: Drawer(
              child: BlocProvider.value(
                value: BlocProvider.of<AdminBloc>(context),
                child: Navigation(),
              ),
            ),
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext _) {
                  return IconButton(
                    icon: Image.asset("assets/image2.jpg"),
                    onPressed: () {
                      Scaffold.of(_).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(_).openAppDrawerTooltip,
                  );
                },
              ),
            ),
            body: state is LoadingAdminData ? Center(child: CircularProgressIndicator()) :
            state is AdminDataLoaded?
      BlocProvider.value(
              value: BlocProvider.of<AdminBloc>(context),
              child: Total(data:state),
            ):Center(child: Column(
               children: [
                 Text("SomeThing Went Wrong Try Again"),
                 ElevatedButton(onPressed: (){}, child: Text("Refresh"))
               ],
             ),),

            // body: Navigation(),
          );
        },
      ),
    );
  }
}
