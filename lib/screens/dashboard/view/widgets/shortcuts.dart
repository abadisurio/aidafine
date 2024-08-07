part of '../dashboard_page.dart';

class _Shortcuts extends StatelessWidget {
  const _Shortcuts();

  @override
  Widget build(BuildContext context) {
    final brigthness = Theme.of(context).brightness;

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor:
          brigthness == Brightness.light ? Colors.black : Colors.white,
      foregroundColor:
          brigthness == Brightness.light ? Colors.white : Colors.black,
      padding: EdgeInsets.zero,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      minimumSize: const Size.square(60),
    );
    const labelStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 12,
    );
    // final labelStyle =
    //     context.textTheme.labelSmall?.copyWith(color: Colors.grey.shade900);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        12,
        12 + MediaQuery.of(context).padding.top,
        12,
        12,
      ),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          const StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: SizedBox(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.outbond_outlined,
                    // size: 40,
                  ),
                  Text(
                    'Transfer',
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wallet,
                    // size: 40,
                  ),
                  Text(
                    'E-wallet',
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    // size: 40,
                  ),
                  Text(
                    'Bayar',
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    // size: 40,
                  ),
                  Text(
                    'Riwayat',
                    style: labelStyle,
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle.copyWith(
                backgroundColor: WidgetStatePropertyAll(
                  brigthness == Brightness.light
                      ? Colors.orange.shade500
                      : Colors.orange.shade700,
                ),
              ),
              onPressed: () {
                context.router.push(QRISRoute());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Icon(
                      Icons.trending_up,
                      // size: 40,
                      color: brigthness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Pengeluaran meningkat',
                      style: labelStyle.copyWith(
                        color: brigthness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: ElevatedButton(
              style: buttonStyle.copyWith(
                backgroundColor: WidgetStatePropertyAll(
                  brigthness == Brightness.light
                      ? Colors.blue.shade500
                      : Colors.blue.shade700,
                ),
              ),
              onPressed: () {
                context.router.push(
                  BillSummarizerRoute(
                    billSummary: BillSummary(
                      id: 'id',
                      billItems: [
                        BillItem(
                          id: 'id',
                          name: 'nasi goreng',
                          quantity: 1,
                          price: 10000,
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Icon(
                      Icons.trending_up,
                      color: brigthness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Pengeluaran meningkat',
                      style: labelStyle.copyWith(
                        color: brigthness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
