import 'package:flutter/material.dart';
import 'main.dart';


class kartlar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tehlikedeki Türler',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: EndangeredSpeciesPage(),
    );
  }
}

class EndangeredSpeciesPage extends StatelessWidget {
  final List<Species> speciesList = [
    Species(
      name: 'Monark Kelebeği',
      imagePath: 'assets/images/monark-kelebegi.jpg',
      info:
      "Monark kelebeği (Danaus plexippus), uzun göç yolculuklarıyla ünlü, parlak turuncu-siyah desenli bir kelebek türüdür. Kuzey Amerika'da yaygın olarak görülür ve her yıl binlerce kilometre göç eder. Monark kelebekleri, kış aylarında Meksika'ya ve Kaliforniya'ya doğru uzun bir göç gerçekleştirir ve bu yolculuk sırasında birçok nesil değişir.\n\n"
       "Bu kelebekler sütleğen bitkisiyle beslenirler ve bu bitki, tırtıllarının besin kaynağını oluşturur. Monark kelebeklerinin popülasyonları, iklim değişikliği, habitat kaybı ve tarım ilaçları gibi etkenlerle tehdit altındadır.\n\n"
          "Koruma Stratejileri:\n"
       "1- Sütleğen Bitkisi Ekimi,\n"
       "2- Habitat Koruma ve Geri Kazanımı,\n"
       "3- Tarım İlaçlarının Azaltılması\n"
       "4- Göç Yollarının İzlenmesi\n"
      "5- Kamu Farkındalığı ve Eğitim",
    ),
    Species(
      name: 'Jewel Scarab',
      imagePath: 'assets/images/JewelScarab.jpg',
      info:
      "Jewel scarab (mücevher skarabe böceği), genellikle Orta ve Güney Amerika'da bulunan, parlak ve göz alıcı metalik renklere sahip bir böcek türüdür. Bu böcekler, altın, zümrüt yeşili, mavi veya kırmızı gibi değerli taşları andıran ışıltılı renkleri nedeniyle \"jewel scarab\" olarak adlandırılır. Genellikle Scarabaeidae ailesinin bir üyesidirler ve büyüleyici dış görünümleriyle dikkat çekerler.\n\n"
      "Bazı mücevher skarabe türleri, koleksiyoncular tarafından yoğun bir şekilde talep edilmekte, bu da belirli türlerin tehdit altında olmasına yol açabilmektedir. Bu nedenle, habitatlarının korunması ve yasadışı böcek ticaretinin önlenmesi, bu güzel türlerin korunması için önemlidir.\n\n"
      "Jewel scarab'lar, benzersiz görünümleri ve nadir olmaları nedeniyle doğa bilimciler ve koleksiyoncular tarafından büyük ilgi görmektedir.\n\n"
      "Koruma Stratejileri:\n"
      "1- Doğal Habitatların Korunması\n"
      "2- Yasadışı Böcek Ticaretiyle Mücadele\n"
      "3- Bilinçlendirme ve Eğitim\n"
      "4- Ekosistem Hizmetleri\n"
      "5- Tür Popülasyonlarının İzlenmesi",
    ),
    Species(
      name: 'Hayalet Orkide',
      imagePath: 'assets/images/Ghostorchid.jpg',
      info:
      "Hayalet orkide (Dendrophylax lindenii), gizemli ve nadir bir bitki türüdür. Özellikle Floridanın güneyi, Bahamalar ve Küba'da bulunur. Bu orkide türü, nadirliği ve hayatta kalma zorluklarıyla bilinir. Yaprakları olmaması nedeniyle fotosentez yapamaz ve ihtiyaç duyduğu besinleri kökleri aracılığıyla diğer bitkilerden alır.\n\n"
      "Hayalet orkide, habitat kaybı, iklim değişikliği ve yasa dışı toplama nedeniyle ciddi tehdit altındadır. Habitatı olan bataklıklar ve ormanlar büyük oranda yok olmuş ya da bozulmuştur. Bu türün yasadışı olarak toplanması, onu daha da tehlikeye atmaktadır.\n\n"
      "Koruma Stratejileri\n"
      "1- Habitat Koruma\n"
      "2- Yasadışı Toplamayı Engellemek\n"
      "3- Botanik Bahçeleri ve Rehabilitasyon Projeleri\n"
      "4- Tozlayıcıların Korunması\n"
      "5- Farkındalık Yaratma ve Eğitim",
    ),
    Species(
      name: 'Hawksbill Deniz Kaplumbağası',
      imagePath: 'assets/images/HawksbillDenizKaplumbağası.jpg',
      info:
      "Hawksbill deniz kaplumbağası (Eretmochelys imbricata), sıcak tropikal denizlerde yaşayan ve nesli tükenme tehlikesiyle karşı karşıya olan bir kaplumbağa türüdür. Genellikle mercan resiflerinde bulunan bu tür, benzersiz görünüme sahip olan kabuğu nedeniyle tarih boyunca avlanmıştır. Hawksbill deniz kaplumbağaları, mercan resif ekosisteminin dengesi için çok önemlidir çünkü beslendikleri süngerler ve deniz canlıları resiflerin sağlığını etkiler.\n\n"
      "Hawksbill deniz kaplumbağaları, Uluslararası Doğa Koruma Birliği (IUCN) tarafından \"Kritik Tehlike Altında\" (CR) olarak sınıflandırılmaktadır. Aşırı avlanma, habitat kaybı ve iklim değişikliği gibi faktörler nedeniyle sayıları hızla azalmaktadır. Ayrıca deniz kirliliği ve plastik atıklar da büyük bir tehdit oluşturmaktadır.\n\n"
          "Koruma Stratejileri\n"
          "1- Kabuğa Yönelik Ticareti Engelleme\n"
          "2- Yuva Alanlarının Korunması\n"
          "3- Avcılıkla Mücadele\n"
          "4- Deniz Kirliliğinin Azaltılması\n"
          "5- İklim Değişikliğiyle Mücadele\n"
          "6- Koruma Alanları ve Uluslararası İşbirliği",
    ),
    Species(
      name: 'Vaşak',
      imagePath: 'assets/images/vasak.jpg',
      info:
      "Vaşak (Lynx), kedi ailesine ait vahşi bir yırtıcı hayvandır ve dört farklı türü vardır: Avrupa vaşağı, Kanada vaşağı, Avrasya vaşağı, ve İber vaşağı. Özellikle İber vaşağı (Lynx pardinus), nesli tükenme tehlikesiyle karşı karşıya olan türler arasındadır. Vaşaklar, kulaklarındaki püsküllü tüyleri, kısa kuyrukları ve keskin pençeleriyle tanınırlar.\n\n"
          "Vaşaklar, avladıkları küçük memeliler ve tavşanlar sayesinde ekosistemdeki dengenin korunmasına yardımcı olurlar. Özellikle tavşan nüfuslarını kontrol altında tutarak bitki örtüsünün korunmasına katkıda bulunurlar. Bu, habitatlarında yaşayan diğer türler için de önemlidir.\n\n"
          "Koruma Stratejileri\n"
          "1- Yuva ve Yaşam Alanlarının Korunması\n"
          "2- Tavşan Popülasyonlarını Destekleme\n"
          "3- Avcılık Yasağı\n"
          "4- Yol Güvenliği\n"
          "5- Bilinçlendirme ve Eğitim\n",

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tehlikedeki Türler'),
        leading: IconButton( // Geri tuşu
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            }
        ),
    ),
      body: PageView.builder(
        itemCount: speciesList.length,
        itemBuilder: (context, index) {
          final species = speciesList[index];
          return Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    species.imagePath,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      species.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      species.info,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Species {
  final String name;
  final String imagePath;
  final String info;

  Species({
    required this.name,
    required this.imagePath,
    required this.info,
  });
}
