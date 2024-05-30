import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedImage;

  List<String> _assetImages = [
    '',
  ];

  void _selectImage(String imagePath) {
    setState(() {
      _selectedImage = imagePath;
    });
  }

  void _postHouse() {
    final description = _descriptionController.text;
    final price = _priceController.text;
    final phone = _phoneController.text;

    if (description.isNotEmpty && price.isNotEmpty && phone.isNotEmpty && _selectedImage != null) {
      // Implement the logic to save the house details
      // For example, you might want to send this data to a server or save it locally

      print('House Posted: Description: $description, Price: $price, Phone: $phone, Image: $_selectedImage');
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
            Text('Select an Image'),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: _assetImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final imagePath = _assetImages[index];
                  return GestureDetector(
                    onTap: () => _selectImage(imagePath),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _selectedImage == imagePath ? Colors.deepPurple : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: Image.asset(imagePath, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
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
