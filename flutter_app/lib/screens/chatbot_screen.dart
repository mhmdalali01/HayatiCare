import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import '../providers/chatbot_provider.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class ChatbotScreen extends ConsumerStatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ConsumerState<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends ConsumerState<ChatbotScreen> {
  final _ctrl = TextEditingController();
  final _scroll = ScrollController();

  @override
  void dispose() {
    _ctrl.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _send([String? text]) {
    final msg = text ?? _ctrl.text;
    if (msg.trim().isEmpty) return;
    _ctrl.clear();
    ref.read(chatbotProvider.notifier).send(msg);
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scroll.hasClients) {
        _scroll.animateTo(_scroll.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatbotProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Medical Assistant', style: AppTextStyles.titleLarge),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // FAQ chips
          if (state.faqs.isNotEmpty)
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: state.faqs.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) => Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _send(state.faqs[i]),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:
                              AppColors.primaryBlue.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        state.faqs[i],
                        style: GoogleFonts.poppins(
                          color: AppColors.primaryBlue,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Messages
          Expanded(
            child: state.messages.isEmpty && !state.isLoading
                ? _buildEmptyState()
                : ListView.builder(
                    controller: _scroll,
                    padding: const EdgeInsets.all(16),
                    itemCount:
                        state.messages.length + (state.isLoading ? 1 : 0),
                    itemBuilder: (_, i) {
                      if (i == state.messages.length) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 8, top: 8),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.cardWhite,
                                  shape: BoxShape.circle,
                                  boxShadow: AppTheme.cardShadow,
                                ),
                                child: SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.primaryBlue,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Thinking...',
                                style: GoogleFonts.poppins(
                                  color: AppColors.textGrey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      final msg = state.messages[i];
                      return _Bubble(text: msg.text, isUser: msg.isUser);
                    },
                  ),
          ),

          // Input
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ctrl,
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _send(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textDark,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Ask a question...',
                        hintStyle: GoogleFonts.poppins(
                          color: AppColors.textHint,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundGrey,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(
                              color: AppColors.primaryBlue, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: _send,
                      icon: const Icon(Icons.send,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              shape: BoxShape.circle,
              boxShadow: AppTheme.cardShadow,
            ),
            child: Icon(Icons.chat_bubble_outline,
                size: 40, color: AppColors.textHint),
          ),
          const SizedBox(height: 20),
          Text(
            'Ask me anything',
            style: AppTextStyles.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'I can help with medical questions',
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const _Bubble({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        builder: (context, v, child) {
          return Opacity(
            opacity: v,
            child: Transform.translate(
              offset: Offset(isUser ? 20 * (1 - v) : -20 * (1 - v), 0),
              child: child,
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          decoration: BoxDecoration(
            color: isUser ? AppColors.primaryBlue : AppColors.cardWhite,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
              bottomLeft: Radius.circular(isUser ? 18 : 4),
              bottomRight: Radius.circular(isUser ? 4 : 18),
            ),
            boxShadow: AppTheme.cardShadow,
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: isUser ? Colors.white : AppColors.textDark,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
