// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      finishReason: json['finish_reason'] as String,
      index: json['index'] as int,
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'message': instance.message.toJson(),
      'finish_reason': instance.finishReason,
      'index': instance.index,
    };
