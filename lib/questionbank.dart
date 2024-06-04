import 'package:quizuaf/question.dart';

class QuestionBank{
  int count=0;
  List<Question> _questionbank = [
    Question("Are you human?", true),
    Question("Data scientists typically need a combination of technical skills, nontechnical ones and suitable personality traits to be successful.", false),
    Question("C++ is most widely used by data scientists?", true),
    Question("Car has wheeel?", true)
  ];
  
  void NextQuestionNumber(){
    if(count < _questionbank.length-1){
      count++;
    }
  }
  String? GetQuestion(){
    return _questionbank[count].QuestionValue;
  }
  
  bool? GetAnswerKey(){
    return _questionbank[count].AnswerKey;
  }
  
  bool FinishQuiz(){
    if(count>= _questionbank.length-1){
      return true;
    }
    else{
      return false;
    }
  }
  
  void resetquiz(){
    count=0;
  }
  
  
  
  
}