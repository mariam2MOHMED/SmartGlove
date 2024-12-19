import 'package:flutter/material.dart';
import 'package:graduationproject/auth/model/user_model.dart';

class UserProvider with ChangeNotifier{
  UserModel? curruser;
  getUser( UserModel userModel){
    curruser=userModel;
    notifyListeners();
  }
}