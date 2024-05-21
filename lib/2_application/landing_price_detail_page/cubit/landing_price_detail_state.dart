part of 'landing_price_detail_cubit.dart';

abstract class LandingPriceDetailCubitState extends Equatable {
  const LandingPriceDetailCubitState();

  @override
  List<Object> get props => [];
}

class LandingPriceDetailInitial extends LandingPriceDetailCubitState {
  const LandingPriceDetailInitial();
}

class LandingPriceDetailStateLoading extends LandingPriceDetailCubitState {
  const LandingPriceDetailStateLoading();
}

class LandingPriceDetailStateLoaded extends LandingPriceDetailCubitState {
  const LandingPriceDetailStateLoaded(this.records);
  final CloudLandingPrice records;

  @override
  List<Object> get props => [];
}

class LandingPriceDetailStateError extends LandingPriceDetailCubitState {
  const LandingPriceDetailStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
