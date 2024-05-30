import 'package:flutter/material.dart';
import 'package:rentalhub/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(), // Dashboard content
    MessagesPage(), // Messages content
    PostPage(), // Post content
    SearchPage(), // Search content
    ProfilePage(), // Profile content
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            );
          },
        ),
        title: Text('Rent Now, Smile Always'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: ProfileDrawer(
        username: "username",
        email: "email",
        role: "role",
        location: "location",
        onLogout: () {
          // Implement logout functionality
        },
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<House> houses = [
    House(
      imagePath: "",
      description: 'A beautiful 3 bedroom house.',
      price: 250000,
      ownerPhoneNumber: '0763399247',
      location: 'New York',
    ),
    House(
      imagePath: "",
      description: 'Modern 2 bedroom apartment.',
      price: 150000,
      ownerPhoneNumber: '0626641182',
      location: 'Los Angeles',
    ),
    House(
      imagePath: "",
      description: 'Apartment.',
      price: 150000,
      ownerPhoneNumber: '0676641182',
      location: 'Chicago',
    ),
    // Add more houses as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: houses.length,
      itemBuilder: (context, index) {
        final house = houses[index];
        return _buildHouseItem(house);
      },
    );
  }

  Widget _buildHouseItem(House house) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'Description: ${house.description}',
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
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement message functionality
            },
            child: Text('Message'),
          ),
        ],
      ),
    );
  }
}

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

// Placeholder widgets for other pages
class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(Message(
          text: _controller.text,
          isOwner:
              true, // For demonstration, mark all messages as from the owner
        ));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              return _buildMessageItem(message);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _sendMessage,
                child: Text('Send'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMessageItem(Message message) {
    return Align(
      alignment: message.isOwner ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: message.isOwner ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isOwner ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isOwner;

  Message({
    required this.text,
    required this.isOwner,
  });
}

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedImage;

  void _postHouse() {
    final description = _descriptionController.text;
    final price = _priceController.text;
    final phone = _phoneController.text;

    if (description.isNotEmpty &&
        price.isNotEmpty &&
        phone.isNotEmpty &&
        _selectedImage != null) {
      // Implement the logic to save the house details
      // For example, you might want to send this data to a server or save it locally

      print(
          'House Posted: Description: $description, Price: $price, Phone: $phone, Image: $_selectedImage');
    } else {
      // Show an error message or handle validation
      print('Please fill all the fields and select an image.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post a House'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Owner Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _postHouse,
              child: Text('Post House'),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<House> _houses = [
    House(
      imagePath: "",
      description: 'A beautiful 3 bedroom house in New York.',
      price: 250000,
      ownerPhoneNumber: '0763399247',
      location: 'New York',
    ),
    House(
      imagePath: "",
      description: 'Modern 2 bedroom apartment in Los Angeles.',
      price: 150000,
      ownerPhoneNumber: '0626641182',
      location: 'Los Angeles',
    ),
    House(
      imagePath:"",
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

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page'),
    );
  }
}
