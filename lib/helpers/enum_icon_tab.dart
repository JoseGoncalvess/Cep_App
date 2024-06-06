import 'package:flutter/material.dart';

enum EnumIconTab {
  favor( description: "Favoritos", icon: Icons.favorite_outlined,),
  refresh(icon: Icons.refresh_rounded, description: "Recarregar");

  const EnumIconTab(
    {
      required this.icon,
      required this.description
    }
  );

  final IconData icon;
  final String description;
}