import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:muslim_today/components/properties.dart';
import 'package:muslim_today/tasbihs/duas.dart';

class Description extends StatelessWidget {
  final String text;
  final bool isArab;
  const Description({Key? key, required this.text, required this.isArab})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isArab) {
      switch (text) {
        case "Багымдат":
          return Container(
            color: black.withAlpha(50),
            padding: const EdgeInsets.all(10),
            child: Text(
              "After performing the obligatory Fajr prayer and salutation:",
              style: TextStyle(
                color: black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        case "Бешим":
          return Container(
            color: black.withAlpha(50),
            padding: const EdgeInsets.all(10),
            child: Text(
              "After performing the obligatory Dhuhr prayer and salutation:",
              style: TextStyle(
                color: black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        case "Аср":
          return Container(
            color: black.withAlpha(50),
            padding: const EdgeInsets.all(10),
            child: Text(
              "After performing the obligatory Asr prayer and salutation:",
              style: TextStyle(
                color: black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        case "Шам":
          return Container(
            padding: const EdgeInsets.all(10),
            color: black.withAlpha(50),
            child: Text(
              "After performing the obligatory Maghrib prayer and salutation:",
              style: TextStyle(
                color: black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        case "Куптан":
          return Container(
            color: black.withAlpha(50),
            padding: const EdgeInsets.all(10),
            child: Text(
              "After performing the obligatory Isha prayer and salutation:",
              style: TextStyle(
                color: black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
      }
    }
    return Container(
      color: black.withAlpha(50),
      padding: const EdgeInsets.all(10),
      child: Text(
        '$text намаздын парзы окулуп, салам берилгенден кийин:',
        style: TextStyle(
          color: black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Nav extends StatelessWidget {
  final String textAr;
  final bool isArabic;
  final String textRu;
  const Nav({
    Key? key,
    required this.textRu,
    required this.isArabic,
    required this.textAr,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: black.withAlpha(40),
      child: Text(
        isArabic ? textAr : textRu,
        style: TextStyle(
          color: black,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Solatan extends StatelessWidget {
  final bool bis;
  final String rus;
  final bool isArab;
  final String arab;
  const Solatan({
    Key? key,
    required this.bis,
    required this.isArab,
    required this.arab,
    required this.rus,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isArab
          ? const EdgeInsets.fromLTRB(5, 0, 10, 10)
          : const EdgeInsets.fromLTRB(5, 5, 5, 10),
      child: Column(
        children: <Widget>[
          if (bis)
            Padding(
              padding: isArab
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.symmetric(vertical: 15),
              child: isArab
                  ? Image.asset(
                      'assets/img/bismi.png',
                      height: 150,
                    )
                  : Text(
                      bismiRU,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        fontFamily: 'OpenSans',
                      ),
                    ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: !isArab
                ? Text(
                    rus,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                      color: black,
                    ),
                  )
                : Text(
                    arab,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 25,
                      color: black,
                      fontFamily: 'Noore',
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

Widget divider() => Container(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Text(
          '❁  ❁  ❁  ❁  ❁',
          style: TextStyle(
            color: black,
            fontSize: 30,
          ),
        ),
      ),
    );

class Counter extends StatefulWidget {
  final int max;
  final String ar;
  final bool isArabic;
  final String ru;
  const Counter({
    Key? key,
    required this.max,
    required this.ar,
    required this.isArabic,
    required this.ru,
  }) : super(key: key);
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int first = 0;
  void add() {
    setState(() {
      first++;
    });
  }

  bool _canVibrate = true;

  @override
  initState() {
    super.initState();
    init();
  }

  init() async {
    bool canVibrate = await Vibrate.canVibrate;
    _canVibrate = canVibrate;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !_canVibrate
          ? null
          : () {
              Vibrate.feedback(FeedbackType.medium);
              add();
              if (first == widget.max) {
                Vibrate.feedback(FeedbackType.warning);
              }
              if (first - widget.max == 1) {
                first = 1;
              }
            },
      child: Container(
        color: black.withAlpha(70),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.isArabic ? widget.ar : widget.ru,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: black,
                fontSize: widget.isArabic ? 28 : 20,
                fontFamily: widget.isArabic ? 'Noore' : null,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              '$first/${widget.max}',
              style: TextStyle(
                color: black,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
