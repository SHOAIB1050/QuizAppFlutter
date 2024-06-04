import 'package:flutter/material.dart';
import 'package:quizuaf/questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank QA = QuestionBank();
 

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {
  @override
  List<Icon> _Iconset = [];
  void _checkQuestion(bool UserSelectedKey){
    setState(() {
      if(QA.FinishQuiz() == true){
        Alert(
            context: context,
            title: "Finish",
            desc: "You have completed!!!"
        ).show();
        QA.resetquiz();
        _Iconset=[];
      }
      else{
        if(QA.GetAnswerKey() == UserSelectedKey){
          _Iconset.add(Icon(Icons.check, size: 50,color: Colors.green,),);
        }
        else{
          _Iconset.add(Icon(Icons.close, size: 50,color: Colors.red,));
        }
        QA.NextQuestionNumber();
      }
    });
    
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  QA.GetQuestion()!, textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.all(20)
                ),
                onPressed: (){
                  _checkQuestion(true);
                },
                child: const Text("True", 
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(20)
                ),
                onPressed: (){
                  _checkQuestion(false);
                },
                child: const Text("False", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 20,),
              Row(children: _Iconset)
            ],
          ),
        
      ),
    );
  }
}