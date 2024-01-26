import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Класс виджета кнопки заполненного типа
//25.01 23:36
//Danil
class MyButtonFilled extends StatelessWidget {
  final Function onClick;
  final String text;
  final double width;
  final double height;
  final bool enabled;
  final double fontSize;

  //Конструктор
  const MyButtonFilled(
      {super.key,
      required this.enabled,
      required this.onClick,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //Обработка нажатий
      onTap: this.enabled ? () {
        onClick.call();
      } : null,
      //Осоновной контейнер
      child: Container(
        width: width,
        height: height,
        //Закругление кнопки и ее фон
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: this.enabled? const Color.fromARGB(255, 5, 95, 250) : Color.fromARGB(255, 167, 167, 167)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              //Текст кнопки
              child: Text(text,
                  style: GoogleFonts.roboto(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
        ),
      ),
    );
  }
}
