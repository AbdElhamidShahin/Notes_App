import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Item> _items = []; // List to hold items

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to add item to _items list
  void _addItemToList(Item item) {
    setState(() {
      _items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      HomePage(items: _items),
      AddPage(onItemAdded: _addItemToList),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<Item> items; // List of items to display

  HomePage({required this.items});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: widget.items.isEmpty
          ? Center(child: Text('No items found'))
          : ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.items[index].title),
            leading: Image.asset(
              widget.items[index].image,
              width: 50, // تعديل الحجم حسب الحاجة
              height: 50,
              fit: BoxFit.cover, // تعديل حجم الصورة لتناسب الـ ListTile
            ),
          );
        },
      ),
    );
  }
}


class AddPage extends StatelessWidget {
  final List<Item> fixedItems = List.generate(
    5,
        (index) => Item(
      title: 'Item ${index + 1}',
      image: 'assets/images/image_processing20200106-10064-rkm2p2.jpg', // Adjust image asset path as necessary
    ),
  );

  final Function(Item) onItemAdded; // Callback to send item to MyHomePage

  AddPage({required this.onItemAdded});

  _addItem(BuildContext context, Item item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemsJson = prefs.getStringList('items') ?? [];
    itemsJson.add(jsonEncode(item.toJson()));
    await prefs.setStringList('items', itemsJson);

    // Send the added item to MyHomePage using the callback
    onItemAdded(item);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item.title} added')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items'),
      ),
      body: Column(
        children: fixedItems.map((item) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(item.title), // Display item title
                Image.asset(item.image,height: 50,width: 50,), // Display item image
                ElevatedButton(
                  onPressed: () {
                    _addItem(context, item);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  final String title;
  final String image;

  Item({required this.title, required this.image});

  Map<String, dynamic> toJson() => {
    'title': title,
    'image': image,
  };

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'],
      image: json['image'],
    );
  }
}
