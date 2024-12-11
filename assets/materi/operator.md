# 5 Operator Pada Java

Operator dalam pemrograman digunakan untuk melakukan operasi tertentu.

Misalkan kita ingin menjumlahkan nilai dari variabel `x` dan `y`,
maka kita bisa menggunakan operator penjumlahan (`+`).

```java
x + y
```

Ada enam jenis kelompok operator dalam pemrograman Java:

1. Operator Aritmatika;
2. Operator Penugasan;
3. Operator Pembanding;
4. Operator Logika;
5. Operator Bitwise;
6. Operator Ternary.

Mari kita bahas, satu per satu…

## 1. Operator Aritmatika

Operator aritmatika digunakan untuk melakukan operasi aritmatika.

Operator ini terdiri dari:

| **NAMA**    | **SIMBOL** |
| ----------- | ---------- |
| Penjumlahan | `+`        |
| Perkalian   | `*`        |
| Pembagian   | `/`        |
| Sisa Bagi   | `%`        |

Bagaimana cara pakainya?

### Mari kita coba praktik…

Buatlah kelas baru bernama OperatorAritmatika, kemudian ikuti kode berikut:

```java
import java.util.Scanner;

public class OperatorAritmatika {

    public static void main(String[] args) {
        int angka1;
        int angka2;
        int hasil;

        Scanner keyboard = new Scanner(System.in);

        System.out.print("Input angka-1: ");
        angka1 = keyboard.nextInt();
        System.out.print("Input angka-2: ");
        angka2 = keyboard.nextInt();

        // penjumlahan
        hasil = angka1 + angka2;
        System.out.println("Hasil = " + hasil);

        System.out.print("Input angka-1: ");
        angka1 = keyboard.nextInt();
        System.out.print("Input angka-2: ");
        angka2 = keyboard.nextInt();

        // pengurangan
        hasil = angka1 - angka2;
        System.out.println("Hasil = " + hasil);

         System.out.print("Input angka-1: ");
        angka1 = keyboard.nextInt();
        System.out.print("Input angka-2: ");
        angka2 = keyboard.nextInt();

        // perkalian
        hasil = angka1 * angka2;
        System.out.println("Hasil = " + hasil);


        System.out.print("Input angka-1: ");
        angka1 = keyboard.nextInt();
        System.out.print("Input angka-2: ");
        angka2 = keyboard.nextInt();

        // Pembagian
        hasil = angka1 / angka2;
        System.out.println("Hasil = " + hasil);

        System.out.print("Input angka-1: ");
        angka1 = keyboard.nextInt();
        System.out.print("Input angka-2: ");
        angka2 = keyboard.nextInt();

        // Sisa Bagi
        hasil = angka1 % angka2;
        System.out.println("Hasil = " + hasil);

    }

}
```

Silakan jalankan programnya:
![](resource:assets/img/operator/outputOperator.png)

## 2. Operator Penugasan

Operator penugasan (Assignment Operator) fungsinya untuk memberikan tugas pada variabel tertentu. Biasanya untuk mengisi nilai.

Contoh:

```java
int a = 10;
```

Variabel `a` ditugaskan untuk menyimpan nilai `10`.

Operator Penugasan terdiri dari:

| **NAMA**                  | **SIMBOL** |
| ------------------------- | ---------- |
| Pengisian Nilai           | `=`        |
| Pengisian dan Penambahan  | `+=`       |
| Pengisian dan Pengurangan | `-=`       |
| Pengisian dan Perkalian   | `*=`       |
| Pengisian dan Pembagian   | `/=`       |
| Pengisian dan Sisa bagi   | `%=`       |

### Mari Kita Coba…

Sekarang, buatlah sebuah kelas baru bernama OperatorPenugasan.

Kemudian ikuti kode berikut:

```java
public class OperatorPenugasan {

    public static void main(String[] args) {
        int a;
        int b;

        // Pengisian nilai
        a = 5;
        b = 10;

        // penambahan
        b += a;
        // sekarang b = 15
        System.out.println("Penambahan : " + b);

        // pengurangan
        b -= a;
        // sekarang b = 10 (karena 15-5)
        System.out.println("Pengurangan : " + b);

        // perkalian
        b *= a;
        // sekarang b = 50 (karena 10*5)
        System.out.println("Perkalian : " + b);

        // Pembagian
        b /= a;
        // sekarang b=10
        System.out.println("Pembagian : " + b);

        // Sisa bagi
        b %= a;
        // sekarang b=0
        System.out.println("Sisa Bagi: " + b);

    }

}
```

Hasil outputnya:
![](resource:assets/img/operator/image.png)

## 3. Operator Perbandingan

Sepeti namanya, tugas operator ini untuk membandingkan.

Operator ini juga dikenal dengan operator relasi.

