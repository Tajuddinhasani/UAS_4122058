import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController(text: 'Tajuddin Hasani Zamzami');
  final TextEditingController _genderController = TextEditingController(text: 'Laki-laki');
  final TextEditingController _addressController = TextEditingController(text: 'Kanjar, Pangilen, Sampang, Madura');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto Profil Kotak
              Center(
                child: Container(
                  width: 100, // Lebar foto
                  height: 100, // Tinggi foto
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.lightGreen, // Warna garis kosong
                      width: 2, // Ketebalan garis
                    ),
                    borderRadius: BorderRadius.circular(10), // Corner radius
                    image: DecorationImage(
                      image: AssetImage('assets/image/tj.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              _buildProfileSection('Nama Nasabah', _nameController),
              _buildProfileSection('Jenis Kelamin', _genderController),
              _buildProfileSection('Alamat', _addressController),

              SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showEditDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Edit Profil',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Klik untuk mengedit',
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profil'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: _genderController,
                  decoration: InputDecoration(labelText: 'Jenis Kelamin'),
                ),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Alamat'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {});
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}
