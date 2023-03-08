import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  // const TrendingMovies({Key? key}) : super(key: key);
  final List tv;

  const TV({super.key, required this.tv});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular Tv Shows',
            size: 26,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: tv[index]['original_name'],
                            description: tv[index]['overview'],
                            // bannerurl: 'http://image.tmdb.org/t/p/w500' +
                            //     tv[index]['backdrop_path'],
                            // posterurl: 'http://image.tmdb.org/t/p/w500' +
                            //     tv[index]['poster_path']!=null?'http://image.tmdb.org/t/p/w500' +
                            //     tv[index]['poster_path']:'http://image.tmdb.org/t/p/w500' +
                            //     tv[index]['backdrop_path'],
                            vote: tv[index]['vote_average'].toString(),
                            launch_on: tv[index]['first_air_date'],
                          ),
                        ),
                      );
                    },
                    child: tv[index]['title'] != null
                        ? Container(
                            padding: EdgeInsets.all(5),
                            width: 250,
                            // height: 200,
                            child: Column(
                              children: [
                                Container(
                                  width: 250,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'http://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: modified_text(
                                    text: tv[index]['original_name'] != null
                                        ? tv[index]['original_name']
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
