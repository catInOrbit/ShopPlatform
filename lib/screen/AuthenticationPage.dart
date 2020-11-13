import 'package:ExpShop/bloc/authentication/authentication_bloc.dart';
import 'package:ExpShop/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        backgroundColor: Colors.green,
      body: Container(
        child: StreamBuilder<ShopUser>(
          stream: authenticationBloc.outputUserStream,
          builder: (context, snapshot) {
              if(snapshot.hasData)
                {
                  if(snapshot.data.shopID != null)
                    {
                       print("PUSING SHOP");

                       SchedulerBinding.instance.addPostFrameCallback((_) {
                         Navigator.pushNamed(
                             context, '/HomePageShop');
                            }
                         );

                    }

                  else
                    {
                      print("PUSING HOME");
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushNamed(
                            context, '/HomePage');
                      }
                      );


                    }

                }

              else
                return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}
