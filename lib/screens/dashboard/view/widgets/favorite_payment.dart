part of '../dashboard_page.dart';

class _FavoritePayment extends StatelessWidget {
  const _FavoritePayment();

  static const double radius = 35;

  @override
  Widget build(BuildContext context) {
    final brigthness = Theme.of(context).brightness;

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor:
          brigthness == Brightness.light ? Colors.black : Colors.grey.shade900,
      foregroundColor:
          brigthness == Brightness.light ? Colors.grey.shade900 : Colors.black,
      padding: EdgeInsets.zero,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      minimumSize: const Size.square(60),
    );
    // const labelStyle = TextStyle(
    //   fontWeight: FontWeight.w700,
    //   // fontSize: 12,
    // );
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
            child: Text(
              'Pembayaran Favorit',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: _FavoritePayment.radius * 2 + 25,
            child: ListView.builder(
              // physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(left: 12),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final isPinned = index < 3;
                return TapDownScaller(
                  scale: 0.88,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SizedBox(
                      width: _FavoritePayment.radius * 2,
                      child: Column(
                        children: [
                          SizedBox.square(
                            dimension: _FavoritePayment.radius * 2,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipPath(
                                  clipper: const ShapeBorderClipper(
                                    shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: buttonStyle,
                                    onPressed: () {},
                                    // child: CachedNetworkImage(
                                    //   imageUrl: 'https://picsum.photos/id/$index/100/100',
                                    //   fit: BoxFit.contain,
                                    // ),
                                    child: const Icon(
                                      Icons.paypal,
                                      color: Colors.white,
                                      size: _FavoritePayment.radius,
                                    ),
                                  ),
                                ),
                                if (isPinned)
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Transform.rotate(
                                      angle: 0.8,
                                      child: const CircleAvatar(
                                        radius: 12,
                                        child: Icon(
                                          Icons.push_pin_rounded,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Firstmedia',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
