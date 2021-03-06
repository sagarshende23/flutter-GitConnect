import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_github_connect/bloc/User/index.dart';
import 'package:flutter_github_connect/helper/GIcons.dart';
import 'package:flutter_github_connect/ui/page/user/User_screen.dart';
import 'package:flutter_github_connect/ui/theme/export_theme.dart';


class UserPage extends StatefulWidget {

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    print("Init Profile page");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("User Page build");
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Profile"),
        actions: <Widget>[
          IconButton(icon: Icon(GIcons.settings_24, color: GColors.blue), onPressed: null)
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        // bloc: widget._userBloc,
        builder: (
          BuildContext context,
          UserState currentState,
        ) {
          if (currentState is ErrorUserState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.errorMessage ?? 'Error'),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text('reload'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            );
          }
         else if (currentState is LoadedUserState) {
            return UserScreen(
              model: currentState.user,
            );
          }
          else{
            return Center(
            child: CircularProgressIndicator(),
          );
          }
        },
      ),
    );
  }
}
