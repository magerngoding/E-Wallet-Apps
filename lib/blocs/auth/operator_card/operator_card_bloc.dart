import 'package:bloc/bloc.dart';
import 'package:e_wallet/models/operator_card_model.dart';
import 'package:e_wallet/services/operator_card_service.dart';
import 'package:equatable/equatable.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      if (event is OperatorCardGet) {
        try {
          emit(OperatorCardLoading());

          final operatorCards = await OperatorCardService().getOperatorCard();

          emit(OperatorCardSuccess(operatorCards));
        } catch (e) {
          print(e.toString());
          emit(OperatorCardFailed(e.toString()));
        }
      }
    });
  }
}
