# Variabel dan Tipe Data

Variabel adalah tempat menyimpan nilai sementara.

Itu saja.

Serius?

Iya serius, kalau mau yang lebih panjang…

…coba kita lihat pengertiannya dari Wikipedia:

Variabel: (Lat) 1. berubah-ubah, tidak tetap; 2. deklarasi sesuatu yang memiliki variasi nilai 3. berbeda-beda dalam bahasa pemrograman disebut juga simbol yang mewakili nilai tertentu, variabel yang dikenal di sub program disebut variabel lokal. sedang yang di kenal secara umum/utuh dalam satu program disebut variabel global.

Nah, ngerti gak?

Kalau tidak, cukuplah pahami: Variabel sebagai tempat menyimpan nilai sementara.

Lalu, apa itu tipe data?

Tipe data adalah jenis data yang tersimpan dalam variabel.

## Macam-macam Tipe Data

Berikut ini macam-macam tipe data pada Java:

- `char`: Tipe data karakter, contoh `Z`
- `int`: angka atau bilangan bulat, contoh `29`
- `float`: bilangan desimal, contoh `2.1`
- `double`: bilangan desimal juga, tapi lebih besar kapasitasnya, contoh `2.1`
- `String`: kumpulan dari karakter yang membentuk teks, contoh `Hello World!`
- `boolean`: tipe data yang hanya bernilai `true` dan `false`

## Membuat Variabel

Hal yang perlu diketahui dalam pembuatan variabel di java adalah cara penulisannya.

Formatnya seperti ini:

```java
<tipe data> namaVariabel;
```

**Contoh**:

Membuat variabel kosong bertipe integer:

```java
int namaVariabel;
```

Membuat variabel bertipe integer dan langsung diisi nilai:

```java
int namaVariabel = 19;
```

Membuat sekumpulan variabel yang tipe datanya sama:

```java
int a, b, c;
```

Lalu, di mana itu ditulis?

1. Di dalam fungsi `main()`: variabel yang ditulis di dalam fungsi `main()` dan fungsi yang lainnya disebut variabel lokal.
2. Di dalam class: Variabel ini disebut variabel class atau global.

Bingung…?

## Mari Kita Coba Latihan dengan Membuat Program DataDiri

Buatlah program baru bernama DataDiri. Silakan tambahkan kelas (java class) baru di paket (package) `pertemuan1`.

![buat package](/assets/img/package.png)

Pada jendela yang muncul, isi nama kelasnya dengan DataDiri. Setelah itu, silakan ikuti kode berikut.

![class](/assets/img/classs.png)

Setelah itu, coba jalankan dengan menekan tombol `[Shift]`+`[F6]`. Analisa dan pahami maksud kode-kode di atas.

![run](/assets/img/runn.png)

Hasil outputnya sepertinya salah.

Usia kok nilainya alamat, mengapa demikian?

Itu disebabkan karena kita memanggil variabel `alamat` pada baris usia.

Jadi yang akan tampil adalah isi dari variable `alamat`, bukan isi dari variabel `usia`.

Perbaikilah kodenya menjadi seperti ini:

![contoh kode](/assets/img/readline.pngkode.png)

Dan, … silakan coba jalankan kembali programnya.

![run](/assets/img/contohoutput.png)

Yap! hasilnya sudah benar.

## Aturan Penulisan Variabel

Ternyata tidak boleh sembarangan dalam membuat variabel.

Ada aturan yang harus diikuti, di antaranya:

- Nama variabel tidak boleh menggunakan kata kunci dari Java (reserved word) seperti `if`, `for`, `switch`, dll.
- Nama variabel boleh menggunakan huruf, angka (0-9), garis bawah (underscore), dan symbol dollar ($), namun penggunaan garis bawah dan symbol lebih baik dihindari.
- Nama variabel harus diawali dengan huruf kecil, karena Java menggunakan gaya CamelCase.

Apabila nama variabel lebih dari 1 suku kata, maka kata ke-2 dituliskan dengan diawali dengan huruf besar dan seterusnya, contoh `namaVariabel`.

## Latihan Ke-2: Program LuasLingkaran

Mari kita mantapkan pemahaman dengan membuat program LuasLingkaran.

Program ini fungsinya untuk menghitung luas lingkaran.

Luas lingkaran dapat kita hitung dengan rumus `PI x r2`.

Sebelum memulai memprogram, sebaiknya kita pahami dulu algoritma dan flowchart-nya:

## Algoritma

```java
Deklarasi:
    Double luas, PI
    int r
Deskripsi:
    - Input
        PI = 3.14
        r = 18
    - Proses
        luas = PI * r * r
    - Output
        cetak luas
```

## Flow Chart:

![flowchart](/assets/img/flowchart.png)

Nah, sudah jelas kan?

Sekarang kita tinggal coding saja.

![luarLingkaran](/assets/img/luasLingkaran.png)

Silakan dieksekusi dan perhatikan hasilnya.

## Konversi Tipe Data

Konversi artinya mengubah ke jenis yang lain.

Kenapa kita perlu konversi tipe data?

Untuk menjawabnya, saya ingin tunjukan ilustrasi berikut ini:

Air yang bentuknya cair tidak bisa disimpan dalam kardus. Karena itu, air harus konversi dulu menjadi bentuk padat (es) agar bisa disimpan dalam kardus.

Begitu juga dengan variabel.

Tipe data string tidak akan bisa disimpan dalam variabel dengan tipe integer.

## Cara Konversi Tipe Data

Contoh: Konversi ke tipe integer

Cara 1:

```java
Integer.perseInt(variabel);
Integer.perseInt(1.2);
```

Cara 2:

```java
Integer.valueOf(2.1);
```

Cara 3:

```java
objek.toInt();
```

Cara 4:

```java
(int) variabel;
(int) 2.1;
```

Ternyata, ada banyak sekali cara.

## Mari Kita Coba dalam Program…

Buatlah kelas (java class) baru di paket pertemuan2.

Berikan nama: LuasSegitiga.

Kemudian ikuti kode program berikut:

```java
package pertemuan2;

import java.util.Scanner;

public class LuasSegitia {

    public static void main(String[] args) {
        // deklarasi
        Double luas;
        int alas, tinggi;

        // membuat scanner baru
        Scanner baca = new Scanner(System.in);

        // Input
        System.out.println("== Program hitung luas Segitiga ==");
        System.out.print("Input alas: ");
        alas = baca.nextInt();
        System.out.print("Input tinggi: ");
        tinggi = baca.nextInt();

        // proses
        luas = Double.valueOf((alas * tinggi) / 2);

        // output
        System.out.println("Luas = " + luas);
    }

}
```

Variabel `luas` bertipe data Double,
berarti nilai yang bisa disimpan adalah Double.

Sedangkan variabel `alas` dan `tinggi` bertipe Integer.

Agar hasil operasi data integer dapat disimpan dalam variabel bertipe double, maka perlu dikonversi.

Kalau dijalankan, akan menghasilkan:

![alt text](/assets/img/outputLuas.png)
