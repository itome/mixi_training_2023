import 'package:json_annotation/json_annotation.dart';
import 'package:mixi_training_2023/models/message.dart';

part 'choice.g.dart';

@JsonSerializable(explicitToJson: true)
class Choice {
  final Message message;
  @JsonKey(name: 'finish_reason')
  final String finishReason;
  final int index;

  const Choice({
    required this.message,
    required this.finishReason,
    required this.index,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}
