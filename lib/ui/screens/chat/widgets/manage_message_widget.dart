import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/data/models/message.dart';
import 'package:summarize_it/logic/blocs/group_chat/group_chat_bloc.dart';

class ManageMessageWidget extends StatelessWidget {
  final Message message;

  const ManageMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Edit message'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            context
                .read<GroupChatBloc>()
                .add(GroupChatEvent.deleteMessage(messageId: message.id));
            Navigator.pop(context);
          },
          child: const Text('Delete message'),
        ),
      ],
    );
  }
}
