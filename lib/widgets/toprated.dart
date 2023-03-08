import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TopRated extends StatelessWidget {
  // const TrendingMovies({Key? key}) : super(key: key);
  final List toprated;

  const TopRated({super.key, required this.toprated});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Top Rated Movies',
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: toprated[index]['title'],
                            description: toprated[index]['overview'],
                            // bannerurl: 'http://image.tmdb.org/t/p/w500' +
                            //     toprated[index]['backdrop-path'],
                            // posterurl: 'http://image.tmdb.org/t/p/w500' +
                            //     toprated[index]['poster_path'],
                            vote: toprated[index]['vote_average'].toString(),
                            launch_on: toprated[index]['release_date'],
                          ),
                        ),
                      );
                    },
                    child: toprated[index]['title'] != null
                        ? Container(
                            width: 140,
                            // height: 200,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'http://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path'],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: modified_text(
                                    text: toprated[index]['title'] != null
                                        ? toprated[index]['title']
                                        : 'Loading',
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
