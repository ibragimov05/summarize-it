import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/utils.dart';
import 'package:summarize_it/data/models/message.dart';
import 'package:summarize_it/ui/screens/chat/widgets/manage_message_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ShowMessage extends StatelessWidget {
  final Message message;
  final bool isSender;
  final Function(Message) onEdit;

  const ShowMessage({
    super.key,
    required this.message,
    required this.isSender,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isSender)
          _ReceiverCircleAvatar(
            receiverName: message.senderName,
            receiverColor: message.senderChatColor,
          ),
        ZoomTapAnimation(
          onLongTap: isSender
              ? () async {
                  final isEdit = await showCupertinoModalPopup<bool?>(
                    context: context,
                    builder: (BuildContext context) =>
                        ManageMessageWidget(message: message),
                  );
                  if (isEdit != null && isEdit) onEdit(message);
                }
              : null,
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 5),
            width:
                message.text.length > 40 ? DeviceScreen.w(context) / 1.3 : null,
            decoration: BoxDecoration(
              color: isSender
                  ? AppColors.green900.withOpacity(0.8)
                  : const Color(0xFFf1f2f7).withOpacity(0.9),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: isSender
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
                bottomRight: isSender
                    ? const Radius.circular(0)
                    : const Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment:
                  isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Text(
                  message.text,
                  style: AppTextStyles.workSansW500.copyWith(
                    color: isSender
                        ? AppColors.summarizeItWhite
                        : AppColors.mainBlackColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (message.isEdited) _MessageEdited(isSender: isSender),
                    Text(
                      _formatTime(message.timestamp),
                      style: AppTextStyles.workSansW500.copyWith(
                        color: isSender
                            ? const Color(0xFF66ADA3)
                            : AppColors.greyscale400.withOpacity(0.8),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MessageEdited extends StatelessWidget {
  final bool isSender;

  const _MessageEdited({required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'edited',
          style: AppTextStyles.workSansW500.copyWith(
            color: isSender
                ? const Color(0xFF66ADA3)
                : AppColors.greyscale400.withOpacity(0.8),
            fontSize: 11,
          ),
        ),
        10.w(),
      ],
    );
  }
}

class _ReceiverCircleAvatar extends StatelessWidget {
  final String receiverName;
  final int receiverColor;

  const _ReceiverCircleAvatar({
    required this.receiverName,
    required this.receiverColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tooltip(
          message: receiverName,
          child: CircleAvatar(
            radius: 19,
            backgroundColor: Color(receiverColor),
            child: Center(
              child: Text(
                receiverName[0].toUpperCase(),
                style: const TextStyle(color: Colors.white), // Optional text styling
              ),
            ),
          ),
        ),
        5.w(),
      ],
    );
  }
}

String _formatTime(Timestamp timeStamp) {
  final DateTime dateTimeFormat = timeStamp.toDate();
  final DateTime now = DateTime.now();
  final DateTime yesterday =
      DateTime(now.year, now.month, now.day).subtract(const Duration(days: 1));

  if (DateTime(dateTimeFormat.year, dateTimeFormat.month, dateTimeFormat.day) ==
      yesterday) {
    return 'Yesterday ${DateFormat('HH:mm').format(dateTimeFormat)}';
  } else if (DateTime(now.year, now.month, now.day) ==
      DateTime(dateTimeFormat.year, dateTimeFormat.month, dateTimeFormat.day)) {
    return DateFormat('HH:mm').format(dateTimeFormat);
  }
  return DateFormat('MMM d, HH:mm').format(dateTimeFormat);
}
