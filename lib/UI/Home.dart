import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/Bloc/imbd_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Repository/ModelClass/ImdbModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


List<String> name = [
  'All Shows',
  'Movies',
  'TV Shows',
  'Streamings',
];
int selectedIndex = -1;


late ImdbModel data;

class _HomeState extends State<Home> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    BlocProvider.of<ImbdBloc>(context).add(FetchImdbEvent());
    super.initState();
   const url = 'https://www.youtube.com/embed/uYPbbksJxIg';
   controller =YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(url)!,
   flags: const YoutubePlayerFlags(
     mute: false,
     loop: false,
     autoPlay: true,
       hideControls: false,
   )

   );addLister((){
     if(mounted){
       setState(() {

       });
     }
    }

    )
    ;
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
  player: YoutubePlayer(
    controller:controller,
  ),
     builder:(context,player)
     => Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Color(0xffF5C418),
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Image.asset("assets/imdb.png",
              width: 48.w,
              height: 40.h,),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Icon(Icons.notifications),
            )
          ],
        ),
        body: BlocBuilder<ImbdBloc, ImbdState>(
          builder: (context, state) {

      if(state is ImbdblocLoading) {
      return Center(child: CircularProgressIndicator());
      }
      if(state is ImbdblocError){
      return Center(child: Text("ERROR"),);
      }
      if (state is ImbdblocLoaded){

        data=BlocProvider.of<ImbdBloc>(context).imdbModel;

            return SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 370.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Image.network(data.bigImage.toString(),
                      width: 55.w,
                      height: 50.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h,),


                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Image.network(data.bigImage.toString(),

                                    ),
                                  ),
                                  Positioned(
                                      left: 25, top: 35,
                                      child: Icon(
                                        Icons.play_arrow, color: Colors.white,
                                        size: 50,))

                                ]),
                            SizedBox(width: 10.w,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: Color(0xffF5C418)
                                  ),

                                  child:  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [

                                        Text(data.year.toString(),
                                          style:
                                          TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),

                                Text(data.title.toString(),
                                  style:
                                  TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 20.sp
                                  ),),
                                Text(data.genre.toString(),
                                  style:
                                  TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 14.sp
                                  ),),
                                Row(
                                  children: [
                                    Text('Director : ',
                                      style:
                                      TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white
                                      ),),
                                    Text(data.director.toString(),
                                      style:
                                      TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 10.sp
                                      ),),
                                  ],
                                ),
                                Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Writers : ',
                                      style:
                                      TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white
                                      ),),
                                    Container(
                                      width: 130, margin: EdgeInsets.only(top: 4),
                                      child: Text(data.writers.toString(),
                                        style:
                                        TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 10.sp
                                        ),),
                                    ),
                                  ],
                                ),
                              ],
                            ),


                          ],
                        ),


                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [

                                  Icon(Icons.star, color: Color(0xffF5C418),),

                                  SizedBox(width: 10.sp,),

                                  Text(data.rating.toString(),
                                    style:
                                    TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                    ),),

                                  Text('/10',
                                    style:
                                    TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontSize: 20.sp
                                    ),),
                                  SizedBox(width: 10.sp,),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 3),
                                    child: Text('3K',
                                      style:
                                      TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontSize: 12.sp
                                      ),),
                                  ),

                                ],
                              ),
                            ),

                            SizedBox(width: 10.w,),


                          ],
                        ),

                        SizedBox(height: 10.h,),
                        Text(
                          data.description.toString(),
                          style:
                          TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,

                          ),),
                        player,
                        SizedBox(height: 16),
                        ElevatedButton(
                          child: Text(controller.value.isPlaying ?'Pause':'Play'),
                          onPressed: (){
                         if (controller.value.isPlaying){
                           controller.pause();
                         }else{
                           controller.play();
                         }
                        },
                        ),

                      ],
                    ),
                  ),


                ],
              ),
            );}else{return SizedBox();}
          },
        ),

      ),
    );

  void addLister(Null Function() param0) {}
  }




