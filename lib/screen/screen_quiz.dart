import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:python_django_dart_quize_app/model/model_quiz.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.quizs});
  final List<Quiz> quizs;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> _answers = [-1, -1, -1];
  List<bool> _answerState = [false, false, false, false];
  int _curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurple),
            ),
            width: width * 0.85,
            height: height * 0.5,
            child: Swiper(
              physics: const NeverScrollableScrollPhysics(),
              loop: false,
              itemCount: widget.quizs.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildQuizCard(widget.quizs[index], width, height);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(Quiz quiz, double width, double height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.024),
            child: Text(
              'Q' + (_curentIndex + 1).toString() + '.',
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: width * 0.8,
            padding: EdgeInsets.only(top: width * 0.02),
            child: AutoSizeText(
              quiz.title,
              style: TextStyle(
                  fontSize: width * 0.048, fontWeight: FontWeight.bold),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          // Column(
          //   children: _buildCandidates(width, quiz),
          // ),
        ],
      ),
    );
  }

  // List<Widget> _buildCandidates(double width, Quiz quiz) {
  //   List<Widget> _childern = [];
  //   for (int i = 0; i < 4; i++) {
  //     _childern.add(value);
  //   }

  //   return _childern;
  // }
}
