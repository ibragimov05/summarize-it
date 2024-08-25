import 'package:easy_localization/easy_localization.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/app_settings.dart';
import 'package:summarize_it/core/utils/user_data.dart';
import 'package:summarize_it/core/utils/utils.dart';
import 'package:summarize_it/logic/blocs/group_chat/group_chat_bloc.dart';
import 'package:summarize_it/ui/screens/chat/widgets/show_message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      getIt.get<GroupChatBloc>().add(SendMessageEvent(
            text: _messageController.text,
            senderId: UserData.uid,
            senderName: UserData.firstName,
          ));
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColors.summarizeItWhite,
              padding: const EdgeInsets.all(10),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chat with summarize it users',
                      style: AppTextStyles.workSansW600.copyWith(
                        fontSize: 18,
                        color: AppColors.green900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<GroupChatBloc, GroupChatState>(
                bloc: context.read<GroupChatBloc>()
                  ..add(const GroupChatEvent.getAllMessages()),
                buildWhen: (previous, current) =>
                    current.chatStatus == GroupChatStatus.loaded,
                builder: (context, state) {
                  if (state.chatStatus == GroupChatStatus.loaded &&
                      state.messages != null) {
                    return FadingEdgeScrollView.fromScrollView(
                      gradientFractionOnEnd: 0.3,
                      gradientFractionOnStart: 0,
                      child: ListView.builder(
                        controller: _scrollController,
                        reverse: true,
                        itemCount: state.messages!.length,
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        itemBuilder: (context, index) {
                          final message = state.messages![index];
                          return Row(
                            mainAxisAlignment:
                                UserData.uid == message.senderId
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                            children: [
                              ShowMessage(
                                message: message,
                                isSender: UserData.uid == message.senderId,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  return Center(child: Text(context.tr('noMessagesHereYet')));
                },
              ),
            ),
            Container(
              width: double.infinity,
              // height: 70,
              decoration: const BoxDecoration(
                color: AppColors.summarizeItWhite,
                border: Border(
                  top: BorderSide(color: AppColors.greyscale300),
                ),
              ),
              child: TextField(
                // cursorColor: const Color(0xFFA5ADB0),
                controller: _messageController,
                maxLines: null,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: 'Message',
                  border:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _sendMessage,
                          child: const Icon(
                            Icons.send_rounded,
                            color: AppColors.green900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
