part of '../privacy_policy_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Team Taskify built the Taskify app as a Free app. This SERVICE is provided by team Taskify at no cost and is intended for use as is. This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.",
            ),
            Text(
              "If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.",
            ),
            Text(
                "Terms and Conditions, which are accessible at Taskify unless otherwise defined in this Privacy Policy."),
            Text("Information Collection and Use"),
            Text(
                "For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way"),
            Text(
                "The app does use third-party services that may collect information used to identify you."),
            Text(
                "Link to the privacy policy of third-party service providers used by the app"),
            Text(
              "\u2022  Google Play Services",
            ),
            Text(
              "\u2022  Google Analytics for Firebase",
            ),
            Text(
              "\u2022  Firebase Crashlytics",
            ),
            Text(
                "We want to inform you that whenever you use Our Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.")
          ],
        ),
      ),
    );
  }
}
