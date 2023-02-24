import 'package:learning_app/model/jhister_models.dart';
import 'package:learning_app/network/network_client.dart';

class ContentService {
  ContentService({required this.networkClient});
  final NetworkClient networkClient;

  Future<List<ContentModel>> getContent() async {
    const apiUrl = '/contents';
    final response = await networkClient.getRequest(apiUrl);
    final contents = (response.data as List<dynamic>)
        .map((e) => ContentModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return response.statusCode == 200 ? contents : [];
  }
}
