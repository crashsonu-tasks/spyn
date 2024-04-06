import 'package:flutter/material.dart';
import 'package:spyn/network/api/api_service.dart';
import 'package:flutter_html/flutter_html.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spyn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const ListTile(
          leading: Icon(
            Icons.circle_outlined,
            color: Colors.redAccent,
            size: 50,
          ),
          title: Text(
            'Home',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Star Academy',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'HOME',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 13),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'POSTS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 5),
            child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.green,
                    width: 1,
                  ),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.green),
                )),
          )
        ],
      ),
      body: const HomeViewBodyWidget(),
    );
  }
}

class HomeViewBodyWidget extends StatefulWidget {
  const HomeViewBodyWidget({super.key});

  @override
  State<HomeViewBodyWidget> createState() => _HomeViewBodyWidgetState();
}

class _HomeViewBodyWidgetState extends State<HomeViewBodyWidget> {
  Map<String, dynamic> venueData = {};

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  Future _initAsync() async {
    final res = await getData();
    if (res != null) {
      setState(() {
        venueData = res['venue_basic_data'] ?? {};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [TopBannerWidget(venueData: venueData)],
      ),
    );
  }
}

class TopBannerWidget extends StatelessWidget {
  final Map venueData;

  const TopBannerWidget({super.key, required this.venueData});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isMobileView = width >= 960 ? false : true;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: isMobileView ? 2 : 1,
              child: Container(child: Image.asset('assets/spyn.jpeg'))),
          if (venueData.isNotEmpty)
            Expanded(
                flex: isMobileView ? 1 : 1,
                child: Container(
                    child: Html(
                  data: venueData['description'],
                  style: {
                    // Apply CSS styles here, e.g.,
                    "*": Style(
                      fontSize: FontSize.medium,
                      color: Colors.black,
                    ),
                    "a": Style(
                      color: Colors.blue,
                      textDecoration: TextDecoration.underline,
                    ),
                  },
                )))
        ],
      ),
    );
  }
}
