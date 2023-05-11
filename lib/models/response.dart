import 'package:json_annotation/json_annotation.dart';
import 'package:mixi_training_2023/models/choice.dart';
import 'package:mixi_training_2023/models/usage.dart';

part 'response.g.dart';

@JsonSerializable(explicitToJson: true)
class Response {
  final String id;
  final String object;
  final int created;
  final String model;
  final Usage usage;
  final List<Choice> choices;

  const Response({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.usage,
    required this.choices,
  });

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
