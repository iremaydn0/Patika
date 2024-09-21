import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:io';
import 'gunce.dart';
import 'kartlar.dart';
import 'arkadaslar.dart';
import 'gonulluluk.dart';
import 'profil.dart';
import 'bildirim.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Static olarak tanımlanan genişlik değişkeni
  static double screenWidth = 0.0;
  static double spaceWidth = 0.0;
  static double boxWidth = 0.0;
  static double spaceBox = 0.0;
  static double iconWidth = 0.0;
  static double widthBox = 0.0;


  @override
  Widget build(BuildContext context) {
    // MediaQuery ile ekran genişliğini alıp static değişkene atama
    screenWidth = MediaQuery.of(context).size.width*0.9;
    spaceWidth = MediaQuery.of(context).size.width*0.05;
    boxWidth = MediaQuery.of(context).size.width*0.2;
    spaceBox= MediaQuery.of(context).size.width*0.04;
    iconWidth= MediaQuery.of(context).size.width*1;
    widthBox=MediaQuery.of(context).size.width*0.42;

    return MaterialApp(
      debugShowCheckedModeBanner: false,  // "Debug" ibaresini kaldırır
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
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final List<Widget> _pages = [
    HomePageContent(),
    CameraScreen(),
    MapSample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CameraScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapSample()),
      );
    }
  }


  // Liste halinde body içeriklerini tanımla


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.cyan,
        toolbarHeight: 78,
        title: Row(
          children: [
            const SizedBox(width: 20), // Title'a sol boşluk ekler
            const Text(
              "Patika",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Bildirim sayfasına yönlendir
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BildirimlerSayfasi()),
              );
            },
            icon: Icon(Icons.notifications),
            iconSize: 32,
          ), // Bildirim
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              // Profil sayfasına yönlendir
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilSayfasi()),
              );
            },
            icon: Icon(Icons.person_2_rounded),
            iconSize: 32,
            color: Color(0xff008bd0),
          ), // Profil
          const SizedBox(width: 20),
        ],

      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: MyApp.spaceWidth),
                      Expanded(
                        child: Text(
                          "Sen de doğa koruyucusu ol",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            fontFamily: 'Courier',
                          ),
                        ),
                      ),
                    ],
                  ), //söz
                  Row(
                    children: [
                      SizedBox(width: MyApp.spaceWidth,),
                      Padding(
                        padding: const EdgeInsets.only(top: 34),
                        child: Container(
                          width: MyApp.screenWidth,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child:
                          Row(
                              children: [
                                SizedBox(width: 16),
                                Icon(
                                  Icons.local_florist, // Çiçek ikonu
                                  color: Colors.green[800],
                                  size: 40, // Büyük boyutlu ikon
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Doğanın size bir hediyesi var! 🌿', // Başlık
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[900],
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Lilyum çiçeği şu an açma döneminde. Şimdi keşfedin ve bu eşsiz güzelliği koleksiyonunuza ekleyin!',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.green[700],
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right, // Ok ikonu
                                  color: Colors.green[800],
                                  size: 30,
                                ),
                              ]
                          ),

                        ),
                      )
                    ],
                  ), //bildirim
                  Row(
                    children: [
                      SizedBox(width: MyApp.spaceWidth,),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                          width: MyApp.screenWidth,
                          height: 120,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MyApp.boxWidth,
                                height: 120,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Burada gitmek istediğiniz sayfanın kodunu yazın
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => gunce()),
                                        );
                                      },
                                      child: Container(
                                        width: MyApp.iconWidth,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.4),
                                              spreadRadius: 2,
                                              blurRadius: 6,
                                              offset: Offset(0, 4), // Yükseklik ve genişlik ofseti
                                            ),
                                          ],
                                        ),
                                        child: Icon(Icons.book, size: 40),
                                      ),
                                    ),

                                    SizedBox(height: 10,),
                                    Text("Günce",style: TextStyle(fontWeight: FontWeight.bold),)


                                  ],
                                ),

                              ), //günce
                              Container(
                                width: MyApp.boxWidth,
                                height: 120,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => kartlar()),
                                        );
                                      },
                                      child: Container(
                                        width: MyApp.iconWidth,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.4),
                                              spreadRadius: 2,
                                              blurRadius: 6,
                                              offset: Offset(0, 4), // Yükseklik ve genişlik ofseti
                                            ),
                                          ],
                                        ),
                                        child: Icon(Icons.card_membership_rounded, size: 40),
                                      ),
                                    ),

                                    SizedBox(height: 10,),
                                    Text("Kartlar",style: TextStyle(fontWeight: FontWeight.bold),)


                                  ],
                                ),

                              ), //kartlar
                              Container(
                                width: MyApp.boxWidth,
                                height: 120,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => arkadaslar()),
                                        );
                                      },
                                      child: Container(
                                        width: MyApp.iconWidth,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.4),
                                              spreadRadius: 2,
                                              blurRadius: 6,
                                              offset: Offset(0, 4), // Yükseklik ve genişlik ofseti
                                            ),
                                          ],
                                        ),
                                        child: Icon(Icons.people, size: 40),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Arkadaşlar",style: TextStyle(fontWeight: FontWeight.bold),)


                                  ],
                                ),

                              ), //arkadaşlar
                              Container(
                                width: MyApp.boxWidth,
                                height: 120,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => gonulluluk()),
                                        );
                                      },
                                      child: Container(
                                        width: MyApp.iconWidth,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.4),
                                              spreadRadius: 2,
                                              blurRadius: 6,
                                              offset: Offset(0, 4), // Yükseklik ve genişlik ofseti
                                            ),
                                          ],
                                        ),
                                        child: Icon(Icons.favorite, size: 40),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Gönüllülük",style: TextStyle(fontWeight: FontWeight.bold),)


                                  ],
                                ),

                              ), //gönüllülük

                            ],

                          ),
                        ),
                      )
                    ],
                  ), //butonlar
                  Row(
                    children: [
                      SizedBox(
                        width: MyApp.spaceWidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40,),
                        child: Container(
                          width: MyApp.screenWidth,
                          height: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("İstatistiklerin",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20,),
                                    child:
                                    Container(
                                      width: MyApp.widthBox,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xffdee2e6),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Icon(Icons.explore,size: 70,color:Color(0xff0077b6)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Keşifler", style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff343a40)
                                          ),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("8",
                                            style: TextStyle(
                                                fontSize: 32,
                                                color:Color(0xff0077b6)
                                            ),)

                                        ],
                                      ),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20,),
                                    child:
                                    Container(
                                      width: MyApp.widthBox,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xffdee2e6),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Icon(Icons.volunteer_activism,size: 70,color:Colors.green),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Gönüllülük", style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff343a40)
                                          ),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("2",
                                            style: TextStyle(
                                                fontSize: 32,
                                                color:Colors.green
                                            ),)

                                        ],
                                      ),

                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ), //istatistik
                  Row(
                    children: [
                      SizedBox(width: MyApp.spaceWidth,),
                      Container(
                        width: MyApp.screenWidth,
                        height: 300,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [ Icon(Icons.eco, color: Colors.green, size: 40),
                                    SizedBox(width: 10),
                                    Text(
                                      'Biyoçeşitlilik Nedir?',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[800],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Biyoçeşitlilik, dünyadaki yaşamın çeşitliliğini ifade eder. Bitkiler, hayvanlar, mikroorganizmalar ve ekosistemler biyoçeşitliliği oluşturur.',
                                          style: TextStyle(fontSize: 16, color: Colors.black87),
                                          textAlign: TextAlign.left, // Metni sola hizalar
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Column(
                              children: [
                                Row(
                                  children: [ Icon(Icons.help, color: Colors.brown, size: 40),
                                    SizedBox(width: 10),
                                    Text(
                                      'Neden Önemlidir',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown[800],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Biyoçeşitlilik, doğal kaynakların sürdürülebilirliğini sağlar ve ekosistem hizmetlerini destekler. Ayrıca, iklim değişikliği ve çevresel streslere karşı direnç sağlar.",
                                          style: TextStyle(fontSize: 16, color: Colors.black87),
                                          textAlign: TextAlign.left, // Metni sola hizalar
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),


                          ],
                        ),
                      )

                    ],
                  ), //bilgiler
                ],
              ),
            ), // Anasayfa Ekranı
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF609e7c),
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF609e7c),
            icon: Icon(Icons.camera_alt),
            label: 'Kamera',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF609e7c),
            icon: Icon(Icons.map),
            label: 'Harita',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Color(0xFF609e7c),
      ),

    );
  }
}
class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Ana Sayfa İçeriği'),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await _picker.pickImage(source: source);
    setState(() {
      _image = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kamera'),
      ),
      body: Center(
        child: _image == null
            ? Text('Fotoğraf seçilmedi.')
            : Image.file(File(_image!.path)),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.camera),
            tooltip: 'Fotoğraf Çek',
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            tooltip: 'Galeriden Fotoğraf Seç',
            child: Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Popülasyon Haritası',style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.green,
      ),
      body: FlutterMap(
        mapController: MapController(),
        options: MapOptions(),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            // Plenty of other options available!
          ),
        ],
      ),
    );
  }
}









