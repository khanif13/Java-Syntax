# Java Syntax: Input Output dalam Java
Seperti yang kita ketahui, program komputer terdiri dari tiga komponen utama, yaitu: input, proses, dan output.
- Input: nilai yang kita masukan ke program
- Proses: langkah demi langkah yang dilakukan untuk mengelola input menjadi sesuatu yang berguna
- Output: hasil pengolahan

Semua bahasa pemrograman telah menyediakan fungsi-fungsi untuk melakukan input dan output.

Java sendiri sudah menyediakan tiga class untuk mengambil input:

- Class Scanner;
- Class BufferReader;
- dan Class Console.

Tiga class tersebut untuk mengambil input pada program berbasis teks (console). Sedangkan untuk GUI menggunakan class yang lain seperti `JOptionPane` dan `inputbox` pada form.

Sementara untuk outputnya, Java menyediakan fungsi `print()`, `println()`, dan `format()`.

## Mengambil Input dengan Class Scanner
Scanner merupakan class yang menyediakan fungsi-fungsi untuk mengambil input dari keyboard.

Agar kita bisa menggunakan Scanner, kita perlu mengimpornya ke dalam kode:
```java
import java.util.Scanner;
```

Setelah itu, silakan ikuti kode berikut ini:
```java
package pertemuan2;

// mengimpor Scanner ke program
import java.util.Scanner;

public class DataKaryawan {

    public static void main(String[] args) {
        // deklarasi variabel
        String nama, alamat;
        int usia, gaji;

        // membuat scanner baru
        Scanner keyboard = new Scanner(System.in);

        // Tampilkan output ke user
        System.out.println("### Pendataan Karyawan PT. Petani Kode ###");
        System.out.print("Nama karyawan: ");
        // menggunakan scanner dan menyimpan apa yang diketik di variabel nama
        nama = keyboard.nextLine();
        // Tampilkan outpu lagi
        System.out.print("Alamat: ");
        // menggunakan scanner lagi
        alamat = keyboard.nextLine();

        System.out.print("Usia: ");
        usia = keyboard.nextInt();

        System.out.print("Gaji: ");
        gaji = keyboard.nextInt();


        // Menampilkan apa yang sudah simpan di variabel
        System.out.println("--------------------");
        System.out.println("Nama Karyawan: " + nama);
        System.out.println("Alamat: " + alamat);
        System.out.println("Usia: " + usia + " tahun");
        System.out.println("Gaji: Rp " + gaji);
    }

}
```

Perlu diperhatikan, penggunakan fungsi untuk mengambil data bergantung dari tipe data yang digunakan.

Misal, tipe datanya adalah String, maka fungsi atau method yang dipakai adalah `nextLine()`.

Begitu juga dengan tipe data lain, Integer menggunakan `nextInt()`, Double menggunakan `nextDouble()`, dsb.

Setelah selesai membuat program, silakan dijalankan. Klik kanan kemudian pilih Run File atau tekan tombol `[Shift]`+`[F6]`.

![contoh output](/assets/img/run.png)

## Mengambil Input dengan Class BufferReader
Class `BufferReader` sebenarnya tidak hanya untuk mengambil input dari keyboard saja.

Class ini juga dapat digunakan untuk membaca input dari file dan jaringan.

Class ini terletak di dalam paket `java.io`.

Silakan diimpor untuk dapat menggunakan class `BufferReader`.

```java
import java.io.BufferedReader;
```

### Mari dicoba...
Buat class baru bernama `ContohBufferReader`, kemudian isi dengan kode berikut ini.

```java
package pertemuan2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ContohBufferReader {

    public static void main(String[] args) throws IOException {

        String nama;

        // Membuat objek inputstream
        InputStreamReader isr = new InputStreamReader(System.in);

        // membuat objek bufferreader
        BufferedReader br = new BufferedReader(isr);

        // Mengisi variabel nama dengan Bufferreader
        System.out.print("Inputkan nama: ");
        nama = br.readLine();

        // tampilkan output isi variabel nama
        System.out.println("Nama kamu adalah " + nama);

    }

}
```

Ternyata class `BufferReader` tidak bisa bekerja sendirian. Dia juga butuh teman yaitu: class `InputStreamReader` dan class `IOException`.

Sekarang mari kita coba jalankan programnya:

![contoh output](/assets/img/inputan.png)

Perbedaan `BufferReader` dengan `Scanner` terlihat dari fungsi atau method yang dipakai.

`Scanner` menggunakan `next()`, sedangkan `BufferReader` menggunakan `readLine()`.

Lalu untuk tipe data integer, `BufferReader` menggunakan fungsi `read()` saja. Hal ini dapat kita lihat dalam hint autocomplete .

![method read](/assets/img/readline.png)

**Tips**: Tekan `Ctrl`+`Spasi` saat menulis kode untuk menampilkan hint autocomplete.

## Mengambil Input dengan Class Console
Class `Console` hampir sama dengan `BufferReader`. Dia juga menggunakan fungsi `readLine()` untuk mengambil input.

