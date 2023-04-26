import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_code/features/countries/data/data_sources/local_countries_data_source.dart';
import 'package:keep_code/features/countries/data/data_sources/remote_countries_data_source.dart';
import 'package:keep_code/features/countries/data/repos_impl/countries_repo_impl.dart';
import 'package:keep_code/features/countries/domain/use_cases/countries_use_cases.dart';
import 'package:keep_code/features/countries/presentation/blocs/active_services/active_services_bloc.dart';
import 'package:keep_code/features/countries/presentation/blocs/countries/countries_bloc.dart';
import 'package:keep_code/features/login/data/data_sources/login_data_source.dart';
import 'package:keep_code/features/login/data/repos_impl/login_repos_impl.dart';
import 'package:keep_code/features/login/domain/use_cases/login_use_cases.dart';
import 'package:keep_code/features/login/presentation/bloc/login_bloc.dart';
import 'package:keep_code/features/services/data/data_sources/local_services_data_source.dart';
import 'package:keep_code/features/services/data/data_sources/remote_services_data_source.dart';
import 'package:keep_code/features/services/data/repos_impl/services_repo_impl.dart';
import 'package:keep_code/features/services/domain/user_cases/services_use_cases.dart';
import 'package:keep_code/features/services/presentation/blocs/services/services_bloc.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => ServicesRepoImpl(
                RemoteServicesDataSourceImpl(), LocalServicesDataSourceImpl())),
        RepositoryProvider(
            create: (context) => CountriesRepoImpl(
                RemoteCountiresDataSourceImpl(),
                LocalCountriesDataSourceImpl())),
        RepositoryProvider(
            create: (context) => LoginReposImpl(LoginDataSourceImpl())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(
              loginUseCase: LoginUseCaseImpl(context.read<LoginReposImpl>()),
            )..add(OnCheckLogin()),
          ),
          BlocProvider(
            create: (context) => ServicesBloc(
              servicesUseCase:
                  GetServicesUseCaseImpl(context.read<ServicesRepoImpl>()),
            )..add(GetServices()),
          ),
          BlocProvider(
            create: (context) => CountriesBloc(
              countriesUseCase:
                  GetCountriesUseCaseImpl(context.read<CountriesRepoImpl>()),
            ),
          ),
          BlocProvider(create: (context) => ActiveServicesBloc()),
        ],
        child: child,
      ),
    );
  }
}
