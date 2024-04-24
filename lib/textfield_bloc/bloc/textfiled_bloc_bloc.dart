// import 'package:bloc/bloc.dart';
// import 'package:demo_apps/textfield_bloc/textfiled_model.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// part 'textfiled_bloc_event.dart';
// part 'textfiled_bloc_state.dart';

// class TextfiledBlocBloc extends Bloc<TextfiledBlocEvent, TextfiledBlocState> {
//   final BreachEmailSearchRepository breachEmailSearchRepository;
//   TextfiledBlocBloc(this.breachEmailSearchRepository)
//       : super(TextfiledBlocState(
//             isLoading: false, textFieldModel: [], errorMessage: '')) {
//     on<TextfiledBlocEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
//   final TextEditingController emailController = TextEditingController();
//   Future<void> onFetchData(
//       FeatchData event, Emitter<TextfiledBlocState> emit) async {
//     try {
//       emit(state.copyWith(isLoading: true));
//       final mailSearch = await BreachEmailSearchRepository.searchMail(
//           emailController.text.trim());
//       emit(state.copyWith(
//         isLoading: false,
//         breachEmailSearchModel: mailSearch,
//       ));
//     } catch (e) {
//       emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
//     }
//   }
// }

// class BreachEmailSearchRepository {
//   static Future<List<TextFieldModel>> searchMail() {
//     try {
//       // object
//     } catch (e) {
//       print(e);
//     }
//   }
// }
