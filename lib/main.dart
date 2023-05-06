import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_code/features/countries/domain/models/country_model.dart';
import 'package:keep_code/features/login/domain/models/user_model.dart';
import 'package:keep_code/features/login/presentation/bloc/login_bloc.dart';
import 'package:keep_code/features/login/presentation/ui/login_screen.dart';
import 'package:keep_code/features/services/domain/models/service_model.dart';
import 'package:keep_code/features/services/presentation/ui/services_screen.dart';
import 'package:keep_code/features/services_and_countries/domain/models/countries_and_services_model.dart';
import 'package:keep_code/widgets/alert_dialog.dart';
import 'package:keep_code/widgets/init_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(ServiceModelAdapter()); // 0
  Hive.registerAdapter(CountryModelAdapter()); // 1
  Hive.registerAdapter(UserModelAdapter()); // 2
  Hive.registerAdapter(CountriesAndServicesModelAdapter()); // 3
  Hive.registerAdapter(ServiceEntryAdapter()); // 4
  Hive.registerAdapter(CountryEntryAdapter()); // 5
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  await Hive.openBox('service');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: ScreenUtilInit(
        designSize: const Size(320, 713),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return state is LoginSuccess
                  ? const ServicesScreen()
                  : const LoginScreen();
            },
          ),
        ),
      ),
    );
  }
}
