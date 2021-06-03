import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const cwhite = Colors.white;
const cblue = Colors.blue;

// icons
const wave = "images/icons/wave.svg";
const play = "images/icons/play.svg";
const previous = "images/icons/previous.svg";
const next = "images/icons/next.svg";
const back = "images/icons/back.svg";
const options = "images/icons/options.svg";
const list = "images/icons/list.png";
const search = "images/icons/search.png";
const podcast = "images/icons/podcast.png";
const home = "images/icons/home.png";

//images
const button = "images/button.png";
const disk = "images/disk.png";
const albumart = "images/AlbumArt.jpg";
const pop = "images/pop.jpg";
const hiphop = "images/hiphop.jpg";
const heavymetal = "images/heavymetal.jpg";
const country = "images/country.jpg";
const scard = "images/scard.png";
const gcard = "images/gcard.png";
const art1 = "images/Art1.jpg";
const art2 = "images/Art2.jpg";
const art3 = "images/Art3.jpg";
const art4 = "images/Art4.jpg";
const art5 = "images/Art5.jpg";

//Button widget
Widget cbutton(String symbol) {
  return Container(
    padding: EdgeInsets.fromLTRB(25, 25, 20, 20),
    height: 80,
    width: 80,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(button),
      ),
    ),
    child: SvgPicture.asset(symbol),
  );
}
