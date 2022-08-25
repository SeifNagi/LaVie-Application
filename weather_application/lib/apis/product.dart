import 'dart:convert';

import 'package:http/http.dart' as http;

void fetchProduct() async {
  var headers = {'Authorization': 'Bearer <token>'};
  var request = http.Request('GET', Uri.parse('{{baseUrl}}/api/v1/products'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
