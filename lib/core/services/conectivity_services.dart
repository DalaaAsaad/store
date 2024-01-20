import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store/core/enums/connectivity_statues.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectivityStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity connectivity = Connectivity();
    connectivity.onConnectivityChanged.listen((event) {
      connectivityStatusController.add(getStauts(event));
    });
  }

  ConnectivityStatus getStauts(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.ethernet:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.none:
        return ConnectivityStatus.OFFLINE;
      case ConnectivityResult.vpn:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.other:
        return ConnectivityStatus.ONLINE;
    }
  }
}
