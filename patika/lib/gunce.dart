import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(gunce());
}

class gunce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpeciesListPage(),
    );
  }
}

class Species {
  final String name;
  final String category;
  final String imagePath;
  final String time;
  final String info;
  final bool isRare;

  Species({
    required this.name,
    required this.category,
    required this.imagePath,
    required this.info,
    required this.time,
    required this.isRare,
  });
}

class SpeciesListPage extends StatelessWidget {
  final List<Species> speciesList = [
    Species(
      name: 'Lilyum',
      category: 'Bitki',
      time: "23.02.2024",
      imagePath: 'assets/images/lilyum.png', // Görseller için asset ekle
      info:
      'Lilyum çiçeği, parlak renkleri ve hoş kokusuyla bilinir. Poleni, çiçek arılarına büyük miktarda besin sağlar.',
      isRare: false,
    ),
    Species(
      name: 'Çam',
      category: 'Hayvan',
      time: "05.12.2023",
      imagePath: 'assets/images/cam.png',
      info:
      'Çam ağaçları, dünyanın birçok bölgesinde yaygındır ve doğada en uzun yaşayan ağaç türlerinden biridir. Bazı çam ağaçları 1000 yıldan fazla yaşayabilir.',
      isRare: false,
    ),
    Species(
      name: 'Çimenev',
      category: 'Böcek',
      time: "21.02.2024",
      imagePath: 'assets/images/cimenev.png',
      info:
      'Çimenevler, karınca kolonilerinde en uzun yaşayan bireylerdir ve 15 yıla kadar hayatta kalabilirler.',
      isRare: false,
    ),
    Species(
      name: 'Lale',
      category: 'Bitki',
      time: "15.01.2024",
      imagePath: 'assets/images/lale.png',
      info:
      'Lale soğanları, Osmanlı İmparatorluğu\'ndan Avrupa\'ya ihraç edilmiştir ve 17. yüzyılda Hollanda\'da "Lale Çılgınlığı" olarak bilinen bir ekonomik balona neden olmuştur.',
      isRare: false,
    ),
    Species(
      name: 'Sarı Kanarya',
      category: 'Hayvan',
      time: "17.01.2024",
      imagePath: 'assets/images/sarikanarya.png',
      info:
      'Kanaryaların şarkı söyleme yetenekleri, yalnızca erkek kuşlarda gelişir ve bu yeteneklerini dişi kuşları etkilemek için kullanırlar.',
      isRare: false,
    ),
    Species(
      name: 'Karınca',
      category: 'Böcek',
      time: "24.02.2024",
      imagePath: 'assets/images/karinca.png',
      info:
      'Karıncalar, ağırlıklarının 50 katını taşıyabilir ve oldukça organize kolonilerde yaşarlar. Her kolonide bir kraliçe karınca bulunur.',
      isRare: false,
    ),
    Species(
      name: 'Kuzgun',
      category: 'Hayvan',
      time: "11.02.2024",
      imagePath: 'assets/images/kuzgun.png',
      info:
      'Kuzgunlar, alet kullanma yetenekleriyle dikkat çekerler.',
      isRare: false,
    ),
    Species(
      name: 'Ters Lale',
      category: 'Bitki',
      time: "05.01.2024",
      imagePath: 'assets/images/ters lale.png',
      info:
      'Ters lale, Anadolu\'nun dağlık bölgelerinde bulunan ve nadir olarak karşılaşılan bir çiçek türüdür. Halk arasında \'ağlayan lale\' olarak bilinir çünkü çiçeklerinden su damlacıkları akar',
      isRare: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Yaygın ve nadir türleri ayırıyoruz
    final List<Species> commonSpecies =
    speciesList.where((species) => !species.isRare).toList();
    final List<Species> rareSpecies =
    speciesList.where((species) => species.isRare).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Keşfettiğim Türler"),
        leading: IconButton( // Geri tuşu
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // Nadir Türler Başlığı
            Padding(
              padding: const EdgeInsets.only(bottom: 40,top: 10,left: 10,),
              child: Text(
                'Nadir Türler',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            _buildSpeciesGrid(rareSpecies),

            // Yaygın Türler Başlığı
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom:40,left: 5,),
              child: Text(
                'Yaygın Türler',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            _buildSpeciesGrid(commonSpecies),

          ],
        ),
      ),
    );
  }

  Widget _buildSpeciesGrid(List<Species> speciesList) {
    return GridView.builder(
      shrinkWrap: true, // Liste içinde GridView kullanımı için
      physics:
      NeverScrollableScrollPhysics(), // Liste kaydırma davranışını kapatır
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Her satırda iki kart
        childAspectRatio: 0.75, // Kartın boyutunu ayarlamak için
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: speciesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SpeciesDetailPage(species: speciesList[index]),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      speciesList[index].imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    speciesList[index].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SpeciesDetailPage extends StatelessWidget {
  final Species species;

  SpeciesDetailPage({required this.species});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(species.name,style: TextStyle(fontSize: 24,),),
        ),
        body:Column(
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: MyApp.spaceWidth,),
                Container(
                  width: MyApp.screenWidth,
                  height: 730,
                  decoration:
                  BoxDecoration(
                    color: Color(0xffe9ecef),
                    borderRadius: BorderRadius.circular(15),  // Kenarları yuvarlatma
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff6c757d).withOpacity(0.5),  // Gölge rengi
                        spreadRadius: 5,  // Gölge yayılımı
                        blurRadius: 7,  // Gölge bulanıklığı
                        offset: Offset(0, 3),  // Gölge x ve y yönündeki kayması
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset(species.imagePath , width: 400, height: 400),
                        SizedBox(height: 10),
                        Text(
                          species.name,
                          style: TextStyle(fontSize: 34),
                        ),
                        SizedBox(height: 5),
                        Text(
                          species.category,
                          style: TextStyle(fontSize: 24),
                        ),

                        SizedBox(height: 5),
                        Text(
                          species.time,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 20),
                        Text(
                          species.info,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),

                      ],
                    ),
                  ),

                ),
              ],
            ),



          ],
        )

    );
  }
}