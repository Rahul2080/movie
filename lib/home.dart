import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/second.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> movies = [
    "assets/spider.png",
    "assets/marval.png",
    "assets/shanmovie.png"
  ];
  List<String> txt = [
    'Spiderman: No Way Home',
    'Eternals',
    'Shang-Chi',
  ];
  List<String> ratetxt = [
    '9.1/10 IMDb',
    '9.5/10 IMDb',
    '8,1/10 IMDb',
  ];
  List<String> verimage = [
    "assets/venom.png",
    "assets/man.png",
  ];
  List<String> vertext = [
    'Venom Let There\nBe Carnage',
    'The King’s Man',
  ];
  List<String> verratetext = [
    '6.4/10 IMDb',
    '8.4/10 IMDb',
  ];
  List<String> verconttxt = [
    'HORROR',
    'MYSTERY',
    'THRILLER',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 110),
          child: Text(
            'FilmKu',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF110E47),
              fontSize: 16,
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.w900,
              height: 0,
              letterSpacing: 0.32,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Icon(
              Icons.notification_add_outlined,
              color: Colors.black,
            ),
          )
        ],
        leading: Icon(Icons.format_align_left_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Now Showing',
                    style: TextStyle(
                      color: Color(0xFF110E46),
                      fontSize: 16,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Text(
                    'See more',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFAAA8B0),
                      fontSize: 10,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 340,
                child: ListView.separated(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (_)=>second())); },
                      child: Container(
                        width: 200,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 170,
                                child: Image.asset(
                                  movies[index],
                                  fit: BoxFit.cover,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                txt[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: 0.28,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 1,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 1,
                                  itemSize: 30,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (double value) {},
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  ratetxt[index],
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 12,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.24,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: Color(0xFF110E47),
                      fontSize: 16,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                  ),
                  SizedBox(width: 250),
                  Text(
                    'See more',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFAAA8B0),
                      fontSize: 10,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 500,
                child: ListView.separated(
                  itemCount: verimage.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 60,
                      height: 200,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            verimage[index],
                          ),
                          SizedBox(width: 15),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 100),
                                child: Text(
                                  vertext[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: 0.28,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 120, top: 10),
                                child: Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 1,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 1,
                                      itemSize: 30,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (double value) {},
                                    ),
                                    Text(
                                      verratetext[index],
                                      style: TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: 0.24,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 17),
                              Container(
                                width: 230,
                                height: 30,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: ListView.separated(
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: 70,
                                      height: 15,
                                      decoration: ShapeDecoration(
                                        color: Colors.greenAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          verconttxt[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF87A3E8),
                                            fontSize: 8,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                            letterSpacing: 0.16,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 6,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 155),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.schedule_outlined),
                                    ),
                                    Text(
                                      '1h 47m',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: 0.24,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
