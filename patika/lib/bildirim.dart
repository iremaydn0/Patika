import 'package:flutter/material.dart';
import 'gonulluluk.dart';

class BildirimlerSayfasi extends StatelessWidget {
  final List<Bildirim> bildirimler = [
    Bildirim("Güzel Haber", "Lilyum çiçeği şu an açma döneminde. Şimdi keşfedin ve bu eşsiz güzelliği koleksiyonunuza ekleyin!"),
    Bildirim("Yeni Etkinlik", "Sahil Temizliği etkinliği için gönüllü olabilirsiniz. Şimdi katılın!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bildirimler'),
      ),
      body:
      ListView.builder(
        itemCount: bildirimler.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.notifications, // Buraya ikonu ekledik
              color: Colors.blue, // İkonun rengini ayarlayabilirsin
              size: 30, // İkonun boyutunu ayarlayabilirsin
            ),
            title: Text(bildirimler[index].title),
            subtitle: Text(bildirimler[index].description),
            onTap: () {
              if (bildirimler[index].title == "Yeni Etkinlik") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => gonulluluk()),
                );
              } else {
                // Diğer bildirimler için eylem
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${bildirimler[index].title} bildirimi gösterildi!'),
                ));
              }
            },
          );
        },
      ),
    );
  }
}

class Bildirim {
  final String title;
  final String description;

  Bildirim(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    home: BildirimlerSayfasi(),
  ));
}
