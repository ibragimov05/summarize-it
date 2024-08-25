import 'package:easy_localization/easy_localization.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/app_settings.dart';
import 'package:summarize_it/core/utils/user_data.dart';
import 'package:summarize_it/core/utils/utils.dart';
import 'package:summarize_it/logic/blocs/group_chat/group_chat_bloc.dart';
import 'package:summarize_it/ui/screens/chat/widgets/show_message_widget.dart';
import 'package:summarize_it/ui/widgets/animation_widget_with_bloc.dart';
import 'package:summarize_it/ui/widgets/circle_container_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/models/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Message? _messageToEdit;

  @override
  void initState() {
    super.initState();
    context.read<GroupChatBloc>().add(const GroupChatEvent.getAllMessages());
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      if (_messageToEdit != null) {
        context.read<GroupChatBloc>().add(EditMessageEvent(
              messageId: _messageToEdit!.id,
              newMessage: _messageController.text,
            ));
        _messageToEdit = null;
      } else {
        getIt.get<GroupChatBloc>().add(SendMessageEvent(
              text: _messageController.text,
              senderId: UserData.uid,
              senderName: UserData.firstName,
            ));
      }
      _messageController.clear();
    }
  }

  void _editMessage(Message message) {
    _messageToEdit = message;
    _messageController.text = message.text;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          CircleContainerWidget(top: AppFunctions.randomNumber),
          CircleContainerWidget(
            isAlign: true,
            top: AppFunctions.randomDouble,
            right: AppFunctions.randomDouble,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Chat header
              Container(
                color: AppColors.summarizeItWhite,
                padding: const EdgeInsets.all(10),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          context.tr('chatWith'),
                          style: AppTextStyles.workSansW600.copyWith(
                            fontSize: 16,
                            color: AppColors.green900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Message list
              Expanded(
                child: BlocBuilder<GroupChatBloc, GroupChatState>(
                  buildWhen: (previous, current) =>
                      current.chatStatus == GroupChatStatus.loaded,
                  builder: (context, state) {
                    if (state.chatStatus == GroupChatStatus.loaded &&
                        state.messages != null &&
                        state.messages!.isNotEmpty) {
                      return FadingEdgeScrollView.fromScrollView(
                        gradientFractionOnEnd: 0.3,
                        gradientFractionOnStart: 0,
                        child: ListView.builder(
                          controller: _scrollController,
                          reverse: true,
                          itemCount: state.messages!.length,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
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
                                  onEdit: _editMessage,
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }

                    /// no messages here yet
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const AnimationWidgetWithBloc(
                            animationPath: AppAssets.lottieSleepDuck,
                          ),
                          Center(
                            child: Text(
                              context.tr('noMessagesHereYet'),
                              style: AppTextStyles.workSansW600.copyWith(
                                fontSize: 18,
                                color: AppColors.green900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.summarizeItWhite,
                  border: Border(
                    top: BorderSide(color: AppColors.greyscale300),
                  ),
                ),
                child: TextField(
                  controller: _messageController,
                  maxLines: null,
                  maxLength: 500,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText: context.tr('message'),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ZoomTapAnimation(
                            onTap: _sendMessage,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.green900,
                              ),
                              child: const Icon(
                                Icons.arrow_upward_rounded,
                                color: AppColors.summarizeItWhite,
                              ),
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
        ],
      ),
    );
  }
}
