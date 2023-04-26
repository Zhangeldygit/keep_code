part of 'services_bloc.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {
  @override
  List<Object> get props => [];
}

class ServicesLoading extends ServicesState {
  @override
  List<Object> get props => [];
}

class ServicesLoaded extends ServicesState {
  final List<ServiceModel> services;
  // final List<String> services;

  const ServicesLoaded({required this.services});

  @override
  List<Object> get props => [services];
}
