part of '../dashboard_page.dart';

class _FavoriteTransfer extends StatelessWidget {
  const _FavoriteTransfer();

  static const double radius = 40;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
            child: Text(
              'Transfer Favorit',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: _FavoriteTransfer.radius * 2 + 20,
            child: ListView.builder(
              // physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(left: 12),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final isPinned = index < 2;
                return TapDownScaller(
                  scale: 0.88,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SizedBox(
                      width: _FavoriteTransfer.radius * 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox.square(
                            dimension: _FavoriteTransfer.radius * 2,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ClipPath(
                                    clipper: const ShapeBorderClipper(
                                      shape: CircleBorder(),
                                    ),
                                    // clipBehavior: Clip.hardEdge,
                                    child: Material(
                                      child: Ink.image(
                                        image: CachedNetworkImageProvider(
                                          'https://i.pravatar.cc/100?=$index',
                                        ),
                                        fit: BoxFit.cover,
                                        child: InkWell(
                                          onTap: () {},
                                          child: const SizedBox.expand(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: ClipPath(
                                    clipper: const ShapeBorderClipper(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://picsum.photos/id/${index * 10}/100/100',
                                      fit: BoxFit.contain,
                                      height: _FavoriteTransfer.radius / 1.5,
                                      width: _FavoriteTransfer.radius / 1.5,
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
                                'Haidar Zamzam',
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
