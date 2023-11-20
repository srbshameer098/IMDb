import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Bloc/imbd_bloc.dart';
import '../Repository/ModelClass/ImdbModel.dart';
class Videoplayer extends StatefulWidget {
  const Videoplayer({Key? key}) : super(key: key);

  @override
  State<Videoplayer> createState() => _VideoplayerState();
}


late ImdbModel data;



class _VideoplayerState extends State<Videoplayer> {

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
  Widget build(BuildContext context)=>
   YoutubePlayerBuilder(
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

          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [


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
          ),
        ),

    );
  void addLister(Null Function() param0) {}
  }

