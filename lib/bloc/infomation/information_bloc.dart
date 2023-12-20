import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:m_test/repository/information_repository.dart';
import 'package:meta/meta.dart';

import '../../modal/information_modal_class.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc() : super(InformationInitial(isFetched: false)) {
    on<FetchInformationAPI>((event, emit) async{
      emit(InformationState(isFetched: true,));
      final Information information = await InfoRepository.fetchRandomAPI();
      emit(InformationState(isFetched: false,infomation: information));
    });
  }
}