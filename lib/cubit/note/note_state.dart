import 'package:equatable/equatable.dart';
abstract class NoteState extends Equatable{}

class InitialState extends NoteState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends NoteState {
  @override
  List<Object> get props => [];
}
class LoadingState extends NoteState {
  @override
  List<Object> get props => [];
}
class LoadedState extends NoteState {


  @override
  List<Object> get props => [];
}
class ErrorState extends NoteState {
  @override
  List<Object> get props => [];
}