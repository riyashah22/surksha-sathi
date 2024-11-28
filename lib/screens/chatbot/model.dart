// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelMessage {
  final bool isPrompt;
  final String message;
  final DateTime time;
  ModelMessage({
    required this.isPrompt,
    required this.message,
    required this.time,
  });
}
