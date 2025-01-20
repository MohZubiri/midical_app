import 'package:flutter/foundation.dart';

class Medication {
  final String id;
  final String name;
  final String dosage;
  final DateTime expirationDate;
  final int stock;
  final String instructions;
  final List<DateTime> scheduledTimes;

  Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.expirationDate,
    required this.stock,
    required this.instructions,
    required this.scheduledTimes,
  });
}

class MedicationProvider with ChangeNotifier {
  final List<Medication> _medications = [];
  final Map<String, List<DateTime>> _medicationHistory = {};

  List<Medication> get medications => [..._medications];
  Map<String, List<DateTime>> get medicationHistory => {..._medicationHistory};

  Future<void> addMedication(Medication medication) async {
    // TODO: Implement Firebase/Local Storage
    _medications.add(medication);
    notifyListeners();
  }

  Future<void> updateMedication(Medication medication) async {
    final index = _medications.indexWhere((med) => med.id == medication.id);
    if (index >= 0) {
      _medications[index] = medication;
      notifyListeners();
    }
  }

  Future<void> deleteMedication(String medicationId) async {
    _medications.removeWhere((med) => med.id == medicationId);
    _medicationHistory.remove(medicationId);
    notifyListeners();
  }

  Future<void> recordMedicationTaken(String medicationId) async {
    if (!_medicationHistory.containsKey(medicationId)) {
      _medicationHistory[medicationId] = [];
    }
    _medicationHistory[medicationId]!.add(DateTime.now());
    notifyListeners();
  }

  List<DateTime> getMedicationHistory(String medicationId) {
    return _medicationHistory[medicationId] ?? [];
  }

  List<Medication> getLowStockMedications({int threshold = 5}) {
    return _medications.where((med) => med.stock <= threshold).toList();
  }

  List<Medication> getExpiringMedications({int daysThreshold = 30}) {
    final thresholdDate = DateTime.now().add(Duration(days: daysThreshold));
    return _medications
        .where((med) => med.expirationDate.isBefore(thresholdDate))
        .toList();
  }
}