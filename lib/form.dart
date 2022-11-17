import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';

List<List> listJawaban = [];

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaLengkap = "";
  int _nominal = 0;
  bool pemasukan = false;
  bool pengeluaran = false;
  String jenisNominal = "Pemasukan";
  List<String> listJenisNominal = ['Pemasukan', 'Pengeluaran'];

  double umur = 0;
  String kelasPBP = 'A';
  List<String> listKelasPBP = ['A', 'B', 'C', 'D', 'E', 'F', 'KI'];
  bool _nilaiSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage(title: 'Flutter Demo Home Page')),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),

            ListTile(
              title: const Text('Data budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyDataPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Brr",
                      labelText: "Judul",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _namaLengkap = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _namaLengkap = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: ZZ",
                      labelText: "Nominal",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value == null || value!.isEmpty) {
                          _nominal = 0;
                        } else if (int.tryParse(value) != null) {
                          _nominal = int.parse(value);
                        } else {
                          _nominal = 0;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nominal = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      } else if (int.tryParse(value) == null) {
                        return 'Nilai nominal harus berupa angka!';
                      }
                      return null;
                    },
                  ),
                ),

                // const ListTile(
                //         leading:  Icon(Icons.school),
                //         title: Text("Jenjang"),
                //     ),
                //     CheckboxListTile(
                //         title: const Text('Sarjana'),
                //         value: pemasukan,
                //         onChanged: (bool? value) {
                //         setState(() {
                //             pemasukan = value!;
                //             if (value){
                //                pengeluaran = false;
                //             }
                //         });
                //         },
                //     ),
                //     CheckboxListTile(
                //         title: const Text('Diploma'),
                //         value: pengeluaran,
                //         onChanged: (bool? value) {
                //         setState(() {
                //             pengeluaran = value!;
                //             if (value){
                //                 pemasukan = false;
                //             }
                //         });
                //         },
                //     ),

                // ListTile(
                //   leading: const Icon(Icons.co_present),
                //   title: Row(
                //       children: [
                //       Text('Umur: ${umur.round()}'),
                //       ],
                //   ),
                //   subtitle: Slider(
                //       value: umur,
                //       max: 100,
                //       divisions: 100,
                //       label: umur.round().toString(),
                //       onChanged: (double value) {
                //       setState(() {
                //           umur = value;
                //       });
                //       },
                //   ),
                // ),

                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Pilih Jenis',
                  ),
                  trailing: DropdownButton(
                    value: jenisNominal,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listJenisNominal.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenisNominal = newValue!;
                      });
                    },
                  ),
                ),

                // SwitchListTile(
                //     title: const Text('Practice Mode'),
                //     value: _nilaiSwitch,
                //     onChanged: (bool value) {
                //         setState(() {
                //         _nilaiSwitch = value;
                //         });
                //     },
                //     secondary: const Icon(Icons.run_circle_outlined),
                //     ),

                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      List listBudget = [];
                      listBudget.add(_namaLengkap);
                      listBudget.add(_nominal);
                      listBudget.add(jenisNominal);
                      listJawaban.add(listBudget);

                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Container(
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Center(
                                      child: const Text(
                                          'Data berhasil dimasukkan!')),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Kembali'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
