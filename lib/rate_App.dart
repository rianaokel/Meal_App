import 'package:flutter/cupertino.dart';
import 'package:rate_my_app/rate_my_app.dart';

class AppRating {
  rateApp(BuildContext context) {
    RateMyApp rateMyApp = RateMyApp(
        preferencesPrefix: "rateMyApp_",
        minDays: 1,
        minLaunches: 1,
        remindDays: 0,
        remindLaunches: 1,
        appStoreIdentifier: "1223422",
        googlePlayIdentifier: "com.hard75daychallenge.fitnesschallenge");


    rateMyApp.init().then(
          (_) => {
        if (rateMyApp.shouldOpenDialog)
          {
            rateMyApp.showRateDialog(
              context,
              title: "Enjoying our app?",
              message:
              "Show your love by giving us a review on Google Play",
              rateButton: "Rate Now",
              noButton: "No",
              laterButton: "Later",
              listener: (button) {
                switch (button) {
                  case RateMyAppDialogButton.rate:
                    print("Clicked Rate Button");
                    break;
                  case RateMyAppDialogButton.no:
                    print("Clicked No");
                    break;
                  case RateMyAppDialogButton.later:
                    print("Clicked Later");
                    break;
                }
                return true;
              },
              dialogStyle: const DialogStyle(),
              onDismissed: () => rateMyApp
                  .callEvent(RateMyAppEventType.laterButtonPressed),
            ),
          }
      },
    );
  }
}
