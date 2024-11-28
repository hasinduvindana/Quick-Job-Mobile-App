import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add new employee
  Future<void> addEmployee(Map<String, dynamic> employeeData) async {
    try {
      await _db.collection('employees').add(employeeData);
    } catch (e) {
      print('Error adding employee: $e');
    }
  }

  // Add new publisher
  Future<void> addPublisher(Map<String, dynamic> publisherData) async {
    try {
      await _db.collection('publishers').add(publisherData);
    } catch (e) {
      print('Error adding publisher: $e');
    }
  }

  // Fetch all jobs
  Future<List<Map<String, dynamic>>> fetchJobs() async {
    try {
      QuerySnapshot result = await _db.collection('jobs').get();
      return result.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error fetching jobs: $e');
      return [];
    }
  }

  // Fetch applicants for a specific job
  Future<List<Map<String, dynamic>>> fetchApplicants(String jobId) async {
    try {
      QuerySnapshot result = await _db
          .collection('jobs')
          .doc(jobId)
          .collection('applicants')
          .get();
      return result.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error fetching applicants: $e');
      return [];
    }
  }
}
