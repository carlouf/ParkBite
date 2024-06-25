import 'package:flutter/material.dart';
import 'quiz_data.dart'; // Import your quiz data

class TriviaQuiz extends StatefulWidget {
  const TriviaQuiz({Key? key}) : super(key: key);

  @override
  _TriviaQuizState createState() => _TriviaQuizState();
}

class _TriviaQuizState extends State<TriviaQuiz> {
  int _currentQuestionIndex = 0;
  Map<int, String> _userAnswers = {}; // Changed to store selected answer as String
  int _score = 0;
  bool _answered = false; // Track if user has answered current question

  void answerQuestion(String selectedAnswer) {
    setState(() {
      _userAnswers[_currentQuestionIndex] = selectedAnswer;
      _answered = true; // User has answered, show "Next Question" button
      if (selectedAnswer == quizQuestions[_currentQuestionIndex]['correctAnswer']) {
        _score++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < quizQuestions.length - 1) {
        _currentQuestionIndex++;
        _answered = false; // Reset to hide "Next Question" button
      } else {
        // Quiz completed, show results or completion message
        showCompletionDialog();
      }
    });
  }

  void showCompletionDialog() {
    String rewardMessage = '';

    // Determine reward based on score
    if (_score == quizQuestions.length) {
      rewardMessage = 'Congratulations! You got all questions right. Here\'s a special reward!';
    } else if (_score >= (quizQuestions.length * 0.8).ceil()) {
      rewardMessage = 'Great job! You answered $_score out of ${quizQuestions.length} questions correctly.';
    } else {
      rewardMessage = 'Nice try! You answered $_score out of ${quizQuestions.length} questions correctly.';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Completed'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your score: $_score / ${quizQuestions.length}'),
              SizedBox(height: 16.0),
              Text(rewardMessage),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Reset quiz or navigate back to previous screen
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trivia Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Question ${_currentQuestionIndex + 1}: ${quizQuestions[_currentQuestionIndex]['question']}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Column(
              children: List.generate(
                quizQuestions[_currentQuestionIndex]['options'].length,
                    (index) {
                  String option = quizQuestions[_currentQuestionIndex]['options'][index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: _answered ? null : () => answerQuestion(option), // Disable button if already answered
                      child: Text(option),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            if (_answered) // Show "Next Question" button only if answered
              ElevatedButton(
                onPressed: nextQuestion,
                child: Text(_currentQuestionIndex < quizQuestions.length - 1 ? 'Next Question' : 'Finish Quiz'),
              ),
          ],
        ),
      ),
    );
  }
}
