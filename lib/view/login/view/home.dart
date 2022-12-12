import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/category.dart';
import '../viewmodel/article_list_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;

  List<Category> categories = [
    Category('business', 'İş'),
    //Category('entertainment', 'Eğlence'),
    Category('general', 'Genel'),
    Category('health', 'Sağlık'),
    Category('science', 'Bilim'),
    Category('sports', 'Spor'),
    Category('technology', 'Teknoloji'),
  ];



  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
              child: Row(
                children: [
                SizedBox(
                    height: 45,
                    width: 350,
                    child: ListView(
                      //shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: getCategoriesTab(vm),
                    ),
                  ),
                ],

              )
          ),
          Expanded(
            flex: 9,
              child: Row(
                children: [
                 getWidgetByStatus(vm),
                ],
              ))
        ],


        // children: [
        //   SizedBox(
        //     height: 45,
        //     width: double.infinity,
        //     child: ListView(
        //       scrollDirection: Axis.horizontal,
        //       children: getCategoriesTab(vm),
        //     ),
        //   ),
        //   getWidgetByStatus(vm),
        //   //
        // ],
      ),
    );
  }

  List<GestureDetector> getCategoriesTab(ArticleListViewModel vm) {
    List<GestureDetector> list = [];
    for (int i = 0; i < categories.length; i++) {
      list.add(GestureDetector(
        onTap: () => vm.getNews(categories[i].key),
        child: Card(
            child: Padding(
              padding: const EdgeInsets.all(6.5),
              child: Text(categories[i].title,
                  style: Theme.of(context).textTheme.subtitle1),
            )),
      ));
    }
    return list;
  }

  Widget getWidgetByStatus(ArticleListViewModel vm) {
    switch (vm.status.index) {
      case 2:
        return Expanded(
            child: SizedBox(
              width: 350,
              height: 600,
              child: ListView.builder(
                  itemCount: vm.viewModel.articles.length,
                  itemBuilder: (context, index) {
                    String newsTitle =
                    (vm.viewModel.articles[index].title ?? '').toString();
                    final Uri _url =
                    Uri.parse(vm.viewModel.articles[index].url ?? '');

                    return Card(
                      child: Column(
                        children: [
                          Image.network(vm.viewModel.articles[index].urlToImage ??
                              'https://media.istockphoto.com/id/1357365823/vector/default-image-icon-vector-missing-picture-page-for-website-design-or-mobile-app-no-photo.jpg?s=612x612&w=0&k=20&c=PM_optEhHBTZkuJQLlCjLz-v3zzxp-1mpNQZsdjrbns='),
                          ListTile(
                            title: Text(vm.viewModel.articles[index].title ?? '',
                                style: Theme.of(context).textTheme.subtitle2),
                            subtitle: Text(
                                vm.viewModel.articles[index].description ?? ''),
                          ),
                          ButtonBar(
                            children: [
                              MaterialButton(
                                onPressed: () async {
                                  await launchUrl(Uri.parse(
                                      vm.viewModel.articles[index].url ?? ''));
                                },
                                child: const Text('Devamını oku...',
                                    style: TextStyle(color: Colors.blue)),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ));

      default:
        return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ));
    }
  }
}
