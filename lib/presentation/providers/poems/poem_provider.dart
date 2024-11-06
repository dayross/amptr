



import 'package:amptr/domain/entities/entities.dart';
import 'package:amptr/infrastructure/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final poemasProvider = StateNotifierProvider<PoemNotifier, PoemState>((ref){
  return PoemNotifier();
});

class PoemNotifier extends StateNotifier<PoemState>{
  PoemNotifier() : super( PoemState());

  final repository = PoemsRepositoryImpl();

  void getRandom() async{
    try{
      state = state.copyWith(loading: true);

      var response = await repository.getRandom();
      
      while (response.contenido.contenido == state.poema?.contenido.contenido){
        response = await repository.getRandom();
      }
      
      state = state.copyWith(
        poema: response,
        loading: false
      );
    } catch (e){
      rethrow;
    }
  }

  void getPoemaByType(String type) async{
    try{
      state = state.copyWith(loading: true);

      final response = await repository.getPoemaByType(type);

      state = state.copyWith(
        texto: response,
        loading: false
      );
    } catch(e){
      rethrow;
    }
  }
}


class PoemState{
  final PoemaEntity? poema;
  final Contenido? texto;
  final bool? loading;

  PoemState({
    this.poema,
    this.texto,
    this.loading = false,
    });

  PoemState copyWith({
    PoemaEntity? poema,
    Contenido? texto,
    bool? loading
  }) => PoemState(
    poema : poema ?? this.poema,
    texto : texto ?? this.texto,
    loading : loading ?? this.loading,
  );

  
}