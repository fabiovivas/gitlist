import 'package:gitlist/data/usecases/list_git_content/api_list_git_content.dart';
import 'package:gitlist/domain/usecases/list_git_content.dart';
import 'package:gitlist/main/factories/http/api_url_factory.dart';
import 'package:gitlist/main/factories/http/http_client_factory.dart';

IListGitContent makeListGitContent() {
  return new ApiListGitContent(
      httpClient: makeHttpAdapter(), url: makeApiUrl('repositories'));
}
