void main() {
  // cek cek
  // tulis balasan kalau kau liat, ok
}

// field definition, ada 3 jenis variable modifier.
int count = 0; // default modifier, variable ini bisa di gonta ganti nilainya
const int min = 10; // variable ini bisa di tidak bisa ganti nilainya
final int max = 10; // variable ini bisa di tidak bisa ganti nilainya

// tapi, const itu nilai variable di set sebelum runtime,
// sedangkan, final itu nilai variable di set saat runtime.

// runtime, atau ketika aplikasi berjalan.
// artinya, dia bisa ngebaca suatu variable. melakukan komputasi dulu, terus di set
// sedangkan const, dia di set sebelum berjalan, berarti ketika compile.
// sehingga, tidak bisa ngebaca variable

int _secretKey = 100; // private modifier,
// di dart, semua field dan function by default public. sampai nambah _
// di depan nama. jadi sebenarnya bukan sebuah modifier, tapi convention.
// dimana, variable yg depannya ada _ itu private. dan krn dart pinter,
// jadi ketika compile, dia bisa set private.

// tentang OOP di dart

// final data class -> should be immutable
class Human {
  // ini field / property
  final int age;
  final String name;

  // ini default constructor
  Human(this.age, this.name);

  // kalau sebuah kelas punya field yg di mark final,
  // semua field itu harus di inisiasi / di buat

  static Human defHuman = Human(0, "");
}

// const data class -> should be immutable
class Laptop {
  final String brand; // bukan const String brand;
  final String name; // bukan const String name;

  const Laptop(this.brand, this.name);

  // mirip seperti yg diatas, tapi, tipe kelas yg ini.
  // dia seperti ngakalin compiler
  // seolah2 object ini dibuat saat run time.
  // tapi syaratnya, semua variable yg di isi,
  // [this.brand, this.name] harus menerima const juga
  // sehingga const kelas ini, sebenarnya sama2 dibuat ketika compile
}

// mutable class
class Home {
  Human girl;
  Human boy;

  // ini brti constructornya menerima input
  // dan langsung set field
  Home(this.girl, this.boy);
}

// mutable class
class School {
  Human girl;
  Human boy;

  // ini brti constructornya menerima input, tapi field dia ga set
  School(String girl, String boy);
}

// mutable class
class Party {
  Human girl;
  Human boy;

  // ini brti constructornya menerima input, tapi set field nya ngecek dulu
  // input nya null atau ga, klo null, pake value di samping kanan ??
  Party(Human girl, Human boy)
      : this.girl = girl ?? Human.defHuman,
        this.boy = boy ?? Human.defHuman;
}

// semua jenis constructor bisa dipake untuk data ataupun class biasa

// kalau bgini, apa maksudnya?, langsung di set itu kalau nd diisi
// fieldnya? jadi kalau cuma Car(kilometer: 11) yg jenis otomatis jdi "" sja?

class Car {
  int kilometer;
  String jenis;

  Car({this.kilometer = 0, this.jenis = ""});
}

class Utils {}

extension on Human {}
