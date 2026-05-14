class NormalRange {
  final double minValue;
  final double maxValue;
  final String? unit;

  const NormalRange({required this.minValue, required this.maxValue, this.unit});

  factory NormalRange.fromJson(Map<String, dynamic> j) => NormalRange(
        minValue: (j['min_value'] as num).toDouble(),
        maxValue: (j['max_value'] as num).toDouble(),
        unit: j['unit'] as String?,
      );

  String get display => '$minValue – $maxValue ${unit ?? ''}';
}

class TestResultModel {
  final int resultId;
  final int patientId;
  final int doctorId;
  final int testId;
  final String? testName;
  final String? testCode;
  final String? resultDate;
  final double value;
  final String? unit;
  final String? fastingState;
  final String? status;
  final bool isFlagged;
  final String? notes;
  final NormalRange? normalRange;

  const TestResultModel({
    required this.resultId,
    required this.patientId,
    required this.doctorId,
    required this.testId,
    this.testName,
    this.testCode,
    this.resultDate,
    required this.value,
    this.unit,
    this.fastingState,
    this.status,
    required this.isFlagged,
    this.notes,
    this.normalRange,
  });

  factory TestResultModel.fromJson(Map<String, dynamic> j) =>
      TestResultModel(
        resultId: j['result_id'] as int,
        patientId: j['patient_id'] as int,
        doctorId: j['doctor_id'] as int,
        testId: j['test_id'] as int,
        testName: j['test_name'] as String?,
        testCode: j['test_code'] as String?,
        resultDate: j['result_date'] as String?,
        value: (j['value'] as num).toDouble(),
        unit: j['unit'] as String?,
        fastingState: j['fasting_state'] as String?,
        status: j['status'] as String?,
        isFlagged: j['is_flagged'] as bool? ?? false,
        notes: j['notes'] as String?,
        normalRange: j['normal_range'] != null
            ? NormalRange.fromJson(j['normal_range'] as Map<String, dynamic>)
            : null,
      );

}
