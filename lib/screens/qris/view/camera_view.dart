part of 'qris_page.dart';

class _CameraView extends StatefulWidget {
  const _CameraView();

  @override
  State<_CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<_CameraView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<CameraBloc>().add(const CameraInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      buildWhen: (previous, current) {
        log('current.controller ${current.controller}');
        return previous.controller != current.controller;
      },
      builder: (context, state) {
        final controller = state.controller;
        return AnimatedSwitcher(
          duration: Durations.medium3,
          child: controller == null
              ? const Center(child: CircularProgressIndicator())
              : CameraPreview(
                  controller,
                  child: LayoutBuilder(
                    builder: (
                      BuildContext context,
                      BoxConstraints constraints,
                    ) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        // onTapDown: (TapDownDetails details) =>
                        //     onViewFinderTap(details, constraints),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
