import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:app_employe/demande_conge.dart';
import 'package:app_employe/demande_materials.dart';
import 'package:app_employe/list_conges.dart';
import 'package:app_employe/list_material.dart';
import 'package:app_employe/overview.dart';
import 'package:app_employe/profile.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const Overview(),
    const ListMaterial(),
    const ListConge(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffEEEEEE),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.boxArchive),
                label: 'Materials',
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.personWalkingArrowRight),
                  label: 'Leaves'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.solidUser), label: 'Profile'),
            ],
            currentIndex: _selectedIndex,
            iconSize: 30.0,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 100,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
