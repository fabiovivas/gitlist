import 'package:get/get.dart';
import 'package:gitlist/ui/pages/home/git_content_view_model.dart';
import 'package:gitlist/ui/pages/home/home_presenter.dart';
import 'package:meta/meta.dart';
import 'package:gitlist/domain/usecases/list_git_content.dart';

class HomePresenter implements IHomePresenter{
  final IListGitContent listGitContent;
  List<GitContentViewModel> gitContentList = [];

  HomePresenter({@required this.listGitContent});

  Future<void> getGitContentList() async {
    try {
      var result = await listGitContent.getGitContent();
      gitContentList = result.map<GitContentViewModel>((item) => GitContentViewModel(
          avatar: item.avatar,
          linkRepo: item.linkRepo,
          nameUser: item.nameUser,
          repo: item.repo)).toList();
    } catch (error) {
      print(error);
    }
  }
}
