import 'package:gitlist/main/factories/usecases/list_git_content.dart';
import 'package:gitlist/presentation/home_presenter.dart';

HomePresenter makeHomePagePresenter() {
  return new HomePresenter(listGitContent: makeListGitContent());
}
