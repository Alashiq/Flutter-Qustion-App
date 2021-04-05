class QustionsModel {
  final String questionTitle;
  final String auther;



  QustionsModel({this.questionTitle, this.auther});

  factory QustionsModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return QustionsModel(
        questionTitle: jsonData['QuestionTitle'],
        auther: jsonData['FirstName'] + " " +  jsonData['LastName'],
        );
  }
}

