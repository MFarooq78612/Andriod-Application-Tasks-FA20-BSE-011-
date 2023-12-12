import 'package:ibm_table_gen_app/constantFile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const kLabelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kNumberStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonstyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  int sliderHeight = 1;
  int sliderUpperLimit = 20;
  int sliderLowerLimit = 1;
  int sliderAge = 20;
  int upperWeightLimit = 20;
  int lowerAgeLimit = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Generator app'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RepeatContainerCode(
                    colors: selectGender == Gender.male ? activeColor : deActiveColor,
                    cardWidget: const RepeatTextandICONeWidget(
                      icondata: Icons.male,
                      label: ' ',
                    ),
                    onPressed: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RepeatContainerCode(
                    colors: selectGender == Gender.female ? activeColor : deActiveColor,
                    cardWidget: const RepeatTextandICONeWidget(
                      icondata: Icons.female,
                      label: '',
                    ),
                    onPressed: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RepeatContainerCode(
              onPressed: () {},
              colors: const Color(0xFF1D1E33),
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Table Generator',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sliderHeight.toString(),
                        style: kNumberStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: sliderHeight.toDouble(),
                    min: 1.0,
                    max: 10.0,
                    activeColor: const Color(0XFFEB1555),
                    inactiveColor: const Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        sliderHeight = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RepeatContainerCode(
                    onPressed: () {
                      setState(() {
                        if (sliderUpperLimit < upperWeightLimit) {
                          sliderUpperLimit++;
                        }
                      });
                    },
                    colors: const Color(0xFF1D1E33),
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Upper Limit',
                          style: kLabelStyle,
                        ),
                        Text(
                          sliderUpperLimit.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (sliderUpperLimit < upperWeightLimit) {
                                    sliderUpperLimit++;
                                  }
                                });
                              },
                            ),
                            RoundIcon(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (sliderUpperLimit > 1) {
                                    sliderUpperLimit--;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RepeatContainerCode(
                    onPressed: () {
                      setState(() {
                        if (sliderLowerLimit > 1) {
                          sliderLowerLimit--;
                        }
                      });
                    },
                    colors: const Color(0xFF1D1E33),
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Lower Limit',
                          style: kLabelStyle,
                        ),
                        Text(
                          sliderLowerLimit.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (sliderLowerLimit < upperWeightLimit) {
                                    sliderLowerLimit++;
                                  }
                                });
                              },
                            ),
                            RoundIcon(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (sliderLowerLimit > 1) {
                                    sliderLowerLimit--;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TableDisplayPage(
                    height: sliderHeight,
                    upperLimit: sliderUpperLimit,
                    lowerLimit: sliderLowerLimit,
                  ),
                ),
              );
            },
            child: Container(
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: const Center(
                child: Text(
                  'Generate Table',
                  style: kLargeButtonstyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TableDisplayPage extends StatelessWidget {
  final int height;
  final int upperLimit;
  final int lowerLimit;

  const TableDisplayPage({
    Key? key, // Fix here, it should be Key? key instead of super.key
    required this.height,
    required this.upperLimit,
    required this.lowerLimit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Display'),
      ),
      body: Center(
        child: Container(
          // Add background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Multiplication Table for $height', style: kLabelStyle),
              const SizedBox(height: 10.0),
              for (int i = lowerLimit; i <= upperLimit; i++)
                Text('$height x $i = ${height * i}', style: kNumberStyle),
              const SizedBox(height: 20.0),
              SizedBox(
                width: 200.0, // Increase button width
                height: 50.0, // Increase button height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(
                          height: height,
                          upperLimit: upperLimit,
                          lowerLimit: lowerLimit,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEB1555), // Set button color
                  ),
                  child: const Text('Start Quiz'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final int height;
  final int upperLimit;
  final int lowerLimit;

  const QuizPage({
    Key? key,
    required this.height,
    required this.upperLimit,
    required this.lowerLimit,
  }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int correctAnswers = 0;
  List<Question> questions = [];
  bool isMultipleChoice = true; // Default quiz type is MSQ

  @override
  void initState() {
    super.initState();
    generateQuestions();
  }

  void generateQuestions() {
    questions.clear();
    List<int> sequence =
    List.generate(widget.upperLimit - widget.lowerLimit + 1, (index) => widget.lowerLimit + index);
    sequence.shuffle();

    for (int i in sequence) {
      int result = widget.height * i;
      List<String> options = isMultipleChoice ? generateOptions(result) : ['True', 'False'];

      questions.add(Question(
        questionNumber: questions.length + 1,
        question: isMultipleChoice ? '${widget.height} x $i = ?' : 'Is ${widget.height} x $i equal to $result?',
        correctAnswer: result.toString(),
        options: options,
      ));
    }
  }

  List<String> generateOptions(int correctAnswer) {
    List<String> options = [];
    options.add(correctAnswer.toString());
    while (options.length < 4) {
      int randomOption = correctAnswer + (1 + (DateTime.now().millisecondsSinceEpoch % 10));
      if (!options.contains(randomOption.toString())) {
        options.add(randomOption.toString());
      }
    }
    options.shuffle();
    return options;
  }

  void answerQuestion(String selectedAnswer) {
    if (selectedAnswer == questions[currentIndex].correctAnswer) {
      correctAnswers++;
    }

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      // Display the result page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            correctAnswers: correctAnswers,
            totalQuestions: questions.length,
            isMultipleChoice: isMultipleChoice,
          ),
        ),
      );
    }
  }

  void switchQuizType() {
    setState(() {
      isMultipleChoice = !isMultipleChoice;
      currentIndex = 0;
      correctAnswers = 0;
      generateQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${currentIndex + 1}/${questions.length}',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Quiz for Multiplication Table of ${widget.height}',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            QuestionWidget(
              question: questions[currentIndex],
              onAnswerSelected: answerQuestion,
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                onPressed: switchQuizType,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEB1555),
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                ),
                child: Text(
                  isMultipleChoice ? 'Switch to True/False Quiz' : 'Switch to MSQ Quiz',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final bool isMultipleChoice;

  const ResultPage({
    Key? key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.isMultipleChoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quiz Completed!'),
            Text('Correct Answers: $correctAnswers / $totalQuestions'),
            if (correctAnswers > 5)
              const Text('Congratulations, you passed!')
            else
              const Text('Hard work needed. Keep trying!'),
            if (!isMultipleChoice)
              Text('True/False Correct Answers: $correctAnswers / $totalQuestions'),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final String correctAnswer;
  final List<String> options;
  final int questionNumber;

  Question({
    required this.question,
    required this.correctAnswer,
    required this.options,
    required this.questionNumber,
  });
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function(String) onAnswerSelected;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question.question,
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(height: 20.0),
        Column(
          children: question.options.map((option) {
            var kOptionTextStyle = TextStyle(fontSize: 16.0);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {
                  if (option == question.correctAnswer) {
                    kOptionTextStyle = TextStyle(fontSize: 16.0, color: Colors.green);
                  } else {
                    kOptionTextStyle = TextStyle(fontSize: 16.0, color: Colors.red);
                  }
                  onAnswerSelected(option);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: EdgeInsets.all(10.0),
                ),
                child: Text(
                  option,
                  style: kOptionTextStyle,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
class RoundIcon extends StatelessWidget {
  const RoundIcon({super.key, required this.iconData, this.onPress});
  final IconData? iconData;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        height: 40.0,
        width: 40.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0XFF4C4F5E),
      child: Icon(iconData),
    );
  }
}

class RepeatContainerCode extends StatelessWidget {
  const RepeatContainerCode({super.key, required this.colors, required this.cardWidget, this.onPressed});

  final Color colors;
  final Widget cardWidget;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardWidget,
      ),
    );
  }
}

class RepeatTextandICONeWidget extends StatelessWidget {
  const RepeatTextandICONeWidget({super.key, required this.icondata, required this.label});

  final IconData icondata;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icondata,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelStyle,
        ),
      ],
    );
  }
}