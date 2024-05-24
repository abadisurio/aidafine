import 'dart:developer';

import 'package:aidafine/app/themes/text_theme.dart';
import 'package:aidafine/screens/main/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:emvqrcode/emvqrcode.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class QRISPage extends StatelessWidget {
  const QRISPage({super.key, this.amount});

  final int? amount;

  @override
  Widget build(BuildContext context) {
    return _QRISView(amount: amount);
  }
}

class _QRISView extends StatefulWidget {
  const _QRISView({this.amount});

  final int? amount;

  @override
  State<_QRISView> createState() => _QRISViewState();
}

class _QRISViewState extends State<_QRISView> {
  bool _isMounted = false;
  String? amount;
  @override
  void initState() {
    const emvqr =
        '''00020101021240530013ID.CO.BCA.WWW0118936000141577135652021057713565255204482953033605405500005802ID5918ABADI SURYO SETIYO6013Jakarta Pusat61051031062470804DMCT9935000200012557713565250017163042364086304655C''';
    final emvdecode = EMVMPM.decode(emvqr);
    log('emvdecode ${emvdecode.toJson()}');

    if (widget.amount != null) {
      final format = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp',
        decimalDigits: 0,
      );
      amount = format.format(widget.amount);
    }
    Future.delayed(
      Durations.medium2,
      () {
        setState(() {
          _isMounted = true;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          const Center(child: QRISCardWidget(size: 64)),
          AnimatedOpacity(
            opacity: _isMounted ? 1 : 0,
            duration: Durations.medium2,
            curve: Curves.easeInOut,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('QRIS'),
                leading: IconButton(
                  onPressed: () => context.router.maybePop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              body: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.black,
                      ),
                      // height: 300,
                      // width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.qr_code,
                            size: 120,
                          ),
                          Text(
                            'ceritanya kamera',
                            style: TextStyleTheme(context).titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnimatedSize(
                    duration: Durations.medium2,
                    curve: Curves.easeOutCirc,
                    child: !_isMounted || widget.amount == null
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.all(16),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  'Tagihan terdeteksi: $amount',
                                  style: TextStyleTheme(context).titleMedium,
                                ),
                              ),
                            ),
                          ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
