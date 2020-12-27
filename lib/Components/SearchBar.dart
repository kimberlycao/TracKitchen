import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 20.0),
                  icon: Icon(Icons.search),
                  border: InputBorder.none))),
    );
  }
}
