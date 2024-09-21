import 'package:flutter/material.dart';

class gonulluluk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gönüllülük Projeleri'),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Text("Güncel Etkinlikler",
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            ), //güncel etkinlikler
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*(0.9),
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(14)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 40,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Sahil Temizliği",style: TextStyle(
                              fontSize: 24,
                            ),),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text("Tarih: 10 Ekim 2024\nKonum: Karataş Sahili, Adana",
                        style: TextStyle(fontSize: 20,color: Color(0xffFF4000)),),
                    ),//tarih-konum
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 5),
                      child: Text("Etkinlik detayları: Deniz kirliliğine dikkat çekmek ve çevreyi temiz tutmak için gönüllülerle sahil temizliği yapılıyor.",
                        style: TextStyle(fontSize: 24),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top:10),
                      child: ElevatedButton(
                        onPressed: () {
                          // Bildirimi göstermek için ScaffoldMessenger kullanılır
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Kaydınız alınmıştır!'),
                                duration: Duration(seconds: 2), // Bildirimin görünme süresi
                              ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Buton rengi
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Metin rengi
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                        ),
                        child: Text('Katıl'),
                      ),
                    )


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Text("Katıldığın Etkinlikler",
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            ), //Katıldığın etkinlikler
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*(0.9),
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 40,
                              color: Colors.black54,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Sokak Hayvanlarına Yardım",style: TextStyle(
                                fontSize: 24,
                              ),),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("Tarih: 21 Nisan 2024\nKonum: Adana Hayvan Barınağı",
                          style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),//tarih-konum
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 5),
                        child: Text("Barınakta yaşayan hayvanlar için mama ve bakım yardımı yapılan etkinlik.",
                          style: TextStyle(fontSize: 24),),
                      )
              
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*(0.9),
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 40,
                              color: Colors.black54,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Fidan Dikme Etkinliği",style: TextStyle(
                                fontSize: 24,
                              ),),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("Tarih: 10 Mart 2024\nKonum: Çukurova Üniversitesi Kampüsü",
                          style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),//tarih-konum
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 5),
                        child: Text("Doğal yaşam alanlarını korumak ve ormanları genişletmek amacıyla düzenlenen etkinlik.",
                          style: TextStyle(fontSize: 24),),
                      )

                    ],
                  ),
                ),
              ),
            )


          ],
        ),
      )

    );
  }
}