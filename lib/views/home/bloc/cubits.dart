// All Flutter Built-in Imports Here.

// All Custom Imports Here.
import 'package:flutter_bloc/flutter_bloc.dart';

// All Native Imports Here.
import 'package:spyn/network/api/api_service.dart';
import 'package:spyn/views/home/bloc/states.dart';

// All Attributes or Constants Here.

class HomeCubit extends Cubit<HomeState> {
  late Map<String, dynamic> appData;

  HomeCubit() : super(HomeInitialState()) {
    _init();
  }

  Future<void> _init() async {
    await getAppData();
  }

  getAppData() async {
    emit(HomeLoadingState());
    final res = await getData();
    if (res is Map<String, dynamic>) {
      appData = res;
      emit(HomeLoadedState());
      return res;
    }
    emit(HomeLoadingErrorState());
  }

  bool isAppDataInitialized() {
    return appData.isNotEmpty;
  }
}
