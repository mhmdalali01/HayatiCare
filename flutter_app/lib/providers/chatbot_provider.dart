import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  const ChatMessage({required this.text, required this.isUser});
}

class ChatbotState {
  final List<ChatMessage> messages;
  final List<String> faqs;
  final bool isLoading;

  const ChatbotState({
    this.messages = const [],
    this.faqs = const [],
    this.isLoading = false,
  });
}

class ChatbotNotifier extends StateNotifier<ChatbotState> {
  final ApiService _api;

  ChatbotNotifier(this._api) : super(const ChatbotState()) {
    _init();
  }

  Future<void> _init() async {
    final faqs = await _api.getChatbotFaqs();
    final welcome = ChatMessage(
      text: '⚕️ Hello! I can answer questions about medical tests and how to use the HMSS app.\n\n'
          'Tap a topic below or type your question.',
      isUser: false,
    );
    state = ChatbotState(messages: [welcome], faqs: faqs);
  }

  Future<void> send(String text) async {
    if (text.trim().isEmpty) return;

    final userMsg = ChatMessage(text: text, isUser: true);
    state = ChatbotState(
      messages: [...state.messages, userMsg],
      faqs: state.faqs,
      isLoading: true,
    );

    try {
      final reply = await _api.chatbotQuery(text);
      final botMsg = ChatMessage(text: reply, isUser: false);
      state = ChatbotState(
        messages: [...state.messages, botMsg],
        faqs: state.faqs,
      );
    } catch (e) {
      final errMsg = ChatMessage(
        text: 'Sorry, I could not process your request.',
        isUser: false,
      );
      state = ChatbotState(
        messages: [...state.messages, errMsg],
        faqs: state.faqs,
      );
    }
  }
}

final chatbotProvider =
    StateNotifierProvider<ChatbotNotifier, ChatbotState>((ref) {
  return ChatbotNotifier(ApiService());
});
