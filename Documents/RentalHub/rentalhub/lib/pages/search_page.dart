import 'package:flutter/material.dart';

class House {
  final String imagePath;
  final String description;
  final double price;
  final String ownerPhoneNumber;
  final String location;

  House({
    required this.imagePath,
    required this.description,
    required this.price,
    required this.ownerPhoneNumber,
    required this.location,
  });
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<House> _houses = [
    House(
      imagePath: 'assets/images/house1.jpg',
      description: 'A beautiful 3 bedroom house in New York.',
      price: 250000,
      ownerPhoneNumber: '0763399247',
      location: 'New York',
    ),
    House(
      imagePath: 'assets/images/house2.jpg',
      description: 'Modern 2 bedroom apartment in Los Angeles.',
      price: 150000,
      ownerPhoneNumber: '0626641182',
      location: 'Los Angeles',
    ),
    House(
      imagePath: 'assets/images/house3.jpg',
      description: 'Cozy studio apartment in Chicago.',
      price: 100000,
      ownerPhoneNumber: '0676641182',
      location: 'Chicago',
    ),
    // Add more houses as needed
  ];

  List<House> _filteredHouses = [];

  @override
  void initState() {
    super.initState();
    _filteredHouses = _houses;
  }

  void _searchHouses(String query) {
    final filteredHouses = _houses.where((house) {
      final locationLower = house.location.toLowerCase();
      final searchLower = query.toLowerCase();

      return locationLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredHouses = filteredHouses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Houses by Location'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter location',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                _searchHouses(query);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredHouses.length,
                itemBuilder: (context, index) {
                  final house = _filteredHouses[index];
                  return _buildHouseItem(house);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHouseItem(House house) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              house.imagePath,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            SizedBox(height: 10),
            Text(
              house.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Price: \$${house.price}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Owner Phone: ${house.ownerPhoneNumber}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Location: ${house.location}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement message functionality
              },
              child: Text('Message'),
            ),
          ],
        ),
      ),
    );
  }
}
