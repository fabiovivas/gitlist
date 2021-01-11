import 'package:meta/meta.dart';
import 'package:gitlist/data/protocols/http_client.dart';
import 'package:gitlist/domain/models/git_content.dart';
import 'package:gitlist/domain/usecases/list_git_content.dart';

class ApiListGitContent implements IListGitContent {
  final IHttpClient httpClient;
  final String url;

  ApiListGitContent({@required this.httpClient, @required this.url});

  @override
  Future<List<GitContent>> getGitContent() async {
    try {
      var response = await httpClient.request(url: url, method: 'get');
      var gitContentList = new List<GitContent>();
      for (var gitItem in response.take(10).toList()) {
        String nameUser = await _getOwnerContent(gitItem['owner']['url']);
        var gitContent = new GitContent(
            avatar: gitItem['owner']['avatar_url'],
            nameUser: nameUser,
            repo: gitItem['name'],
            linkRepo: gitItem['html_url']);
        gitContentList.add(gitContent);
      }
      return gitContentList;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> _getOwnerContent(String url) async {
    try {
      var result = await httpClient.request(url: url, method: 'get');
      return result['name'];
    } catch (error) {
      throw error;
    }
  }
}
