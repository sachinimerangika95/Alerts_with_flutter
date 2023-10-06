import 'package:flutter/material.dart';

class ShopItemTile extends StatelessWidget {

  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;


  ShopItemTile({
    super.key,
    required this.itemName,
    required this. itemPrice,
    required this. imagePath,
    required this. color,
    required this.onPressed,
    });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
          ),
        child: Column(children: [
          Image.asset(imagePath, width:300, height:150),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              itemName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 19, 18, 18),
              ),
            ),
          ),

          MaterialButton(
            onPressed:(){},
            color: color[800],
            child: Text(
              '\$' + itemPrice,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            )
        ],),
      ),
    );
  }
}