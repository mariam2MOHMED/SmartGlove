import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/utils/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider=Provider.
    of<UserProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width*0.6,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
              width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.25,
          ),
          Expanded(

            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only
                  (left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.0,),
                    Text(userProvider.curruser!.name,
                      style: TextStyle(
                        color: AppTheme.black,
                        fontWeight: FontWeight.bold,
                        fontSize:22.0
                      ),),
                    SizedBox(height: 22.0,),
                    Text(userProvider.curruser!.email,
                      style: TextStyle(
                          color: AppTheme.black,
                          fontWeight: FontWeight.w500,
                          fontSize:18.0
                      ),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
