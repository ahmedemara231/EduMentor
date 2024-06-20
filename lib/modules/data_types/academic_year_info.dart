class AcademicYearInfo {
  String year;
  String title;
  String totalHoursToPass;

  AcademicYearInfo({
    required this.year,
    required this.title,
    required this.totalHoursToPass,
  });

  factory AcademicYearInfo.fromJson(Map<String, dynamic> yearInfo)
  {
    return AcademicYearInfo(
        year: yearInfo['year'],
        title: yearInfo['title'],
        totalHoursToPass: yearInfo['totalHoursToPass'],
    );
  }
}
