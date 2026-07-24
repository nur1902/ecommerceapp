import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../paths/assetpaths.dart';

class ProductFrame extends StatelessWidget {
  const ProductFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        //boxShadow:[BoxShadow(color: Colors.cyan.shade50)],
          borderRadius: BorderRadius.circular(15)
      ),
      height: 100,
      width: 100,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.teal.shade50)],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset(Assetpaths.produc),)),
          Text('Product',style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('\$100',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal),),
            Text('⭐4.8',style: TextStyle(fontWeight: FontWeight.w600),),Icon(Icons.favorite_outlined,color: Colors.teal,),

          ],)

        ],
      ),
    );
  }
}
