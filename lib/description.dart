import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  // const Description({Key? key}) : super(key: key);

  final String name;
  final String description;
  final String bannerurl;
  final String posterurl;
  final String vote;
  final String launch_on;

  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
  });

  @override
  Widget build(BuildContext context) {
    // print(bannerurl);
    // print(posterurl);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: bannerurl != null
                          ? Image.network(
                              bannerurl,
                              fit: BoxFit.cover,
                            )
                          : modified_text(
                              text: "Banner Link is invalid.",
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: modified_text(
                      text: ' ⭐ Average Rating -' + vote,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                text: name != null ? name : 'Not Loaded',
                size: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: modified_text(
                text: 'Releasing On :-' + launch_on,
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(
                    5,
                  ),
                  height: 200,
                  width: 100,
                  child: posterurl != null
                      ? Image.network(
                          posterurl,
                        )
                      : modified_text(
                          text: "Poster Link is Invalid",
                        ),
                ),
                Flexible(
                  child: Container(
                    child: modified_text(
                      text: description,
                      size: 18,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
