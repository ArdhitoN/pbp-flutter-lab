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