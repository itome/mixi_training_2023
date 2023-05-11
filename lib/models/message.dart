import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

enum MessageRole {
  @JsonValue('system')
  system,
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
}

@JsonSerializable()
class Message {
  final MessageRole role;
  final String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
