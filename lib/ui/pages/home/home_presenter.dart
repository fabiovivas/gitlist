import 'git_content_view_model.dart';

abstract class IHomePresenter {
  List<GitContentViewModel> gitContentList;
  Future<void> getGitContentList();
}