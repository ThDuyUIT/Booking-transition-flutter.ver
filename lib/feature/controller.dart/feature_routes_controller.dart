import 'package:booking_transition_flutter/feature/services/get_data_service.dart';

import '../presentation/page/Search/list_item_route.dart';

class FeatureRouteController {
  Future setFeaturedRoutes() async {
    return await GetDataService.fetchPopularRoute();
  }
}
