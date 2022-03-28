import 'package:daily_muslim/animations/bottom_animation.dart';
import 'package:daily_muslim/components/properties.dart';
import 'package:daily_muslim/model/ayat/ayat.dart';
import 'package:flutter/material.dart';

class SurahAyats extends StatelessWidget {
  final List<Ayat>? ayatsList;
  final String? surahName;
  final String? surahEnglishName;
  final String? englishMeaning;
  const SurahAyats(
      {Key? key,
      this.ayatsList,
      this.englishMeaning,
      this.surahEnglishName,
      this.surahName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: height * 0.3,
              backgroundColor: white,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: new Text('A Synthwave Mix'),
                centerTitle: true,
                titlePadding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                background: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                  child: Image.network(
                    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4bb82b72535211.5bead62fe26d5.jpg',
                    height: MediaQuery.of(context).size.height * 0.43,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => line(height, index, width),
                  childCount: ayatsList!.length),
            ),
          ],
        ),
      ),
    );
  }

  Widget line(double height, int index, double width) {
    return Padding(
      padding: EdgeInsets.fromLTRB(width * 0.015, 0, 0, 0),
      child: WidgetAnimator(
        child: ListTile(
          trailing: CircleAvatar(
            radius: height * 0.013,
            backgroundColor: const Color(0xff04364f),
            child: CircleAvatar(
                radius: height * 0.012,
                backgroundColor: Colors.white,
                child: Text(
                  ayatsList![index].number.toString(),
                  style: TextStyle(fontSize: height * 0.015),
                )),
          ),
          title: Text(ayatsList![index].text!,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: height * 0.033, color: black, fontFamily: 'Noore')),
        ),
      ),
    );
  }
}
