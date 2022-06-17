
class GetUserResponseError {

  String? message;
  String? documentation_url;

  GetUserResponseError({
    this.message,
    this.documentation_url
  });

  GetUserResponseError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    documentation_url = json['documentation_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['documentation_url'] = documentation_url;
    return data;
  }

}