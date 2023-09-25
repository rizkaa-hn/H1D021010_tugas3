import 'package:flutter/material.dart';

class TugasPage extends StatefulWidget {
  const TugasPage();
  @override
  _TugasPageState createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> {
  TextEditingController _namaTugasController = TextEditingController();
  TextEditingController _kelasTugasController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _namaTugasController = TextEditingController();
    _kelasTugasController = TextEditingController();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
  void _simpanData() {
    // Simpan data yang diisi oleh pengguna ke dalam penyimpanan atau lakukan tindakan lainnya sesuai kebutuhan
    // Misalnya:
    final String namaTugas = _namaTugasController.text;
    final String kelasTugas = _kelasTugasController.text;
    final DateTime tanggalTugas = _selectedDate;

    // Lakukan sesuatu dengan data tersebut, seperti menyimpannya dalam database atau menampilkan pesan sukses
  }

  @override
  void dispose() {
    _namaTugasController.dispose();
    _kelasTugasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Page'),
          backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _namaTugasController,
              decoration: InputDecoration(labelText: 'Nama Tugas'),
            ),
            TextField(
              controller: _kelasTugasController,
              decoration: InputDecoration(labelText: 'Kelas Tugas'),
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal Tugas: ${_selectedDate.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Pilih Tanggal'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Warna tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _simpanData(),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Warna tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Center(
                  child: Text('Simpan Data'),
              ),
            ),
        Text('udah ga usah nambah nambah lagi :(', style: TextStyle(color: Colors.green, fontSize: 15),
              textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
