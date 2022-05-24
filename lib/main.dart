import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/src/services/giphy_api.dart';
import 'package:web_app/src/widgets/card_widget.dart';

import 'src/providers/giphy_api.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GiphyApiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: _BodyImg(),
        ),
      ),
    );
  }
}

class _BodyImg extends StatelessWidget {
  const _BodyImg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gifsProvider = Provider.of<GiphyApiProvider>(context);
    gifsProvider.gifsService();

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: gifsProvider.gifs.length,
        itemBuilder: (BuildContext context, index) => CardCustomGifs(
            urlImage: gifsProvider.gifs[index].images.original.url ?? '',
            title: gifsProvider.gifs[index].username ?? ''));
  }
}
