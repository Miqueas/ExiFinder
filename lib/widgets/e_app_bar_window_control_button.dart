import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:window_manager/window_manager.dart';

enum EAppBarWindowControlButtonAction { min, max, close }

final class const EAppBarWindowControlButton({
  super.key,
  required final EAppBarWindowControlButtonAction action,
}) extends StatefulWidget {
  @override
  State<EAppBarWindowControlButton> createState()
    => _EAppBarWindowControlButtonState();
}

final class _EAppBarWindowControlButtonState
    extends State<EAppBarWindowControlButton>
{
  late final int _listenerId;
  Window? window;

  void _onWindowEvent(WindowEvent event) {
    if (event is WindowMaximizedEvent) setState(() {});
    if (event is WindowRestoredEvent) setState(() {});
  }

  @override
  void dispose() {
    window?.removeListener(_listenerId);
    window = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    window = WindowManager.instance.getCurrent();
    _listenerId = window?.addListener(_onWindowEvent) ?? 0;
  }

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () {
      switch (widget.action) {
        case .min: window?.minimize();
        case .max: {
          if (window?.isMaximized ?? false) {
            window?.unmaximize();
          } else {
            window?.maximize();
          }
        }
        case .close: window?.close();
      }
    },
    hoverColor: switch (widget.action) {
      .close => Colors.red.withAlpha(120),
      _ => null,
    },
    splashColor: switch (widget.action) {
      .close => Colors.red,
      _ => null,
    },
    child: Padding(
      padding: const .all(12),
      child: HugeIcon(
        size: 20,
        icon: switch (widget.action) {
          .min => HugeIcons.strokeRoundedRemove01,
          .max => switch (window?.isMaximized ?? false) {
            true => HugeIcons.strokeRoundedCollapse,
            false => HugeIcons.strokeRoundedExpand,
          },
          .close => HugeIcons.strokeRoundedCancel01,
        }
      ),
    ),
  );
}