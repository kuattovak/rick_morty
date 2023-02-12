import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import './character_event.dart';
import 'package:rick_morty/models/character_model.dart';

@immutable
abstract class CharacterState extends Equatable {}

class CharacterLoadingState extends CharacterState {
  @override
  List<Object?> get props => [];
}

class CharacterLoadedState extends CharacterState {
  final List<Character> character;
  CharacterLoadedState(this.character);
  @override
  List<Object?> get props => [];
}

class CharacterErrorState extends CharacterState {
  final String error;
  CharacterErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
