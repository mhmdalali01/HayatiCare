import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/test_result_model.dart';
import '../services/api_service.dart';
import 'auth_provider.dart';

class TestResultsState {
  final List<TestResultModel> results;
  final bool isLoading;
  final String? error;

  const TestResultsState({
    this.results = const [],
    this.isLoading = false,
    this.error,
  });
}

class TestResultsNotifier extends StateNotifier<TestResultsState> {
  final ApiService _api;
  final int? _patientId;

  TestResultsNotifier(this._api, this._patientId)
      : super(const TestResultsState());

  Future<void> load() async {
    if (_patientId == null) return;
    state = TestResultsState(isLoading: true);
    try {
      final list = await _api.getMyTestResults(_patientId!);
      state = TestResultsState(results: list);
    } catch (e) {
      state = TestResultsState(error: e.toString());
    }
  }

  Future<String?> submitHomeTest(Map<String, dynamic> body) async {
    if (_patientId == null) return 'Not logged in';
    try {
      await _api.submitHomeTest(_patientId!, body);
      await load();
      return null;
    } on ApiException catch (e) {
      return e.message;
    } catch (_) {
      return 'Failed to submit test';
    }
  }
}

final testResultsProvider =
    StateNotifierProvider<TestResultsNotifier, TestResultsState>((ref) {
  final patientId = ref.watch(authProvider).patientId;
  return TestResultsNotifier(ApiService(), patientId);
});
