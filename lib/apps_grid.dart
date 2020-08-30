import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_state.dart';

class AppsGridPage extends StatefulWidget {
  @override
  _AppsGridPageState createState() => _AppsGridPageState();
}

class _AppsGridPageState extends State<AppsGridPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          final appsInfo = watch(appsProvider);
          return appsInfo.when(
              data: (List<Application> apps) => GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    children: [
                      ...apps.map((app) => AppGridItem(
                            application: app,
                          ))
                    ],
                  ),
              loading: () => CircularProgressIndicator(),
              error: (e, s) => Container());
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class AppGridItem extends StatelessWidget {
  final ApplicationWithIcon application;
  const AppGridItem({
    this.application,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DeviceApps.openApp(application.packageName);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.memory(
              application.icon,
              fit: BoxFit.contain,
              width: 40,
            ),
          ),
          Text(
            application.appName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
