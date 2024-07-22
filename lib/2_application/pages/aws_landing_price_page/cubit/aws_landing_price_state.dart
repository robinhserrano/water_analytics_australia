part of 'aws_landing_price_cubit.dart';

abstract class AwsLandingPriceCubitState extends Equatable {
  const AwsLandingPriceCubitState();

  @override
  List<Object> get props => [];
}

class AwsLandingPriceInitial extends AwsLandingPriceCubitState {
  const AwsLandingPriceInitial();
}

class AwsLandingPriceStateLoading extends AwsLandingPriceCubitState {
  const AwsLandingPriceStateLoading();
}

class AwsLandingPriceStateLoaded extends AwsLandingPriceCubitState {
  const AwsLandingPriceStateLoaded(this.records);
  final List<AwsLandingPrice> records;

  @override
  List<Object> get props => [];
}

class AwsLandingPriceStateError extends AwsLandingPriceCubitState {
  const AwsLandingPriceStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
