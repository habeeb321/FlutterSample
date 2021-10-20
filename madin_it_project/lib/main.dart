import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My test app',
      theme: ThemeData(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _names = [
    'Java',
    'JavaScript',
    'Python',
    'C++',
    'Dart',
    'Swift'
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue[900],
        title: Text(
          'LANGUAGES',
          style: TextStyle(letterSpacing: 3),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search),
            ),
          ),
          SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.more_vert,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _names.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MySecondPage()));
              },
              leading: Icon(Icons.verified_user_rounded, color: Colors.green),
              title: Text('${_names[index]}'),
              trailing: Icon(Icons.arrow_forward),
            );
          }),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://thumbs.dreamstime.com/b/email-concept-paper-sheet-icon-red-envelope-51880196.jpg',
                    ),
                  ),
                  Text('habeebrh321@gmail.com')
                ],
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              tileColor: Colors.amber,
              leading: Icon(
                Icons.phone,
              ),
              title: Text('Contact'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
            ListTile(
              tileColor: Colors.green,
              leading: Icon(
                Icons.mail,
              ),
              title: Text('Support'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
            ListTile(
              tileColor: Colors.amber,
              leading: Icon(
                Icons.settings,
              ),
              title: Text('Settings'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
            ListTile(
              tileColor: Colors.green,
              leading: Icon(
                Icons.message_outlined,
              ),
              title: Text('FAQ'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
            ListTile(
              tileColor: Colors.amber,
              leading: Icon(
                Icons.login_outlined,
              ),
              title: Text('Login'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          print(_currentIndex);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_rounded), label: 'Profile')
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  MyContainer({Key? key, this.name}) : super(key: key);
  final name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MySecondPage()));
          },
          child: Container(
            height: 200,
            width: 200,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('$name'),
          ),
        ),
      ],
    );
  }
}

class MySecondPage extends StatefulWidget {
  MySecondPage({Key? key}) : super(key: key);

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  var searchController = TextEditingController();

  var content = '';

  onCardPress() {
    print('Ontap pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue[900],
        title: Text(
          'DETAILS',
          style: TextStyle(letterSpacing: 3),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: searchController,
            style: TextStyle(color: Colors.red),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search here',
                hintStyle: TextStyle(color: Colors.amber),
                label: Text('Search'),
                labelStyle: TextStyle(color: Colors.green)),
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            // TextButton(
            //     onPressed: () {
            //       print('clicked');
            //     },
            //     child: Text(
            //       'Submit',
            //       style: TextStyle(color: Colors.red, fontSize: 25),
            //     )),
            // OutlinedButton(
            //     onPressed: () {
            //       print('clicked');
            //     },
            //     child: Text(
            //       'Submit',
            //       style: TextStyle(color: Colors.red, fontSize: 25),
            //     )),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    content = searchController.text;
                  });
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ],
        ),
        Text(
          '$content',
          style: TextStyle(color: Colors.black),
        ),
        Container(
          height: 200,
          width: 300,
          child: InkWell(
            radius: 50,
            borderRadius: BorderRadius.circular(80),
            onTap: onCardPress,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    topLeft: Radius.circular(100)),
                color: Colors.green,
              ),
              child: Card(
                elevation: 5,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.ac_unit, color: Colors.white, size: 50),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                            child: Text(
                          'This is my card',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
