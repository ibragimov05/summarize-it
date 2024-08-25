import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summarize_it/core/utils/device_screen.dart';
import 'package:summarize_it/data/models/message.dart';
import 'package:summarize_it/ui/screens/chat/widgets/manage_message_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ShowMessage extends StatelessWidget {
  final Message message;
  final bool isSender;

  const ShowMessage({
    super.key,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onLongTap: isSender
          ? () async {
              final isEdit = await showCupertinoModalPopup<bool?>(
                context: context,
                builder: (BuildContext context) =>
                    ManageMessageWidget(message: message),
              );
              if (isEdit != null && isEdit) {
                // print('object');
                // context.read<GroupChatBloc>().add(GroupChatEvent.editMessage(
                //       messageId: message.id,
                //       newMessage: newMessage,
                //     ));
                
              }
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: message.text.length > 40 ? DeviceScreen.w(context) / 1.1 : null,
        decoration: BoxDecoration(
          color:
              isSender ? const Color(0xFFEFFEDD) : Colors.grey.withOpacity(0.1),
          border: Border.all(color: Colors.black, width: 0.3),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                isSender ? const Radius.circular(12) : const Radius.circular(0),
            bottomRight:
                isSender ? const Radius.circular(0) : const Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(message.text),
            Text(
              _formatTime(message.timestamp),
              style: TextStyle(
                color: isSender
                    ? const Color(0xFF899F74)
                    : const Color(0xFFBBBEBE),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(Timestamp timeStamp) {
    return timeStamp
        .toDate()
        .toString()
        .split(' ')[1]
        .split('.')[0]
        .split(':')
        .sublist(0, 2)
        .join(':');
  }
}
