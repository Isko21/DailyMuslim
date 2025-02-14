import 'package:muslim_today/components/appbar.dart';
import 'package:muslim_today/components/properties.dart';
import 'package:flutter/material.dart';

class AsMaulHusna extends StatelessWidget {
  const AsMaulHusna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: AppBarCustom(title: 'Al Asma Ul Husna', elevation: 1),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: color.withAlpha(50),
        child: ListView.builder(
            itemCount: 99,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(names[index].eng,
                      style: TextStyle(color: white.withAlpha(200))),
                  subtitle: Text(names[index].tr,
                      style: TextStyle(color: white.withAlpha(100))),
                  trailing: Text(names[index].ar,
                      style: TextStyle(
                          color: white.withAlpha(220),
                          fontSize: 20,
                          fontFamily: 'Noore')),
                  leading:
                      Text('${index += 1}', style: TextStyle(color: white)),
                ),
              );
            }),
      ),
    );
  }
}

class AlHusna {
  final String ar, tr, eng;
  AlHusna({required this.tr, required this.eng, required this.ar});
}

List<AlHusna> names = <AlHusna>[];
