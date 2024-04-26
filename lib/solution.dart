import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Solution extends StatefulWidget {
  @override
  _AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<Solution> {
  @override
  void initState() {
    super.initState();
    _launchURL();
  }

  _launchURL() async {
    const url = 'https://services.india.gov.in/service/search?kw=problem&ln=en&cat_id_search=&location=district&state_id=&district_name=&pin_code=';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // This is just a placeholder widget, you can customize it if needed
    return Scaffold(
      appBar: AppBar(
        title: Text('Launching URL...'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
