import 'package:flutter/material.dart';
import 'package:gitlist/ui/pages/home/home_presenter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final IHomePresenter homePresenter;
  const HomePage(this.homePresenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: homePresenter.getGitContentList(),
          builder: (context, snapshot) {
            if (this.homePresenter.gitContentList.length == 0)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
                itemCount: this.homePresenter.gitContentList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                    child: GestureDetector(
                      onTap: () async {
                        var url =
                            this.homePresenter.gitContentList[index].linkRepo;
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Card(
                        child: ListTile(
                          leading: ClipOval(
                            child: Image.network(
                              this.homePresenter.gitContentList[index].avatar,
                            ),
                          ),
                          title: Text(this
                              .homePresenter
                              .gitContentList[index]
                              .nameUser),
                          subtitle: Text(
                              this.homePresenter.gitContentList[index].repo),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
