import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/profile_page.dart';
import 'package:todo/pages/settings_page.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {


  // ignore: unused_field
  final _myBox = Hive.box('mybox');
  todoDatabase db = todoDatabase();
  
  
  
//Bottom Navigation

  int _selectedIndex = 0;
  void _navigation(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages =[const HomePage(),const ProfilePage(),const SettingsPage()];
  final List<String> _title =['T o d o', 'P r o f i l e', 'S e t t i n g s'];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),

        child: Container(
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(_title[_selectedIndex]),
            centerTitle: true,
            titleTextStyle: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      

      body: _pages[_selectedIndex],


      
      
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12)
            ), 
        color: Colors.deepPurple),
    
        child: BottomNavigationBar(
          backgroundColor: Colors.deepPurple,
          currentIndex: _selectedIndex,
          onTap: _navigation,
          selectedItemColor: Colors.white,
          // fixedColor: Colors.white,
          unselectedItemColor: Colors.deepPurple[200],
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home", ),
            BottomNavigationBarItem(icon: Icon(Icons.person,),label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.settings,), label: "Settings",),
          ],
          
          ),
      ),

    );
  }
}