Akan tetapi…

Class ini hanya bisa digunakan di lingkungan console saja, seperti Terminal dan CMD.

Class `Console` tidak bisa digunakan langsung di Netbeans.

Maka dari itu, kita harus kompilasi secara manual.

Untuk menggunakan class ini, kita perlu mengimpornya terlebih dahulu.

```java
import java.io.Console;
```

Buatlah file baru bernama `InputConsole.java` dengan isi sebagai berikut:

```java
import java.io.Console;

public class InputConsole {
    public static void main(String[] args) {

        String nama;
        int usia;

        // membuat objek console
        Console con = System.console();

        // mengisi variabel nama dan usia dengan console
        System.out.print("Inputkan nama: ");
        nama = con.readLine();
        System.out.print("Inputkan usia: ");
        usia = Integer.parseInt(con.readLine());

        // menampilkan isi variabel nama dan usia
        System.out.println("Nama kamu adalah: " + nama);
        System.out.println("Saat ini berusia " + usia + " tahun");
    }
}
```

**Perhatikan**: dalam kode di atas, kita menggunakan fungsi `Integer.parseInt(con.readLine())` untuk tipe data integer. Artinya, kita mengubah tipe data String ke Integer.

Karena `Console` tidak memiliki nilai kembalian berupa integer untuk fungsi `read()`.

Lanjut…

Setelah itu, lakukan kompilasi melalui Terminal atau CMD. Buka terminal, kemudian masuk ke direktori tempat menyimpan kodenya.

Ketik perintah: `javac InputConsole.java` untuk melakukan kompilasi.

Setelah itu, ketik perintah `java InputConsole` untuk menjalankannya:

![contoh run](/assets/img/input.png)

## Menampilkan Output
Kita sudah mengenal beberapa cara mengambil input dari keyboard untuk program berbasis teks.

Sekarang bagaimana dengan outputnya?

Ada beberapa fungsi yang sudah disediakan oleh Java:

- Fungsi `System.out.print()`
- Fungsi `System.out.println()`
- Fungsi `System.out.format()`

Apa saja perbedaan dari fungsi-fungsi tersebut?

Mari kita bahas…

### Fungsi `print()` vs `println()`
Fungsi `print()` dan `println()` sama-sama digunakan untuk menampilkan teks.

Lalu apa bedanya?

Fungsi `print()` akan menampilkan teks apa adanya. Sedangkan `println()` akan menampilkan teks dengan ditambah baris baru.

Mari kita coba dalam kode:
```java
package eksperimen;

public class PrintVsPrinln {

    public static void main(String[] args) {

        System.out.print("ini teks yang dicetak dengan print()");
        System.out.println("sedangkan ini teks yang dicetak dengan println()");
        System.out.print("pakai print() lagi");

    }

}
```
Sekarang lihat hasil outputnya:

![output](/assets/img/print.png)

## Menggabungkan String
Ketika menggunakan fungsi `print()` maupun `println()`, kadang kita perlu mengambil teks dari variabel dan menggabungkannya dengan teks yang lain.

Misalnya seperti ini:

Kita punya variabel `namaDepan` dan `namaBelakang`:

```java
String namaDepan = "Petani";
String namaBelakang = "Kode";
```

Kemudian kita ingin menampilkannya dengan fungsi `print()`, maka kita hanya perlu memasukkannya ke sana.

```java
System.out.print(namaDepan);
System.out.print(namaBelakang);
```

Kode tersebut akan menghasilkan: `PetaniKode`

Sebenarnya kita tidak perlu menggunakan dua fungsi `print()`, karena kita bisa menggabungkannya dengan operator `+`.

Contoh:
```java
System.out.print(namaDepan + namaBelakang);
```

Agar ada spasi, tinggal ditambahkan saja spasi:
```java
System.out.print(namaDepan + " " + namaBelakang);
```

## Format String
Sedangkan untuk menggabungkan String yang lebih kompleks, kita bisa menggunakan fungsi `format()`.

Contoh:
```java
package eksperimen;

public class FormatString {

    public static void main(String[] args) {

        String namaDepan = "Petani";
        String namaBelakang = "Kode";

        System.out.format("Nama saya %s %s %n", namaDepan, namaBelakang);

    }

}
```

**Perhatikan**: di sana kita menggunakan simbol `%s` untuk mengambil nilai dari variabel di sampingnya. `%s` artinya string.

Selain `%s`, ada juga simbol lain:

- `%d` untuk desimal atau angka;
- `%f` untuk bilangan pecahan;
- `%n`untuk baris baru, bisa juga pakai `\n`;
dan masih banyak lagi.

![alt text](/assets/img/outputformat.png)

Kode di atas akan menghasilkan: Nama saya Java Syntax

## Apa selanjutnya?
Kita baru saja mengetahui tiga cara mengambil input dan menampilkan output untuk program berbasis teks (console).

Selanjutnya, silakan pelajari konsep variabel dan tipe data pada java.