import 'package:lifx_http_api/lifx_http_api.dart' show Bulb;
import 'package:bloc/bloc.dart' show Cubit;

class BulbsCubit extends Cubit<List<Bulb>> {
  BulbsCubit(List<Bulb> initialState) : super(initialState);
}
