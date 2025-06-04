class Patients{
  final String name;
  final int age;
  final String gender;
  final String date;
  final String time;
  final int los;
  final String clinic;
  final String bed;
  final String doctor;
  final String status;
  Patients({
    required this.name,
    required this.age,
    required this.gender,
    required this.date,
    required this.time,
    required this.los,
    required this.clinic,
    required this.bed,
    required this.doctor,
    required this.status,

});
  factory Patients.fromJson(Map<String, dynamic>json){
    return Patients(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      date: json['date'],
      time: json['time'],
      los: json['los'],
      clinic: json['clinic'],
      bed: json['bed'],
      doctor: json['doctor'],
      status: json['status'],

    );
  }
}