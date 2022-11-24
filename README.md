# Flutter Basics (Simple Counter App)


## Stateless Widget vs Stateful Widget
Widget merupakan basic building block untuk membuat suatu aplikasi yang berbasis Flutter. Berdasarkan sifatnya, widget dapat dikelompokkan ke dalam dua jenis, yaitu stateless widget dan stateful widget. Stateless widget merupakan widget yang bersifat statis dan tidak pernah berubah. Contohnya adalah Icon, IconButton, dan Text. Sementara itu, stateful widget merupakan widget yang bersifat dinamis, dimana ia akan berubah ketika user melakukan interaksi dengannya atau karena terdapat input tertentu yang dapat mentrigger widget. State dari sebuah widget disimpan dalam object State yang dalam hal Class terpisah dari class widget-nya. Object state tersebut memiliki nilai yang dapat berubah, dimana hal tersebut memicu perubahan state. Ketika terjadi perubahan state, maka state-object akan memanggil method setState untuk memicu pembuatan ulang widget.

## Widget yang dipakai pada proyek ini beserta fungsinya.
Seperti yang kita ketahui, widget merupakan basic building block dalam merancang sebuah aplikasi berbasis Flutter. Oleh karena itu, dalam hal ini seluruh komponen yang terlihat pada dasarnya merupakan widget, termasuk padding. Lebih detailnya, berikut merupakan widget yang dipakai pada proyek beserta fungsinya:
- MyApp --> Stateless widget untuk membuat frame dari aplikasi
- MyHomePage --> Stateful widget untuk membuat frame dari Homepage
- Scaffold  --> Widget yang memberikan akses ke berbagai widget fungsional lainnya seperti AppBar, Drawer, SnackBar, BottomNavigationBar, FloatingActionButton, dll. Scaffold akan mempergunakan keseluruhan space dari screen yang tersedia. Mudahnya, scaffold menjadi kerangka mendasar untuk menyusun layout dari aplikasi.
- Text  --> Untuk membuat text
- Center --> Untuk memposisikan elemen agar berada di tengah
- Column --> Untuk membuat kolom
- Padding --> Untuk membuat padding
- Row --> Untuk membuat baris
- Align --> Untuk melakukan pengaturan posisi widget
- FloatingActionButton --> Untuk membuat button

## Kegunaan fungsi setState dan variabel yang dapat terdampak karena pemanggilannya
method setState berfungsi untuk mentrigger perubahan pada widget (melalui rebuilding Widget dengan pemanggilan method build) ketika terjadi perubahan state, dimana perubahan state dipicu dengan adanya perubahan value pada object state. Komponen yang terdampak karena pemanggilannya ialah object Widget yang secara langsung terasosiasi dengan object-state tersebut beserta turunan/descendantnya. Dalam proyek ini, variabel yang secara langsung terdampak ialah variabel _counter, dimana variabel tersebut akan bertambah/berkurang ketika button +/- ditekan. Kemudian, perubahan dari variabel tersebut memicu perubahan komponen lain, seperti text, hingga button yang dihilangkan ketika _counter == 0. 

## Const vs Final
Const merupakan modifier yang berfungsi untuk menandakan bahwa suatu value dari variabel harus ditetapkan saat compile-time, dan tidak dapat berubah setelah diinisialiasikan (object bersifat immutable). Sementara itu, final merupakan modifier yang berfungsi untuk menandakan bahwa sebuah variabel bersifat final dan tidak dapat direassign ke value yang lain ketika telah terjadi proses assignment (saat run-time). Meskipun begitu, object dari variabel tersebut masih dapat diubah (mutable). 

Contoh yang dapat merepresentasikan hal tersebut ialah ketika terjadi proses assignment sebuah object yang merupakan Collection. Jika digunakan modifier const, maka seluruh object yang terdapat di dalam collection tersebut akan memiliki modifier const dan karenanya bersifat immutable. Sementara itu, jika digunakan modifier final, seluruh object yang terdapat di dalam collection tersebut tidak memiliki modifier final dan karenanya masih dapat diubah (hanya object collection terluarnya saja yang memiliki modifier final).

## Langkah Implementasi

- Melakukan inisialisasi aplikasi dengan command flutter createapp nama_aplikasi

- Memodifikasi code pada class _MyHomePageState dengan menambahkan beberapa method pendukung dinamika aplikasi sebagai berikut :


```
  //Method untuk mengurangi _counter 
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }
```

