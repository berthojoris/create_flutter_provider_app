import 'package:flutter/material.dart';
import 'package:noteapp/ui/auth/register_screen.dart';
import 'package:noteapp/ui/auth/sign_in_screen.dart';
import 'package:noteapp/ui/cart/add_to_cart.dart';
import 'package:noteapp/ui/setting/setting_screen.dart';
import 'package:noteapp/ui/splash/splash_screen.dart';
import 'package:noteapp/ui/todo/create_edit_todo_screen.dart';
import 'package:noteapp/ui/todo/todos_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String create_edit_todo = '/create_edit_todo';
  static const String add_to_cart = '/add_to_cart';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => SignInScreen(),
    register: (BuildContext context) => RegisterScreen(),
    home: (BuildContext context) => TodosScreen(),
    setting: (BuildContext context) => SettingScreen(),
    create_edit_todo: (BuildContext context) => CreateEditTodoScreen(),
    add_to_cart: (BuildContext context) => AddToCart()
  };
}
