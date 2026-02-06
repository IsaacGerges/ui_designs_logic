import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFeatureScreen extends StatefulWidget {
  const SearchFeatureScreen({super.key});

  @override
  State<SearchFeatureScreen> createState() => _SearchFeatureScreenState();
}

class _SearchFeatureScreenState extends State<SearchFeatureScreen> {
  bool isFilter = false;
  final TextEditingController _controller = TextEditingController();
  List<Map> filteredList = [];
  List<Map> products = [
    {
      'image':
          'https://media.istockphoto.com/id/175216870/photo/old-slr-35mm-film-camera-isolated-on-a-white-background.jpg?s=1024x1024&w=is&k=20&c=3P6YaqGvDPfN2z0vGVwMH9eBsoWIzu9QL14rGoR-2Fg=',
      'title': 'Professional Camera',
      'price': '120',
    },
    {
      'image':
          'https://media.istockphoto.com/id/187120740/photo/15-inch-modern-laptop-istolated-on-white-background.jpg?s=1024x1024&w=is&k=20&c=-35pXowj9RqfnH4H2AAlUleGwoXK9UfcgXR7Hr8BGe4=',
      'title': 'HP Laptop',
      'price': '800',
    },
    {
      'image':
          'https://media.istockphoto.com/id/1297013152/photo/mobile-phone-with-locked-and-home-screens-mockup-of-user-interface-and-app-icons.jpg?s=1024x1024&w=is&k=20&c=_T7aly-SNryhe7jb_87aoSOgiwG5mtRarsHpBp8vui8=',
      'title': 'Samsung Galaxy A50',
      'price': '400',
    },
    {
      'image': 'https://cdn.mos.cms.futurecdn.net/FkGweMeB7hdPgaSFQdgsfj.jpg',
      'title': 'Smart Watch',
      'price': '90',
    },
    {
      'image':
          'https://imagenes.elpais.com/resizer/v2/3XVOVO7OWJE3XADYWXIBWNCXW4.jpg?auth=c89ed0d5ee739f44789ab2380c13ffc964a6050272c800a6bcb93ba9496894a8&width=414',
      'title': 'Tablet',
      'price': '300',
    },
  ];

  /// Search method
  void _searchProducts(String keyWord) {
    setState(() {
      filteredList = products.where((product) {
        final title = product['title'].toString().toLowerCase();
        final input = keyWord.toLowerCase();
        return title.contains(input);
      }).toList();

      if (keyWord == '') {
        _controller.text = '';
      }
      isFilter = true;
    });
  }

  void _filterPrice() {
    setState(() {
      filteredList = List<Map>.from(products);
      filteredList.sort((a, b) => b['price'].compareTo(a['price']));
      isFilter = true;
    });
  }

  void _filterAlpha() {
    setState(() {
      filteredList = List<Map>.from(products);
      filteredList.sort((a, b) => b['title'].compareTo(a['title']));
      isFilter = true;
    });
  }

  @override
  void initState() {
    filteredList = products;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink.shade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),

                /// Text form field
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: _controller,
                    onChanged: _searchProducts,
                    cursorColor: Colors.black,
                    cursorHeight: 18,
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.search),
                      suffixIcon: _controller.text.isNotEmpty
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text = '';
                                  filteredList = products;
                                });
                              },
                              child: Icon(CupertinoIcons.clear, size: 20),
                            )
                          : null,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      fillColor: Colors.grey.shade300,
                      hintText: 'Search',
                      filled: true,
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                /// Categories
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _searchProducts("");
                      },
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("All", style: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _searchProducts("Laptop");
                      },
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("Laptop", style: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _searchProducts("Watch");
                      },
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("Watch", style: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _searchProducts("Camera");
                      },
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("Camera", style: TextStyle(fontSize: 13)),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                /// filters
                Row(
                  children: [
                    /// High to Low price
                    GestureDetector(
                      onTap: _filterPrice,
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "Highest to Lowest",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 10),

                    /// A to Z
                    GestureDetector(
                      onTap: _filterAlpha,
                      child: Row(
                        children: [
                          Icon(Icons.filter_list_sharp, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "A - Z",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),

                    Spacer(),

                    /// Clear Filter
                    if (isFilter == true)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            filteredList = List<Map>.from(products);
                            isFilter = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.clear, color: Colors.white, size: 15),
                              SizedBox(width: 5),
                              Text(
                                "Clear Filter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),

                SizedBox(height: 20),

                /// Search List
                Column(
                  children: List.generate(filteredList.length, (index) {
                    final filterL = filteredList[index];
                    return SingleChildScrollView(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            fit: BoxFit.cover,
                            height: 70,
                            width: 70,
                            filterL['image'],
                          ),
                        ),
                        title: Text(
                          filterL['title'],
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        trailing: Text(
                          '${filterL['price']}\$',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
