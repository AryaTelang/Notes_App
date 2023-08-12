import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_second/cubit/note/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(InitialState()) {
    emit(WelcomeState());
  }

  Future<void> getData() async {
    emit(LoadingState());

    try {
      final CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("notes");
      final QuerySnapshot querySnapshot = await collectionReference.get();

      if (querySnapshot.docs.isNotEmpty) {
        // Data is available
        emit(LoadedState());
      }
    } catch (e) {
      print('Error fetching data: $e');
      emit(ErrorState());
    }
  }
}
