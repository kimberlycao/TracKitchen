import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationCard extends StatefulWidget {
  final String location;
  final icon;

  const LocationCard(this.location, this.icon);

  @override
  _LocationCardState createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.location,
                  style: GoogleFonts.breeSerif(
                      color: Color(0xFF2D3447), fontSize: 35.0),
                ),
                Icon(
                  widget.icon,
                  size: 30.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
