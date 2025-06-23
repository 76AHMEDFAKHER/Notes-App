part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

final class NotesCubitLoading extends NotesCubitState {}

final class NotesCubitSucces extends NotesCubitState {
  final List<NotesModel> notesList;

  NotesCubitSucces(this.notesList);
}

final class NotesCubitError extends NotesCubitState {
  final String errorMessage;

  NotesCubitError(this.errorMessage);

  showError() {
    log('Error: $errorMessage');
  }
}
