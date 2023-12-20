part of 'information_bloc.dart';


class InformationState {
  final bool isFetched;
  final Information? infomation;

  InformationState({required this.isFetched,this.infomation});
}

class InformationInitial extends InformationState {
  InformationInitial({required super.isFetched});
}