```
  //Method untuk mengecek apakah _counter merupakan bilangan genap
  bool counterIsEven() {
    return _counter % 2 == 0;
  }
```

```
  //Method untuk menetapkan String yang akan ditampilkan pada screen sesuai kondisi variabel _counter
  String counterStateString() {
    return counterIsEven() ? 'GENAP' : 'GANJIL';
  }
```

```
  //Method untuk mengecek apakah _counter bernilai 0
  bool counterIsZero(){
    return _counter == 0;
  }
```

- Membuat text GENAP/GANJIL dengan modifikasi warna (merah untuk genap & biru untuk ganjil) dengan memanfaatkan class Text dan TextStyle sebagai salah satu elemen pada list of Widget yang merupakan children dari widget Column :

```
Text(counterStateString(),
                style: TextStyle(
                    color: counterIsEven() ? Colors.red : Colors.blue)),
```


- Menempatkan dua buah button pada bottom-left corner dan bottom-right corner dengan struktur sebagai berikut (Padding merupakan salah satu child dari Column). Setiap FloatingActionButton memiliki atribut onPressed, yang mengarah ke sebuah fungsi yang akan dijalankan ketika button ditekan. Untuk button "-", akan dilakukan pengecekan dengan fungsi counterIsZero. Jika _counter bernilai 0, maka FloatingActionButton tersebut tidak akan dibuat dan akan direplace dengan object null.

```

      floatingActionButton:
      Padding(
        padding: const EdgeInsets.all(29.0),
        child: 
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
       
        Align(
            alignment: Alignment.bottomLeft,  
            child: counterIsZero() ? null : FloatingActionButton(
              onPressed: _decrementCounter,
              heroTag: null,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            )), 
        
        Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              heroTag: null,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )),
      ])
      ),

```

# Flutter Navbar, Forms, & Data-Routing

## Perbedaan Navigator.push dan Navigator.pushReplacement
- Navigator.push

source : navigator.dart

Code: 
```
@optionalTypeArgs
static Future<T?> push<T extends Object?>(BuildContext context, Route<T> route) {
  return Navigator.of(context).push(route);

/// Push a new route onto the navigator that most tightly encloses the
/// given context.
}
```

- Navigator.pushReplacement

Code: 

```
@optionalTypeArgs
static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(BuildContext context, Route<T> newRoute, { TO? result }) {
  return Navigator.of(context).pushReplacement<T, TO>(newRoute, result: result);
}
/// Replace the current route of the navigator that most tightly encloses the
/// given context by pushing a new route and then disposing the previous
/// route once the new route has finished animating in.
///
```

Dari kedua kode di atas, terlihat penjelasan bahwa perbedaan antara keduanya terletak pada proses setelah replacement, dimana pada pushReplacement, rute screen awal yang telah direplace akan langsung dibuang (dipop). Sementara itu, pada push biasa, hal tersebut tidak dilakukan (hanya terjadi push screen agar berada di posisi teratas dalam stack).

## Widget yang dipakai beserta fungsinya
Widget yang dipakai dalam pengerjaan proyek ini mencakup widget yang telah dijelaskan sebelumnya pada bagian 7. Selain itu, terdapat beberapa widget tambahan, yakni:
- Card --> untuk membuat cards

- Drawer --> untuk membuat drawer/hamburger yang menjadi tempat menu aplikasi

- ListTile --> widget yang menampung 1-3 baris teks yang secara opsional dapat diapit oleh widget lain

- MaterialPageRoute --> Route modal yang dapat menggantikan screen/page dengan transisi yang adaptif terhadap platform

- Form --> Untuk membuat form

- SingleChildScrollView --> Untuk membuat sebuah widget yang scroll-able.

- TextFormField --> Untuk membuat input field berupa text

- DropdownButton --> Untuk membuat button dropdown
 
- DropdownMenuItem --> Untuk mendefinisikan opsi/pilihan setelah dropdownbutton di tekan

- TextButton --> Untuk membuat button berisi text 



## Jenis-jenis event yang ada pada Flutter 
- onPressed --> muncul ketika suatu widget ditekan

- onChanged --> muncul ketika suatu widget diubah

- onSaved --> muncul ketika dilakukan proses saving pada widget

Selain ketiga event tersebut, masih terdapat event-event lainnya, dimana kita dapat mendefinisikan handler bagi setiap kemunculan event.

## Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Berdasarkan definisi yang terdapat pada dokumentasi flutter (https://api.flutter.dev/flutter/), navigator merupakan widget yang memanage kumpulan child-widget lain dengan menggunakan konsep stack. Dalam sebuah aplikasi mobile, konten dari sebuah aplikasi dilihat dalam sebuah screen atau halaman. Di dalam Flutter, screen atau halaman tersebut disebut sebagai routes yang dikelola oleh widget Navigator. Sesuai dengan konsep stack, route yang dipush akan ditempatkan di paling atas. Sementara itu, proses popping route juga akan dilakukan melalui elemen yang paling atas (Last In, First Out). 


## Langkah Implementasi
- Menambahkan drawer/hamburger dengan 3 menu, yaitu untuk counter_7, tambah budget, dan data budget dengan pendefinisian widget drawer sebagai berikut:

```
Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page')),
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
                MaterialPageRoute(builder: (context) =>  MyDataPage()),
              );
            },
          ),
        ],
      ),
    ),
```

- Menambahkan halaman form dengan kode seperti yang dapat dilihat pada form.dart. Pada form.dart, kita akan mengambil data dari user dan memetakannya ke dalam sebuah variabel yang nantinya dapat diakses oleh aplikasi lainnya.

- Menambahkan halaman data budget sesuai dengan yang dapat dilihat pada data.dart

- Mengintegrasikan setiap halaman dengan melakukan import, sehingga data antaraplikasi dapat tersinkronisasi.



# Integrasi Web Service pada Flutter

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, hal tersebut dapat dilakukan. Namun, hal tersebut akan membuat program cenderung lebih rumit dan pada akhirnya tingkat keterbacaannya pun akan menurun. Dengan membuat model, code dapat lebih terabstraksi dan teratur (sebagaimana manfaat yang dapat kita peroleh dengan menerapkan Object Oriented Programming). Dengan begitu, pengambilan data dari JSON tanpa membuat model tidak lebih baik daripada membuat model terlebih dahulu untuk membuat object penampung hasil pengambilan data dari JSON.

## Widget yang dipakai pada proyek beserta fungsinya
Beberapa widget tambahan (berdasarkan widget yang dipakai pada tahap 7 & 8) pada proyek tahap-9 kali ini ialah:

- FutureBuilder --> Widget yang akan terbentuk berdasarkan snapshot hasil interaksi terbaru dengan Future. Widget ini berfungsi untuk mengeksekusi perubahan widget berdasarkan hasil fungsi yang bersifat asinkronus. 
- CircularProgressIndicator -> Widget yang dapat menggambarkan bahwa suatu proses sedang dilakukan (menampilkan visualisasi loading).
- MyWatchListPage --> Widget custom yang dibuat untuk menampilkan halaman berisi kumpulan watchlist pengguna.
- MyWatchListDetail --> Widget custom yang dibuat untuk menampilkan detail dari suatu watchlist.

## Mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter
- Membuat model mywatchlist untuk membuat object berdasarkan data JSON yang akan diambil
- Membuat fungsi untuk mengkonversi data JSON menjadi object dari model yang telah dibuat sebelumnya, maupun sebaliknya
- Membuat fetcher dari data JSON sebagaimana yang terdefinisi pada fetcherWatchList.dart (mendapatkan url(http://cata-log.herokuapp.com/mywatchlist/json/) terlebih dahulu dengan method parse dari class Uri, memanggil data dari url dengan method get dari http, data yang diperoleh akan didecode, lalu akan diconvert menjadi object MyWatchList dengan method fromJson yang telah didefinisikan sebelumnya)
- Membuat halaman My Watch List yang akan menampilkan nama-nama watchlist dari pengguna dengan memanfaatkan FutureBuilder, dimana atribut future berisi fungsi yang akan dijalankan untuk mengambil suatu snapshot, dimana snapshot tersebut akan dipakai sebagai basis untuk mendefinisikan elemen yang akan dibuat dan didefinisikan pada atribut builder.


## Langkah Implementasi
- Menambahkan menu My Watch List pada drawer
- Menyesuaikan setting environment yang diperlukan agar dapat melakukan pengambilan data melalui internet (memanfaatkan package http, setting AndroidManifest.xml, dll)
- Melakukan pengambilan data dari json hingga dapat ditampilkan pada Flutter sebagaimana yang telah dijelaskan pada bagian sebelumnya
- Membuat halaman berisi detail dari watch list dengan mendefinisikan stateful widget MyWatchListDetail yang akan menerima argumen berupa object MyWatchList
- Mengintegrasikan setiap object MyWatchList pada MyWatchListPage dengan detailnya dengan memanfaatkan Widget ListTile beserta atribut onTap-nya.


