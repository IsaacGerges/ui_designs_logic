import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  List<int> items = [];
  final ScrollController _controller = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  final int itemsPerPage = 10;
  final int maxPages = 6;

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 1));

    final start = (currentPage - 1) * itemsPerPage;

    final newItems = List.generate(itemsPerPage, (index) => start + index);
    setState(() {
      items.addAll(newItems);
      currentPage++;
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();

    _controller.addListener(() {
      if (_controller.position.pixels >=
              _controller.position.maxScrollExtent - 100 &&
          !isLoading &&
          currentPage <= maxPages) {
        _fetchData();
      }
    });
    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: items.length,
              itemBuilder: (context, index) => Container(
                height: 50,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Center(
                  child: Text(
                    'Item ${items[index]}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),

          if (isLoading)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CupertinoActivityIndicator(
                color: Colors.white,
                radius: 15,
              ),
            ),

          if (currentPage > maxPages && isLoading == false)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'No more items to load',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
