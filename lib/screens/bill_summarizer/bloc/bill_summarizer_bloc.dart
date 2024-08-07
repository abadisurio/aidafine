import 'package:aidafine/engine/engine.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_summarizer_event.dart';
part 'bill_summarizer_state.dart';
part 'bill_summarizer_bloc.freezed.dart';

class BillSummarizerBloc
    extends Bloc<BillSummarizerEvent, BillSummarizerState> {
  BillSummarizerBloc({
    required BillSummary billSummary,
  }) : super(
          BillSummarizerState(
            createdAt: DateTime.now(),
            billSummary: billSummary,
          ),
        ) {
    on<BillSummarizerEvent>(_onBillSummarizerEvent);
  }

  Future<void> _onBillSummarizerEvent(
    BillSummarizerEvent event,
    Emitter<BillSummarizerState> emit,
  ) async {}
}
