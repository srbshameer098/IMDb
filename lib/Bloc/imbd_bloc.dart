import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:imdb/Repository/Api/imdb_api.dart';
import 'package:meta/meta.dart';

import '../Repository/ModelClass/ImdbModel.dart';

part 'imbd_event.dart';
part 'imbd_state.dart';

class ImbdBloc extends Bloc<ImbdEvent, ImbdState> {
  ImdbApi imdbApi=ImdbApi();
  late ImdbModel imdbModel;
  ImbdBloc() : super(ImbdInitial()) {
    on<FetchImdbEvent>((event, emit) async{
      emit(ImbdblocLoading());
      try{

        imdbModel = await imdbApi.getImdb();
        emit(ImbdblocLoaded());
      }catch(e){
        print(e);
        emit(ImbdblocError());
      }

      // TODO: implement event handler
    });
  }
}
