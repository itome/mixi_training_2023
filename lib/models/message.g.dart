// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      role: $enumDecode(_$MessageRoleEnumMap, json['role']),
      content: json['content'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'role': _$MessageRoleEnumMap[instance.role]!,
      'content': instance.content,
    };

const _$MessageRoleEnumMap = {
  MessageRole.system: 'system',
  MessageRole.user: 'user',
  MessageRole.assistant: 'assistant',
};
