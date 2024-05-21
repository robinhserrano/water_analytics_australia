part of 'landing_price_cubit.dart';

abstract class LandingPriceCubitState extends Equatable {
  const LandingPriceCubitState();

  @override
  List<Object> get props => [];
}

class LandingPriceInitial extends LandingPriceCubitState {
  const LandingPriceInitial();
}

class LandingPriceStateLoading extends LandingPriceCubitState {
  const LandingPriceStateLoading();
}

class LandingPriceStateLoaded extends LandingPriceCubitState {
  const LandingPriceStateLoaded(this.records);
  final List<CloudLandingPrice> records;

  @override
  List<Object> get props => [];
}

class LandingPriceStateError extends LandingPriceCubitState {
  const LandingPriceStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
