import 'package:aidafine/app/app.dart';
import 'package:aidafine/engine/engine.dart';
import 'package:aidafine/screens/bill_summarizer/bill_summarizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class BillSummarizerPage extends StatelessWidget {
  const BillSummarizerPage({
    required this.billSummary,
    super.key,
  });

  final BillSummary billSummary;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillSummarizerBloc(billSummary: billSummary),
      child: const _BillSummarizer(),
    );
  }
}

class _BillSummarizer extends StatelessWidget {
  const _BillSummarizer();

  @override
  Widget build(BuildContext context) {
    return Material(
      // type: MaterialType.transparency,
      color: Colors.black.withOpacity(0.7),
      // appBar: AppBar(),
      child: const _BillList(),
    );
  }
}

class _BillList extends StatelessWidget {
  const _BillList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillSummarizerBloc, BillSummarizerState>(
      buildWhen: (previous, current) {
        return previous.billSummary != current.billSummary;
      },
      builder: (context, state) {
        final grandTotalFormatted =
            appCurrencyFormat.format(state.billSummary.grandTotal ?? 0);
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(
              child: ListView.builder(
                clipBehavior: Clip.none,
                padding: EdgeInsets.fromLTRB(
                  8,
                  context.screenPadding.top,
                  8,
                  context.screenPadding.bottom + kToolbarHeight,
                ),
                reverse: true,
                itemCount: state.billSummary.billItems.length,
                itemBuilder: (context, index) {
                  final item = state.billSummary.billItems[
                      (state.billSummary.billItems.length - 1) - index];
                  final format = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  );
                  final formatedPrice = format.format(item.price);
                  final formatedName = (item.name ?? '').toTitleCase();
                  final quantity = item.quantity;
                  return Card(
                    child: ListTile(
                      title: Text(
                        '''$formatedName${quantity == null ? '' : ' x $quantity'}''',
                      ),
                      trailing: Text(
                        formatedPrice,
                        style: context.textTheme.labelLarge,
                      ),
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              child: Container(
                height: kToolbarHeight,
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      child: const Text('Tutup'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('QRIS $grandTotalFormatted'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
