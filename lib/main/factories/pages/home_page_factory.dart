import 'package:gitlist/main/factories/presenters/home_presenter_factory.dart';
import 'package:gitlist/ui/pages/home/home_page.dart';

HomePage makeHomePage() {
  return HomePage(makeHomePagePresenter());
}
