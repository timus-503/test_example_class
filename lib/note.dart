import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int id;
  final String title;

  const Note({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}