Nilai yang dihasilkan dari operator ini berupa boolean, yaitu: `true` dan `false`.

Operator ini terdiri dari:

| **NAMA**                | **SIMBOL** |
| ----------------------- | ---------- |
| Lebih Besar             | `>`        |
| Lebih Kecil             | `<`        |
| Sama Dengan             | `==`       |
| Tidak Sama dengan       | `!=`       |
| Lebih Besar Sama dengan | `>=`       |
| Lebih Kecil Sama dengan | `<=`       |

contoh:

```java
boolean x = 10 < 12
```

Maka `x` akan bernilai true, karena `10` lebih kecil dari `12`.

### Mari kita coba dalam kode

Buatlah sebuah kelas baru bernama OperatorPembanding. Kemudian ikuti kode berikut:

```java
public class OperatorPembanding {

    public static void main(String[] args) {
        int nilaiA = 12;
        int nilaiB = 4;
        boolean hasil;

        // apakah A lebih besar dari B?
        hasil = nilaiA > nilaiB;
        System.out.println(hasil);

        // apakah A lebih kecil dari B?
        hasil = nilaiA < nilaiB;
        System.out.println(hasil);

        // apakah A lebih besar sama dengan B?
        hasil = nilaiA >= nilaiB;
        System.out.println(hasil);

        // apakah A lebih kecil sama dengan B?
        hasil = nilaiA <= nilaiB;
        System.out.println(hasil);

        // apakah nilai A sama dengan B?
        hasil = nilaiA == nilaiB;
        System.out.println(hasil);

        // apakah nilai A tidak sama dengan B?
        hasil = nilaiA != nilaiB;
        System.out.println(hasil);

    }

}
```

Kode program di atas, akan menghasilkan output seperti ini:
![alt text](/assets/img/operator/image-1.png)

## 4. Operator Logika

Kalau kamu pernah belajar logika matematika, pasti tidak akan asing dengan operator ini.

| **NAMA**         | **SIMBOL** |
| ---------------- | ---------- |
| Logika AND       | `&&`       |
| Logika OR        | `\|\|`     |
| Negasi/kebalikan | `!`        |

Operator Logika digunakan untuk membuat operasi logika.

Misalnya seperti ini:

- Pernyataan 1: Petani Kode seorang programmer
- Pernyataan 2: Petani Kode menggunakan Linux
  Jika ditanya, apakah Petani Kode programmer yang menggunakan Linux?

Tentu kita akan cek dulu kebenarannya

- Pernyataan 1: Petani Kode seorang programmer = `true`.
  -Pernyataan 2: Petani Kode menggunakan Linux = `true`.

```java
Pernyataan 1 && Pernyataan 2 = true
```

Bingung?

Coba cek lagi tabel kebenaran untuk logika AND.

| **Pernyataan 1** | **Pernyataan 2** | **Logika AND** |
| ---------------- | ---------------- | -------------- |
| `true`           | `true`           | `true`         |
| `true`           | `false`          | `false`        |
| `false`          | `true`           | `false`        |
| `false`          | `false`          | `false`        |

### Langsung Saja dicoba Program Berikut

Buatlah sebuah kelas baru bernama OperatorLogika. Kemudian ikuti kode berikut ini:

![alt text](/assets/img/operator/image-2.png)

Silakan jalankan dan perhatikan hasilnya:

![alt text](/assets/img/operator/image-3.png)

# 5. Operator Ternary

Operator ini unik, seperti membuat pertanyaan.

Simbolnya menggunakan tanda tanya (`?`) dan titik-dua (`:`) untuk memisah jawabannya.

![alt text](/assets/img/operator/image-4.png)

Pada contoh di atas, “Kamu suka aku” adalah pertanyaan atau kondisi yang akan diperiksa.

Kalau jawabannya benar, maka `iya`. Sebaliknya akan `tidak`.

Lebih jelasnya, mari kita coba…

### Program dengan Operator Ternary

Buatlah sebuah kelas baru dengan nama OperatorTernary, kemudian ikuti kode berikut.

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

Hasil outputnya:

```java
iya
```

Sekarang coba ganti nilai variabel `suka` menjadi `false`, lalu dijalankan lagi.

Pasti akan menghasilkan `tidak`.

Cara lain, dapat juga membuat kondisi seperti ini:

```java
int suka = 8;

String jawaban = (suka > 5) ? "iya" : "tidak";
```

## Apa Selanjutnya?

Kita sudah mempelajari berbagai jenis operator dalam pemrograman Java.

Ya, operator memang sangat erat kaitannya dengan ilmu matematika. Maka dari itu, programmer dituntut untuk bisa matematika.

Selanjutnya, silakan pelajari **konsep percabangan atau control flow** dalam Java.
