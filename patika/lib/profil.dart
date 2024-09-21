import 'package:flutter/material.dart';

class ProfilSayfasi extends StatefulWidget {
  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  String profilIsmi = "Serayy"; // Profil ismini başlangıçta belirleyin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity, // Genişliği ekran genişliği kadar
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffa3b18a), Colors.white], // Üstten alta doğru renkler
                  begin: Alignment.topCenter, // Başlangıç noktası
                  end: Alignment.bottomCenter, // Bitiş noktası
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/Pp.jpeg'), // Profil resmi
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 15),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profilIsmi, // Değişkeni kullanıyoruz
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "id: 2489657458",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ), // Profil
            SizedBox(height: 40),
            ProfilIstatistikleri(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: SizedBox(
                width: double.infinity, // Butonu tüm satıra yayar
                child: ElevatedButton(
                  onPressed: () async {
                    final updatedIsim = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilDuzenle(profilIsmi: profilIsmi)),
                    );

                    if (updatedIsim != null) {
                      setState(() {
                        profilIsmi = updatedIsim; // Güncellenmiş ismi kaydet
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0), // Yükseklik ayarı
                    backgroundColor: Color(0xffe9edc9), // Butonun arka plan rengi
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Buton köşe yuvarlama
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Profili Düzenle",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff343a40), // Yazı rengi
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Color(0xff343a40), // İkon rengi
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ), // Profil düzenle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: SizedBox(
                width: double.infinity, // Butonu tüm satıra yayar
                child: ElevatedButton(
                  onPressed: () {
                    // Butona basıldığında yapılacak işlemler
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Oneri()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16), // Yükseklik ayarı
                    backgroundColor: Color(0xffe9edc9), // Butonun arka plan rengi
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Buton köşe yuvarlama
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Öneri Ve İstekler",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff343a40), // Yazı rengi
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Color(0xff343a40), // İkon rengi
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ), // Öneri Ve İstekler
          ],
        ),
      ),
    );
  }
}


class ProfilIstatistikleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[50],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _istatistikKutusu("Yaygın Türler", "7", Icons.eco),
                  _istatistikKutusu("Nadir Türler", "1", Icons.local_florist),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _istatistikKutusu("Arkadaşlar", "3", Icons.people),
                  _istatistikKutusu("Katıldığım Etkinlikler", "3", Icons.event),
                ],
              ),
            ],
          ),
        ),
      );
  }

  Widget _istatistikKutusu(String baslik, String deger, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 8),
        Text(
          deger,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Text(
          baslik,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class ProfilDuzenle extends StatefulWidget {
  final String profilIsmi;

  ProfilDuzenle({required this.profilIsmi});

  @override
  _ProfilDuzenleState createState() => _ProfilDuzenleState();
}

class _ProfilDuzenleState extends State<ProfilDuzenle> {
  final _formKey = GlobalKey<FormState>();
  late String _isim;
  late String _email;
  late String _sifre;

  @override
  void initState() {
    super.initState();
    _isim = widget.profilIsmi;
    _email = 'seray01@gmail.com';
    _sifre = '1234';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profili Düzenle'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _isim,
                  decoration: InputDecoration(labelText: 'İsim'),
                  onChanged: (value) => _isim = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen isminizi girin';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _email,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  onChanged: (value) => _email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen e-mail adresinizi girin';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Şifre'),
                  onChanged: (value) => _sifre = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen şifrenizi girin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form geçerli ise
                      Navigator.pop(context, _isim); // Güncellenmiş ismi geri gönder
                    }
                  },
                  child: Text('Güncelle'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Oneri extends StatefulWidget {
  @override
  _OneriState createState() => _OneriState();
}

class _OneriState extends State<Oneri> {
  final _formKey = GlobalKey<FormState>();
  String _isimSoyisim = '';
  String _email = '';
  String _mesaj = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öneri ve İstekler'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bize Öneri ve İsteklerinizi İletin',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(
                      label: 'İsim Soyisim',
                      hintText: 'Adınızı ve soyadınızı girin',
                      onChanged: (value) {
                        setState(() {
                          _isimSoyisim = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      label: 'E-posta',
                      hintText: 'E-posta adresinizi girin',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      label: 'Mesaj',
                      hintText: 'Mesajınızı buraya yazın',
                      maxLines: 5,
                      onChanged: (value) {
                        setState(() {
                          _mesaj = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Mesajınız gönderildi')),
                          );
                          // Burada verileri gönderme işlemini yapabilirsiniz
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Gönder',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label boş olamaz';
        }
        if (label == 'E-posta' && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Geçerli bir e-posta adresi girin';
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}
