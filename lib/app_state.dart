import 'package:device_apps/device_apps.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appsProvider = FutureProvider<List<Application>>(
    (ref) => DeviceApps.getInstalledApplications(includeAppIcons: true));
