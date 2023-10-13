import 'package:flutter/material.dart';
import 'package:flutter_application_july/Passing%20data%20bw%20screens/Using%20Navigator/dummydata.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // id from previous page
    var id = ModalRoute.of(context)?.settings.arguments;
    // products list ile oro map um product il varum , previous page le tap cheitha id kku
    // matching aya id products list il undonu check cheyyum , undenkil aa single map product il store cheyum
    var product = products.firstWhere((product) => product['id'] == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              product['image'],
              height: 200,
              width: 200,
            ),
            Text(
              product['name'],
              style: GoogleFonts.fahkwang(fontSize: 40),
            ),
            Text(
              '${product['price']}',
              style: TextStyle(fontSize: 30),
            ),
            Text('${product['rating']}', style: TextStyle(fontSize: 20)),
            Text(product['description'], style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
