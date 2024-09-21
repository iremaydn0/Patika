import 'package:flutter/material.dart';
import 'main.dart';

class arkadaslar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Arkadaslar(),
    );
  }
}

class Arkadaslar extends StatefulWidget {
  @override
  _ArkadaslarState createState() => _ArkadaslarState();
}

class _ArkadaslarState extends State<Arkadaslar> {
  List<User> users = [
    User("Almira", 12),
    User("Selim", 8),
    User("İklim", 2),
  ];

  void _addUser(String name) {
    setState(() {
      users.add(User(name, 0)); // Yeni kullanıcı ekleniyor. Puanı varsayılan olarak 0
    });
  }

  void _removeUser(int index) {
    setState(() {
      users.removeAt(index); // Kullanıcıyı listeden çıkar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arkadaşlarım', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton( // Geri tuşu
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            }
        ),
      ),
      body: Container(
        color: Colors.grey.shade100, // Arka plan rengi
        child: Column(
          children: [
            Expanded(child: UserRankingList(users: users, onRemoveUser: _removeUser)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _showAddUserDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Arka plan rengi
                  foregroundColor: Colors.white, // Metin rengi
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  shadowColor: Colors.green.shade200,
                ),
                child: Text('Arkadaş Ekle', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddUserDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Yeni Arkadaş Ekle'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Arkadaş İsmi',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ekle'),
              onPressed: () {
                String name = nameController.text;
                if (name.isNotEmpty) {
                  _addUser(name);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class User {
  final String name;
  final int score;

  User(this.name, this.score);
}

class UserRankingList extends StatelessWidget {
  final List<User> users;
  final Function(int) onRemoveUser;

  UserRankingList({required this.users, required this.onRemoveUser});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 20),
                CircleAvatar(
                  backgroundColor: Colors.green.shade300,
                  radius: 30,
                  child: Icon(Icons.account_circle_rounded, size: 55, color: Colors.white),
                ),
                SizedBox(width: 20),
                Text(
                  "${index + 1}-",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  users[index].name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "${users[index].score}",
                      style: TextStyle(fontSize: 24, color: Colors.green.shade900),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red.shade300),
                  onPressed: () {
                    _confirmRemoveUser(context, index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _confirmRemoveUser(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Silme Onayı'),
          content: Text('${users[index].name} adlı arkadaşınızı silmek istiyor musunuz?'),
          actions: <Widget>[
            TextButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sil'),
              onPressed: () {
                onRemoveUser(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
