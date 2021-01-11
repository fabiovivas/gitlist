import 'package:gitlist/domain/models/git_content.dart';

abstract class IListGitContent {
  Future<List<GitContent>> getGitContent();
}
