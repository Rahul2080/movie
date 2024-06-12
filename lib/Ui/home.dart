import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Bloc/movies_bloc.dart';
import 'package:movies/Repository/ModelClass/MovieModel.dart';
import 'package:movies/Ui/second.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  // List<String> verimage = [
  //   "assets/venom.png",
  //   "assets/man.png",
  // ];
  // List<String> vertext = [
  //   'Venom Let There\nBe Carnage',
  //   'The King’s Man',
  // ];
  // List<String> verratetext = [
  //   '6.4/10 IMDb',
  //   '8.4/10 IMDb',
  // ];
  // List<String> verconttxt = [
  //   'HORROR',
  //   'MYSTERY',
  //   'THRILLER',
  // ];
  late MovieModel data;
  @override
  void initState() {
 BlocProvider.of<MoviesBloc>(context).add(FecthMovie());
    super.initState();
  }

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
              fontSize: 16.sp,
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
                      fontSize: 16.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.32,
                    ),
                  ),
                  SizedBox(
                    width: 170.w,
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
              SizedBox(
                height: 300.h,
                child: BlocBuilder<MoviesBloc, MoviesState>(
                  builder: (context, state) {
                    if(state is MoviesBlocLoading){
                      return Center(child: CircularProgressIndicator());
                    }
                    if(state is MoviesBlocError){
                      return Center(child: Text("Error"),);
                    }
                    if(state is MoviesBlocLoaded ){
                      data=BlocProvider.of<MoviesBloc>(context).movieModel;
                    return ListView.separated(
                      itemCount: data.movies!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                    second(
                                       img:data.movies![index].posterPath.toString(),title: data.movies![index].title.toString(),geners: data.movies![index].genres!,overview: data.movies![index].overview!,
                                    )));
                          },
                          child: Container(
                            width: 200.w,
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
                                    width: 170.w,
                                    child: Image.network(
                                      data.movies![index].posterPath.toString(),
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(height: 20,
                                    child: Text(
                                      data.movies![index].title.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.28,
                                      ),maxLines: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
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
                                      itemBuilder: (context, _) =>
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      onRatingUpdate: (double value) {},
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                     "5.6",
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
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20.w,
                        );
                      },
                    );}else{return SizedBox();}
                  },
                ),
              ),
              SizedBox(height: 22.h),
              Row(
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: Color(0xFF110E47),
                      fontSize: 16.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.32,
                    ),
                  ),
                  SizedBox(width: 220.w),
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
              BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if( state is MoviesBlocLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if (state is MoviesBlocError){
                    return Center(child: Text("Error"));
                  }
                  if (state is MoviesBlocLoaded){
                    data=BlocProvider.of<MoviesBloc>(context).movieModel;
                  return Container(height:200* data.movies!.length.toDouble(),
                    child: ListView.separated(
                                    itemCount:data.movies!.length ,
                                    scrollDirection: Axis.vertical,physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                    return Container(
                      width: 60.w,
                      height: 200.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            data.movies![index].posterPath.toString()
                          ),
                          SizedBox(width: 15.w),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 20),
                                child: SizedBox(width: 120.w,
                                  child: Text(
                                   data.movies![index].title.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.28,
                                    ),maxLines: 1,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 10),
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
                                      itemBuilder: (context, _) =>
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      onRatingUpdate: (double value) {},
                                    ),
                                    Text(
                                      "5.9",
                                      style: TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontSize: 12.sp,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.24,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 17.h),
                              Container(
                                width: 170.w,
                                height: 30.h,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: ListView.separated(
                                  itemCount: data.movies![index].genres!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index1) {
                                    return Container(
                                      width: 60.w,
                                      height: 15.h,
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
                                          data.movies![index].genres![index1],
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
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 6.w,
                                    );
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18.r,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.schedule_outlined),
                                  ),
                                  Text(
                                    '1h 47m',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                      letterSpacing: 0.24,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20.h,
                    );
                                    },
                                  ),
                  );}else { return SizedBox();}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
