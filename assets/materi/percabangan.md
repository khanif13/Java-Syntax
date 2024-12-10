# Memahami Percabangan Dalam Java

Kalau kita perhatikan, alur pengeksekusian sebuah kode program dikerjakan satu per satu dari atas sampai ke bawah.

Baris demi baris dibaca, kemudian komputer mengerjakan apa yang diperintahkan.

Misalnya seperti ini:

![alt text](/assets/img/percabangan/image.png)

Alur programnya satu, tidak ada belokan atau percabangan.

Ngomong-ngomong apa itu percabangan?

Percabangan hanyalah sebuah istilah yang digunakan untuk menyebut alur program yang bercabang.

Percabangan juga dikenal dengan “Control Flow”, “Struktur Kondisi”, “Struktur IF”, “Decision”, dsb. Semuanya itu sama.

Pada diagram alur (Flow Chart) seperti di atas, alurnya memang satu.

Tapi setelah kita menggunakan percabangan, alurnya akan bertambah menjadi seperti ini.

![alt text](/assets/img/percabangan/image-1.png)

Lalu bagaimana cara menulis kode percabangan dalam Java?

Caranya: menggunakan kata kunci `if`, `else`, `switch`, dan `case`, dan operator `ternary`.

Contoh format struktur IF seperti ini:

```java
if( suatu_kondisi ) {
    // lakukan sesuatu kalau kondisi benar
    // Lakukan ini juga
}
```

`suatu_kondisi` hanya bernilai `true`/`false` saja. Kita bisa gunakan operator relasi dan logika di sini.

Untuk lebih jelasnya, nanti akan kita bahas.

Sebelumnya, kamu perlu tahu dulu tiga bentuk percabangan pada Java:

1. Percabangan IF
2. Percabangan IF/ELSE
3. Percabangan IF/ELSE/IF atau SWITCH/CASE

Mari kita bahas satu per satu…

## 1. Percabangan IF

Percabangan ini hanya memiliki satu pilihan. Artinya, pilihan di dalam IF hanya akan dikerjakan kalau kondisinya benar.

![alt text](/assets/img/percabangan/image-2.png)

Tapi kalau salah… tidak akan melakukan apa-apa. Alias lanjut eksekusi ke perintah berikutnya.

Contoh:

> Pernahkah kalian belanja di toko, kemudian kalau belanja di atas sekian ribu dapat hadiah atau diskon.

Nah! Contoh kasus seperti itu, dapat kita selesaikan dengan menggunakan percabangan ini.

untuk lebih jelasnya…

### Mari Kita Membuat Program Hadiah

Misalkan ada sebuah toko buku. Mereka memberikan hadiah berupa perlengkapan sekolah kepada pembeli yang belanja di atas Rp 100.000.

Maka programnya bisa kita buat seperti ini:

```java
import java.util.Scanner;

public class Hadiah {

    public static void main(String[] args) {

        // membuat variabel belanja dan scanner
        int belanja = 0;
        Scanner scan = new Scanner(System.in);

        // mengambil input
        System.out.print("Total Belanjaan: Rp ");
        belanja = scan.nextInt();

        // cek apakah dia belanja di atas 100000
        if ( belanja > 100000 ) {
            System.out.println("Selamat, anda mendapatkan hadiah!");
        }

        System.out.println("Terima kasih...");

    }

}
```

Jalankan programnya dan perhatikanlah hasilnya.

![alt text](/assets/img/percabangan/image-3.png)

Cobalah untuk memberikan nilai di bawah `100000` dan perhatikan apa akan yang terjadi.

## 2. Percabangan IF/ELSE

Sedangkan percabangan IF/ELSE memiliki pilihan alternatif kalau kondisinya salah.

**IF**: “Jika kondisi benar maka kerjakan ini, kalau tidak silakan lanjut”

**IF/ELSE**: “Jika kondisi benar maka kerjakan ini, kalau salah maka kerjakan yang itu, setelah itu lanjut”

![alt text](/assets/img/percabangan/image-4.png)

Begitulah perbedaan IF dengan IF/ELSE.

Sekarang mari kita coba dalam kode program…

### Program Cek Kelulusan

Misalkan, kalau nilai siswa lebih besar dari 70, maka ia dinyatakan lulus. Kalau tidak, maka dia gagal.

Programnya bisa kita buat seperti ini:

```java
import java.util.Scanner;

public class CekKelulusan {

    public static void main(String[] args) {

        // membuat variabel dan Scanner
        int nilai;
        String nama;
        Scanner scan = new Scanner(System.in);

        // mengambil input
        System.out.print("Nama: ");
        nama = scan.nextLine();
        System.out.print("Nilai: ");
        nilai = scan.nextInt();

        // cek apakah dia lulus atau tidak
        if( nilai >= 70 ) {
            System.out.println("Selemat " + nama + ", anda lulus!");
        } else {
            System.out.println("Maaf " + nama + ", anda gagal");
        }

    }

}
```

Hasil outputnya:
![alt text](/assets/img/percabangan/image-5.png)

Cobalah untuk mengubah nilai yang dimasukkan dan perhatikan apa yang akan terjadi.

### Percabangan IF/ELSE dengan Operator Ternary

