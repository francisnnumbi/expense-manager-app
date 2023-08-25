 import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
   const CustomBtn({super.key, required this.onPress, required this.iconData});
 final VoidCallback onPress;
 final IconData iconData;
   @override
   Widget build(BuildContext context) {
     return IconButton(
       onPressed: onPress,
       icon: Icon(iconData),
       //icon: const Icon(Icons.settings_outlined),
     );
   }
 }
