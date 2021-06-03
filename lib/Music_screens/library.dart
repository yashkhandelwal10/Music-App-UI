import 'package:flutter/material.dart';
import 'package:vikrant_app/Music_screens/nowplaying.dart';
import 'package:vikrant_app/constants.dart';

class Library extends StatelessWidget {
// Template for genre cards
  Widget genreCard(String img, String title, String foll) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(gcard)),
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 50.0,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "$foll Followers",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }

// Template for song list
  Widget songCard(
      int sr, String img, String title, String artist, String time) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("$sr"),
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  artist,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(time),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cwhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "POPULAR",
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: cblue,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                // Call GenreCard
                genreCard(pop, "POP", '751,475'),
                genreCard(hiphop, "HIPHOP", '751,475'),
                genreCard(country, "COUNTRY", '751,475'),
                genreCard(heavymetal, "HEAVY METAL", '751,475'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, top: 20),
            child: Text(
              "TRENDING ALBUMS",
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: cblue,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 330,
            padding: EdgeInsets.fromLTRB(45, 30, 45, 25),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(scard),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // call song card widget
                  songCard(1, art1, "Blinding Lights", "The Weekend", "3:11"),
                  songCard(2, art2, "The Box", "Roddy Rich", "2:15"),
                  songCard(3, art3, "Dont Start Now", "Dua Lipa", "3:52"),
                  songCard(4, art4, "Circles", "Post Malone", "3:02"),
                  songCard(5, art5, "Intensions", "Justine Bieber", "2:59"),
                ],
              ),
            ),
          ),
          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                home,
                scale: 1.1,
              ),
              Image.asset(
                podcast,
                scale: 1.1,
              ),
              Image.asset(
                search,
                scale: 1.1,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NowPlaying()));
                },
                child: Image.asset(
                  list,
                  scale: 1.1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