Selain menggunakan struktur seperti di atas, percabangan ini juga dapat menggunakan operator ternary.

Seperti yang sudah kita pelajari pada pembahasan tentang operator. Operator ternary memiliki konsep yang sama seperti percabangan IF/ELSE.

Contoh programnya:

```java
public class OperatorTernary {
    public static void main(String[] args) {

        boolean suka = true;
        String jawaban;

        // menggunakan operator ternary
        jawaban = suka ? "iya" : "tidak";

        // menampilkan jawaban
        System.out.println(jawaban);

    }
}
```

## 3. Percabangan IF/ELSE/IF dan SWITCH/CASE

Jika percabangan IF/ELSE hanya memiliki dua pilihan saja. Maka percabangan IF/ELSE/IF memiliki lebih dari dua pilihan.

Formatnya seperti ini:

```java
if (suatu kondisi) {
    // maka kerjakan ini
    // kerjakan perintah ini juga
    // …
} else if (kondisi lain) {
    // kerjakan ini
    // kerjakan ini juga
    // …
} else if (kondisi yang lain lagi) {
    // kerjakan perintah ini
    // kerjakan ini juga
    // …
} else {
    // kerjakan ini kalau
    // semua kondisi di atas
    // tidak ada yang benar
    // …
}
```

Coba perhatikan contohnya:
![alt text](/assets/img/percabangan/image-6.png)

Jika nilainya lebih besar dari `90`, maka grade-nya “A”. Sedangkan kalau lebih besar dari `80`, maka “B+”. Lebih besar dari `70`, maka “B”, dan seterusnya.

Lebih jelasnya, mari kita buat program.

### Program HitungGrade

Silakan buat sebuah class baru bernama `HitungGrade`, kemudian ikuti kode program berikut.

```java
import java.util.Scanner;

public class HitungGrade {
    public static void main(String[] args) {

        // membuat variabel dan scanner
        int nilai;
        String grade;
        Scanner scan = new Scanner(System.in);

        // mengambil input
        System.out.print("Inputkan nilai: ");
        nilai = scan.nextInt();

        // tentukan grade-nya
        if ( nilai >= 90 ) {
            grade = "A";
        } else if ( nilai >= 80 ){
            grade = "B+";
        } else if ( nilai >= 70 ){
            grade = "B";
        } else if ( nilai >= 60 ){
            grade = "C+";
        } else if ( nilai >= 50 ){
            grade = "C";
        } else if ( nilai >= 40 ){
            grade = "D";
        } else {
            grade = "E";
        }

        // cetak hasilnya
        System.out.println("Grade: " + grade);
    }
}
```

Hasil outputnya:
![alt text](/assets/img/percabangan/image-7.png)

### Percabangan SWITCH/CASE

Percabangan SWITCH/CASE sebenarnya adalah bentuk lain dari IF/ELSE/IF.

Bedanya, percabangan ini menggunakan kata kunci `switch` dan `case`.

Formatnya juga berbeda, tapi cara kerjanya sama.

```java
switch(variabel){
    case 1:
        // kerjakan kode ini
        // kode ini juga
        break;
    case 2:
        // kerjakan kode ini
        // kode ini juga
        break;
    case 3:
        // kerjakan kode ini
        // kode ini juga
        break;
    default:
        // kerjakan kode ini
        // kode ini juga
        break;
}
```

Perhatikan: `case 1` artinya nilai `variabel` yang akan dibandingkan, apakah nilainya sama dengan `1` atau tidak.

Kalau iya, maka kerjakan kode yang ada di dalam `case 1`.

Bisa juga bentuknya berbeda, misalnya seperti ini:

```java
switch (variabel) {
    case 'A':
        // lakukan sesuatu
        break;
    case 'B':
        // lakukan ini
        break;
    default:
        // lakukan ini
}
```

Perlu diperhatikan juga: di sana ada kata kunci `break` dan `default`.

- `break` artinya berhenti. Ini untuk memerintahkan komputer untuk berhenti mengecek `case` yang lainnya.
- `default` artinya jika nilai variabel tidak ada yang sama dengan pilihan `case` di atas, maka kerjakan kode yang ada di dalam `default`.

Pilihan `default` bisa juga tidak memiliki `break`, karena dia adalah pilihan terakhir. Artinya pengecekan akan berakhir di situ.

Contoh program dengan percabangan SWITCH/CASE:

```java
import java.util.Scanner;

public class LampuLalulintas {
    public static void main(String[] args) {

        // membuat variabel dan Scanner
        String lampu;
        Scanner scan = new Scanner(System.in);

        // mengambil input
        System.out.print("Inputkan nama warna: ");
        lampu = scan.nextLine();

        switch(lampu){
            case "merah":
                System.out.println("Lampu merah, berhenti!");
                break;
            case "kuning":
                System.out.println("Lampu kuning, harap hati-hati!");
                break;
            case "hijau":
                System.out.println("Lampu hijau, silakan jalan!");
                break;
            default:
                System.out.println("Warna lampu salah!");
        }
    }
}
```

## Apa Selanjutnya?

Selanjutnya, silakan pelajari tentang **Perulangan dalam Java**.
