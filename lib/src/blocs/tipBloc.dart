import 'package:flutter_plant_app/src/models/tip.dart';
import 'package:flutter_plant_app/src/repository/tipRepository.dart';

class TipBloc {
  TipRepository _tipRepo = TipRepository();

  getTip() async {
    Tip tip = await _tipRepo.fetchTip();
  }
}
