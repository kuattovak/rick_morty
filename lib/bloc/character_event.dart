import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
}

class LoadCharacterEvent extends CharacterEvent {
  @override
  List<Object?> get props => [];
}
