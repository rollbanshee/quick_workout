import 'package:quick_workout/features/api_client/api_client.dart';

class ServerResponse {
  final String? url;
  final bool isBlock;
  final bool isResetLink;
  final String? date;
  final String? oneZeroLink;
  final String token;
  static ServerResponse? serverResponse;
  ServerResponse(this.url, this.isBlock, this.isResetLink, this.date,
      this.oneZeroLink, this.token);
  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    return ServerResponse(
      json['url'] as String?,
      bool.parse(json['isBlock']),
      bool.parse(json['isResetLink']),
      json['date'] as String?,
      json['OneZeroLink'] as String?,
      json['Token'] as String,
    );
  }
  static Future<void> getResponse() async {
    serverResponse = await ApiClient.getJson();
  }
}
