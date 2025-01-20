// lib/features/medications/models/medication.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Medication {
  final String id;
  final String userId;
  final String name;
  final String dosage;
  final String notes;
  final bool isDaily;
  final String reminderTime;
  final DateTime? nextDose;
  final DateTime createdAt;

  Medication({
    required this.id,
    required this.userId,
    required this.name,
    required this.dosage,
    required this.notes,
    required this.isDaily,
    required this.reminderTime,
    this.nextDose,
    required this.createdAt,
  });

  factory Medication.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Medication(
      id: doc.id,
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      dosage: data['dosage'] ?? '',
      notes: data['notes'] ?? '',
      isDaily: data['isDaily'] ?? false,
      reminderTime: data['reminderTime'] ?? '',
      nextDose: (data['nextDose'] as Timestamp?)?.toDate(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'dosage': dosage,
      'notes': notes,
      'isDaily': isDaily,
      'reminderTime': reminderTime,
      'nextDose': nextDose != null ? Timestamp.fromDate(nextDose!) : null,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}