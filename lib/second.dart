import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class second extends StatefulWidget {
  final String text;
  final String text2;

  const second({super.key, required this.text, required this.text2});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List<String> videotxt = [
    'ACTION',
    'ADVENTURE',
    'FANTASY',
  ];
  List<String> image = [
    "assets/spy1.png",
    "assets/spy2.png",
    "assets/spy3.png",
    "assets/spy4.png"
  ];
  List<String> imgname = [
    'Tom Holland',
    'Zendaya',
    'Benedict\nCumberbatch',
    'Jacon  Batalon',
  ];
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 270.h,
            color: Colors.blueAccent,
            child: Center(
              child: FlickVideoPlayer(flickManager: flickManager),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.40,
                      ),
                    ),
                    SizedBox(width: 55.w),
                    Icon(Icons.bookmark_border)
                  ],
                ),SizedBox(height: 10.h),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 1,
                      itemSize: 30,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {},
                    ),SizedBox(height: 10.h),
                    Text(
                      widget.text2,
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.24,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                  child: ListView.separated(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: 100.w,height: 30.h,
                          decoration: ShapeDecoration(
                            color:Color(0xFFDBE3FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Text(
                              videotxt[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF87A3E8),
                                fontSize: 8.sp,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 6.w,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18,left: 10),
                  child: Row(
                    children: [
                      Text(
                        'Length',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 12.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.24,
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      Text(
                        'Language',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 12.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.24,
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      Text(
                        'Rating',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 12.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        '2h 28min',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.24,
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      Text(
                        'English',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.24,
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      Text(
                        'PG-13',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: Color(0xFF110E47),
                      fontSize: 16.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.32,
                    ),
                  ),
                ),SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "With Spider-Man's identity now revealed, Peter asks \nDoctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear,\n l forcing Peter to discover what it truly means to be\n Spider-Man.",
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 12.sp,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      height: 1.h,
                      letterSpacing: 0.24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Row(
                    children: [
                      Text(
                        'Cast',
                        style: TextStyle(
                          color: Color(0xFF110E47),
                          fontSize: 16.sp,
                          fontFamily: 'Merriweather',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.32,
                        ),
                      ),
                      SizedBox(
                        width: 250.w,
                      ),
                      Text(
                        'See more',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFAAA8B0),
                          fontSize: 10.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(color: Colors.white,
                  height: 200.h,
                  child:
                  ListView.separated(
                    itemCount: image.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Container(
                              width: 150.w,height: 150.h,
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                               ),
                              child: ClipRRect(borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  image[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(imgname[index],
                            style: TextStyle(
                              color: Color(0xFF110E47),
                              fontSize: 12.sp,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.24,
                            ),
                           )
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
