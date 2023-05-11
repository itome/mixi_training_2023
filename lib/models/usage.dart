import 'package:json_annotation/json_annotation.dart';

part 'usage.g.dart';

@JsonSerializable()
class Usage {
  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;

  @JsonKey(name: 'completion_tokens')
  final int completionTokens;

  @JsonKey(name: 'total_tokens')
  final int totalTokens;

  const Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  Map<String, dynamic> toJson() => _$UsageToJson(this);
}
