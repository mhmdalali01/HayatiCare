import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import '../providers/test_results_provider.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class HomeTestScreen extends ConsumerStatefulWidget {
  const HomeTestScreen({super.key});

  @override
  ConsumerState<HomeTestScreen> createState() => _HomeTestScreenState();
}

class _HomeTestScreenState extends ConsumerState<HomeTestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _testIdCtrl = TextEditingController();
  final _doctorIdCtrl = TextEditingController();
  final _valueCtrl = TextEditingController();
  final _unitCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  String _fasting = 'unknown';

  @override
  void dispose() {
    _testIdCtrl.dispose();
    _doctorIdCtrl.dispose();
    _valueCtrl.dispose();
    _unitCtrl.dispose();
    _dateCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final body = <String, dynamic>{
      'test_id': int.parse(_testIdCtrl.text.trim()),
      'doctor_id': int.parse(_doctorIdCtrl.text.trim()),
      'value': double.parse(_valueCtrl.text.trim()),
      'unit': _unitCtrl.text.trim(),
      'result_date': _dateCtrl.text.trim(),
      'fasting_state': _fasting == 'unknown' ? null : _fasting,
      if (_notesCtrl.text.trim().isNotEmpty) 'notes': _notesCtrl.text.trim(),
    };

    final err = await ref.read(testResultsProvider.notifier).submitHomeTest(body);
    if (!mounted) return;
    if (err == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Measurement submitted successfully!'),
          backgroundColor: AppColors.statusConfirmed,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      _valueCtrl.clear();
      _notesCtrl.clear();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Submit Home Test', style: AppTextStyles.titleLarge),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(24),
            boxShadow: AppTheme.cardShadow,
          ),
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Home Test',
                  style: AppTextStyles.heading2,
                ),
                const SizedBox(height: 6),
                Text(
                  'Enter your test measurement below',
                  style: AppTextStyles.bodyGrey,
                ),
                const SizedBox(height: 28),

                _buildField(
                  controller: _testIdCtrl,
                  label: 'Test ID *',
                  icon: Icons.science_outlined,
                  keyboardType: TextInputType.number,
                  validator: (v) => v != null && v.isNotEmpty
                      ? null
                      : 'Required',
                ),
                const SizedBox(height: 16),

                _buildField(
                  controller: _doctorIdCtrl,
                  label: 'Doctor ID *',
                  icon: Icons.person_outlined,
                  keyboardType: TextInputType.number,
                  validator: (v) => v != null && v.isNotEmpty
                      ? null
                      : 'Required',
                ),
                const SizedBox(height: 16),

                _buildField(
                  controller: _valueCtrl,
                  label: 'Value *',
                  icon: Icons.analytics_outlined,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (v) => v != null && double.tryParse(v) != null
                      ? null
                      : 'Enter a valid number',
                ),
                const SizedBox(height: 16),

                _buildField(
                  controller: _unitCtrl,
                  label: 'Unit (e.g. mg/dL)',
                  icon: Icons.straighten_outlined,
                ),
                const SizedBox(height: 16),

                _buildField(
                  controller: _dateCtrl,
                  label: 'Date & Time * (YYYY-MM-DDTHH:MM)',
                  icon: Icons.calendar_today_outlined,
                  validator: (v) => v != null && v.isNotEmpty
                      ? null
                      : 'Required',
                ),
                const SizedBox(height: 16),

                _buildDropdown(),
                const SizedBox(height: 16),

                _buildField(
                  controller: _notesCtrl,
                  label: 'Notes (optional)',
                  icon: Icons.note_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                      'Submit Measurement',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.textDark,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          fontSize: 13,
          color: AppColors.textGrey,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(icon, size: 20, color: AppColors.textGrey),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 48),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        filled: true,
        fillColor: AppColors.backgroundGrey,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
      validator: validator,
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: _fasting,
      decoration: InputDecoration(
        labelText: 'Fasting State',
        labelStyle: GoogleFonts.poppins(
          fontSize: 13,
          color: AppColors.textGrey,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(Icons.restaurant_outlined, size: 20, color: AppColors.textGrey),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 48),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        filled: true,
        fillColor: AppColors.backgroundGrey,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
      items: ['unknown', 'fasting', 'non-fasting']
          .map((f) => DropdownMenuItem(value: f, child: Text(f)))
          .toList(),
      onChanged: (v) => setState(() => _fasting = v!),
    );
  }
}
