import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'users.dart';
import 'package:provider/provider.dart';
import 'prov/providerrr.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  List<userss> users = [];
  String picked_name = '';
  int currentPage = 1;
  late int totalPages;
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  bool isInitialLoading = true;

  Future apicall() async {
    http.Response response = await http.get(Uri.parse('https://reqres.in/api/users?page=$currentPage&per_page=10'));
    var jsonData = json.decode(response.body);

    for (var eachUser in jsonData['data']) {
      final user = userss(
        email: eachUser['email'],
        firstName: '${eachUser['first_name']} ${eachUser['last_name']}',
        avatar: eachUser['avatar'],
      );
      users.add(user);
    }
    totalPages = jsonData['total_pages'];
  }

  Future<void> _loadNextPage() async {
    currentPage++;
    await apicall();
    _refreshController.loadComplete();
    setState(() {});
  }

 @override
  void initState() {
    super.initState();
    if (isInitialLoading) {
      apicall().then((_) {
        setState(() {
          isInitialLoading = false;
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Third Screen', style: GoogleFonts.poppins(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: false,
          enablePullUp: true,
          onLoading: _loadNextPage,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  picked_name = users[index].firstName;
                  Provider.of<UserProviderr>(context, listen: false).setName(picked_name);
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index].avatar),
                ),
                title: Text(users[index].firstName, style: GoogleFonts.poppins(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                subtitle: Text(users[index].email, style: GoogleFonts.poppins(color: Colors.black, fontSize: 15)),
              );
            },
          ),
        ),
      ),
    );
  }
}
