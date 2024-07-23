part of 'aws_edit_landing_price_cubit.dart';

abstract class AwsEditLandingPriceCubitState extends Equatable {
  const AwsEditLandingPriceCubitState();

  @override
  List<Object> get props => [];
}

class AwsEditLandingPriceInitial extends AwsEditLandingPriceCubitState {
  const AwsEditLandingPriceInitial();
}

class AwsEditLandingPriceStateLoading extends AwsEditLandingPriceCubitState {
  const AwsEditLandingPriceStateLoading();
}

class AwsEditLandingPriceStateLoaded extends AwsEditLandingPriceCubitState {
  const AwsEditLandingPriceStateLoaded(this.landingPrice);
  final AwsLandingPrice landingPrice;

  @override
  List<Object> get props => [];
}

class AwsEditLandingPriceStateError extends AwsEditLandingPriceCubitState {
  const AwsEditLandingPriceStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
