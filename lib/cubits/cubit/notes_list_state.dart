part of 'notes_list_cubit.dart';

@immutable
sealed class NotesListState {}

final class NotesListInitial extends NotesListState {}

final class NotesListLoading extends NotesListState {}

final class NotesListSuccess extends NotesListState {
  final List<NotesModel> notes;

  NotesListSuccess(this.notes);
}

final class NotesListError extends NotesListState {
  final String error;

  NotesListError(this.error);
}

final class NotesListEmpty extends NotesListState {
  final String message;

  NotesListEmpty(this.message);
}
