import 'package:dismiss/pages/profile.dart';
import 'package:dismiss/pages/settings.dart';
import 'package:dismiss/pages/todolist.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('toligrimm.kz'),
          backgroundColor: Colors.yellow,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
               const UserAccountsDrawerHeader(
                 decoration: BoxDecoration(color: Colors.pink),
                 currentAccountPicture: CircleAvatar(
                   backgroundImage: NetworkImage('https://memepedia.ru/wp-content/uploads/2021/01/chyk-chyryk-mem.jpg'),
                 ),
                 accountName: Text('Toli Grimm'),
                 accountEmail: Text('toligrimm@mail.com'),
               ),

               ListTile(
                trailing: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text('Мой профиль'),
                tileColor: Colors.lightBlueAccent,
                textColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyProfile()),
                  );
                },
              ),
              ListTile(
                title: const Text('ToDo'),
                tileColor: Colors.cyan,
                textColor: Colors.white,
                trailing: const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Todolist()),
                  );
                },
              ),
              ListTile(
                title: const Text('Настройки'),
                tileColor: Colors.green,
                textColor: Colors.white,
                trailing: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
              )
            ],
          ),
        ),
        body: Scrollbar(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const MyProfile()),);},
                icon: Image.asset('assets/images/cat1.jpg'),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const Todolist()),);},
                icon: Image.asset('assets/images/fatty.jpg'),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const Settings()),);},
                icon: Image.asset('assets/images/peach.jpg'),
              ),
            ],
          ),
        )
    );
  }
}