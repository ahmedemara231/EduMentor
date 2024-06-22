class Subject
{
  String name;
  String doctor;
  String totalHours;
  List<dynamic> resultingFrom;

  Subject({required this.name, required this.doctor, required this.totalHours, required this.resultingFrom});

  factory Subject.fromJson(Map<String,dynamic> subjectData)
  {
    return Subject(
        name: subjectData['subject'],
        doctor: subjectData['doctor'],
        totalHours: subjectData['totalHours'],
        resultingFrom: subjectData['resultingFrom'],
    );
  }
}