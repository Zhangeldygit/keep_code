part of 'active_services_bloc.dart';

abstract class ActiveServicesState extends Equatable {
  const ActiveServicesState();

  @override
  List<Object> get props => [];
}

class ActiveServicesInitial extends ActiveServicesState {
  @override
  List<Object> get props => [];
}

class ActiveServicesLoading extends ActiveServicesState {
  @override
  List<Object> get props => [];
}

class ActiveServicesLoaded extends ActiveServicesState {
  final List<CountryModel> activeServices;

  const ActiveServicesLoaded({required this.activeServices});
  @override
  List<Object> get props => [activeServices];
}

class ActiveServicesFailure extends ActiveServicesState {
  final String message;

  const ActiveServicesFailure({required this.message});
}
