part of 'active_services_bloc.dart';

abstract class ActiveServicesEvent extends Equatable {
  const ActiveServicesEvent();

  @override
  List<Object> get props => [];
}

class AddService extends ActiveServicesEvent {
  final CountryModel countryModel;

  const AddService({required this.countryModel});
}
