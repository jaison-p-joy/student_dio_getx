import 'package:dio/dio.dart';
import 'package:student_dio_getx/api/paths.dart';
import 'package:student_dio_getx/model/student.dart';

class ApiServices {
  Dio dio = Dio();
  ApiServices() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<List<Student>> fetchStudents(String endPoint) async {
    try {
      final response = await dio.get(endPoint);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        print(data);
        List<Student> students = data.map((studentData) {
          return Student(
              name: studentData['name'],
              age: studentData['age'],
              major: studentData['major'],
              gpa: studentData['gpa'],
              id: studentData['id']);
        }).toList();
        return students;
      } else {
        throw Exception('Failed to load students');
      }
    } catch (e) {
      throw Exception('Faild to load students: $e');
    }
  }

  Future<Student> createStudent(
      {required String name,
      required String age,
      required String major,
      required String gpa}) async {
    try {
      final response = await dio.post(studentEndpoint, data: {
        'name': name,
        'age': age,
        'major': major,
        'gpa': gpa,
      });

      if (response.statusCode == 201) {
        final studentData = response.data as Map<String, dynamic>;
        final student = Student(
          name: studentData['name'],
          age: studentData['age'],
          major: studentData['major'],
          gpa: studentData['gpa'],
          id: studentData['id'],
        );
        return student;
      } else {
        throw Exception('Failed to create student');
      }
    } catch (e) {
      throw Exception('Failed to create student: $e');
    }
  }
}
