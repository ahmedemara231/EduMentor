class Subject
{
  String name;
  String? arabicName;
  String doctor;
  String totalHours;
  List<dynamic> resultingFrom;
  List<dynamic> resultingFromNames;
  int courseHours;

  Subject({
    required this.name,
    required this.doctor,
    required this.totalHours,
    required this.courseHours,
    required this.resultingFrom,
    required this.resultingFromNames,
    required this.arabicName,
  });

  factory Subject.fromJson(Map<String,dynamic> subjectData)
  {
    return Subject(
      name: subjectData['subject'],
      doctor: subjectData['doctor'],
      totalHours: subjectData['totalHours'],
      courseHours: subjectData['courseHours'],
      resultingFrom: subjectData['resultingFrom'],
      resultingFromNames: subjectData['resultingFromNames'],
      arabicName: subjectData['arabicName']
    );
  }
}