import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/widget/ListProduct.dart';
import 'package:flutter/material.dart';

class TabLikeProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardProductHori(productItem: listProduct[2]),
        CardProductHori(productItem: listProduct[8]),
        CardProductHori(productItem: listProduct[4]),
        CardProductHori(productItem: listProduct[0]),
        CardProductHori(productItem: listProduct[6]),
        CardProductHori(productItem: listProduct[2]),
        CardProductHori(productItem: listProduct[8]),
        CardProductHori(productItem: listProduct[4]),
        CardProductHori(productItem: listProduct[0]),
        CardProductHori(productItem: listProduct[6]),
      ],
    );
  }
}

// Container(
//       decoration: BoxDecoration(color: Colors.grey),
//       child: GridView(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 197 / 300,
//             crossAxisSpacing: 1,
//             mainAxisSpacing: 1,
//           ),
//           children: listProduct
//               .map((e) => CardProduct(
//                     productItem: e,
//                   ))
//               .toList()),
//     );
