part of '../dashboard_page.dart';

class _ResponsiveProfile extends StatefulWidget {
  const _ResponsiveProfile({required this.scrollController});

  final ScrollController scrollController;

  @override
  State<_ResponsiveProfile> createState() => _ResponsiveProfileState();
}

class _ResponsiveProfileState extends State<_ResponsiveProfile> {
  late final _screenWidth = MediaQuery.of(context).size.width;
  double _offset = 0;

  @override
  void initState() {
    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;
      if (offset > -20 && offset < (_screenWidth / 2 + 20)) {
        setState(() {
          _offset = widget.scrollController.offset;
        });
        // log('_offset $_offset');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log('debug _offset / _screenWidth ${_offset * 2 / _screenWidth}');
    return Align(
      alignment: Alignment.topLeft,
      // child: ColoredBox(
      //   color: _offset <= (_screenWidth / 2)
      //       ? Colors.transparent
      //       : Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              // if (_offset > 0)
              BoxShadow(
                color: Colors.black
                    .withOpacity((_offset * 2 / _screenWidth).clamp(0, 1)),
                blurRadius: 20,
                // blurStyle: BlurStyle.solid,
                // spreadRadius: -12,
              ),
            ],
          ),
          child: ClipPath(
            clipper: const ShapeBorderClipper(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              height: _screenWidth / 2 -
                  18 -
                  _offset.clamp(0, _screenWidth / 2 - 6) / 2,
              width:
                  _screenWidth / 2 - 18 + _offset.clamp(0, _screenWidth - 18),
              decoration: BoxDecoration(color: Colors.indigo.shade400),
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: CachedNetworkImageProvider(
                        '''https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&h=60''',
                      ),
                    ),
                  ),
                  // const Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'eternal',
                          style: TextStyleTheme(context).titleMedium,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              Text(
                                'Rp1.523.000',
                                style: TextStyleTheme(context).titleSmall,
                              ),
                              const SizedBox(width: 16),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
