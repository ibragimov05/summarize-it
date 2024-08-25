import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summarize_it/core/utils/app_colors.dart';
import 'package:summarize_it/core/utils/app_text_styles.dart';
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
        child: Text(
          'Cancel',
          style: AppTextStyles.workSansW500.copyWith(
            color: AppColors.green900,
          ),
        ),
      ),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            'Edit message',
            style: AppTextStyles.workSansW500.copyWith(
              color: AppColors.green900,
            ),
          ),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            context
                .read<GroupChatBloc>()
                .add(GroupChatEvent.deleteMessage(messageId: message.id));
            Navigator.pop(context);
          },
          child: Text(
            'Delete message',
            style: AppTextStyles.workSansW500.copyWith(
              color: AppColors.error800,
            ),
          ),
        ),
      ],
    );
  }
}
