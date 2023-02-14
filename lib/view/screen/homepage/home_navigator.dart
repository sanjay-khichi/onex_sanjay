

import 'package:flutter/material.dart';
import 'package:onex_sanjay/utility/constants.dart';
import 'package:onex_sanjay/view/screen/homepage/homepage.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}
Widget pages(int _currentIndex){
  switch (_currentIndex){
    case 0 : return Homepage();
    case 1 : return Homepage();
    case 2 : return Homepage();
    case 3 : return Homepage();
    default : return Homepage();
  }
}
int _currentIndex=0;

class _HomeNavigatorState extends State<HomeNavigator> {



  @override
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop:()async{
        if(_currentIndex!=0){
          setState(() {
            _currentIndex =  0;
          });
          return await false;
        }else{
          return await true;
        }
      } ,
      child: Scaffold(
        body: pages(_currentIndex),
        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onTap,
          unselectedItemColor: Constants.secondaryProductPriceColor,
          selectedItemColor: Constants.productPriceColor,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          iconSize: 40,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "",),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "",),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded), label: ""),

          ],
        ),
      ),
    );

  }
}
