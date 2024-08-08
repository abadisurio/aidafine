import 'package:aidafine/app/app.dart';
import 'package:aidafine/screens/qris_pay/bloc/qris_pay_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupertino_interactive_keyboard/cupertino_interactive_keyboard.dart';
import 'package:emvqrcode/emvqrcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class QRISPayPage extends StatelessWidget {
  const QRISPayPage({
    required this.qrisData,
    super.key,
  });

  final EmvqrModel qrisData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QRISPayBloc(qrisData: qrisData),
      child: const _QRISPayView(),
    );
  }
}

class _QRISPayView extends StatefulWidget {
  const _QRISPayView();

  static const double iconRadius = 30;

  @override
  State<_QRISPayView> createState() => _QRISPayViewState();
}

class _QRISPayViewState extends State<_QRISPayView> {
  bool _animateMerchant = false;
  bool _animateCustomer = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        _animateMerchant = true;
      });
      await Future<void>.delayed(Durations.extralong4);
      setState(() {
        _animateCustomer = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    return AnimatedContainer(
      curve: Curves.easeInOutCirc,
      duration: Durations.extralong4,
      color: _animateMerchant ? Colors.black : Colors.blue,
      // color: _isMounted ? Colors.black : Colors.blue,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text('Bayar QRIS'),
          forceMaterialTransparency: !_animateCustomer,
          elevation: 0,
          backgroundColor: _animateCustomer ? Colors.black : Colors.transparent,
        ),
        body: CupertinoInteractiveKeyboard(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: context.screenInset.bottom,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: kToolbarHeight * 1.5),
                            _AnimatedRecipient(isMounted: _animateMerchant),
                            const SizedBox(height: 16),
                            if (_animateMerchant) const _MerchantColumn(),
                            AnimatedCrossFade(
                              alignment: Alignment.bottomCenter,
                              sizeCurve: Curves.easeInOutCirc,
                              crossFadeState: _animateCustomer
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: Durations.long2,
                              firstChild: const SizedBox(
                                width: double.infinity,
                                height: 0,
                              ),
                              secondChild: !_animateCustomer
                                  ? const SizedBox(
                                      width: double.infinity,
                                      height: 0,
                                    )
                                  : const _CustomerColumn(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedRecipient extends StatelessWidget {
  const _AnimatedRecipient({required this.isMounted});

  final bool isMounted;

  @override
  Widget build(BuildContext context) {
    final radius = (isMounted
        ? _QRISPayView.iconRadius
        : (context.screenWidth / 2) -
            (context.screenPadding.top + context.screenPadding.bottom));
    return AnimatedContainer(
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      curve: Curves.easeInOutCirc,
      duration: Durations.extralong4,
      width: radius * 2,
      height: radius * 2,
      child: const Icon(
        Icons.store,
        size: _QRISPayView.iconRadius,
      ),
    );
  }
}

class _MerchantColumn extends StatelessWidget {
  const _MerchantColumn();

  @override
  Widget build(BuildContext context) {
    final qrisData = context.read<QRISPayBloc>().state.qrisData!;
    return Column(
      children: [
        Text(
          '${qrisData.merchantName?.value}',
          style: context.textTheme.titleLarge,
        ),
        Text(
          '${qrisData.merchantCity?.value}',
          style: context.textTheme.titleSmall,
        ),
      ],
    );
  }
}

class _CustomerColumn extends StatefulWidget {
  const _CustomerColumn();

  @override
  State<_CustomerColumn> createState() => _CustomerColumnState();
}

class _CustomerColumnState extends State<_CustomerColumn> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    Future(() async {
      await Future.delayed(Durations.long4, () {
        FocusScope.of(context).requestFocus(_focusNode);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        const Icon(
          Icons.keyboard_double_arrow_up_rounded,
          size: _QRISPayView.iconRadius,
        ),
        const SizedBox(height: 16),
        const CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            'https://i.pravatar.cc/70',
          ),
          radius: _QRISPayView.iconRadius,
        ),
        const SizedBox(height: 16),
        Text(
          'Abadi Suryo',
          style: context.textTheme.titleLarge,
        ),
        Text(
          '524890572',
          style: context.textTheme.titleSmall,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            focusNode: _focusNode,
            // onTapOutside: (event) {
            //   FocusManager.instance.primaryFocus
            //       ?.unfocus();
            // },
            // onTap: () {
            //   FocusManager.instance.primaryFocus
            //       ?.requestFocus();
            // },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Enter Amount',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
