# Praktikum Probstat 2022 Modul 2 - Estimasi Parameter, Uji Hipotesis dan Anova
Made Rianja Richo Dainino <br />
5025201236 <br />
Probstat A

![](/img/1.jpg)
### 1. Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴. Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.
#### 1a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas!
```R
selisih = y-x
sdev <- sd(selisih)
sdev
```
![](/img/1a.jpg)

#### 1b. Carilah nilai t (p-value)!
```R
t.test(x, y, paired=TRUE)
```
![](/img/1b.jpg)

#### 1c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0: “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴”!
```R
t.test(x, y, mu=0, var.equal=TRUE)
```
![](/img/1c.jpg)

### 2. Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).
#### 2a. Apakah Anda setuju dengan klaim tersebut?
Setuju

#### 2b. Jelaskan maksud dari output yang dihasilkan!
```R
tsum.test(
  mean.x=23500,
  s.x=3900,
  n.x=100,
  mu=20000,
  alternative="greater",
  var.equal=TRUE
)
```
![](/img/2b.jpg)

#### 2c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
Kesimpulan yang didapatkan adalah rata-rata mobil lebih dari 20000 km/tahun

![](/img/3.jpg)
### 3. Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut. Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah:
#### 3a. H0 dan H1
H0: "Tidak ada perbedaan rata - rata antara Bandung dan Bali"
H1: "Ada perbedaan rata - rata antara Bandung dan Bali"

#### 3b. Hitung Sampel Statistik
```R
tsum.test(
  n.x = bandung$saham,
  n.y = bali$saham,
  mean.x = bandung$mean,
  mean.y = bali$mean,
  s.x = bandung$sd,
  s.y = bali$sd,
  var.equal = TRUE,
  alternative = "two.sided",
)
```
![](/img/3b.jpg)


#### 3c. Lakukan Uji Statistik (df =2)
```R
qt(p = 0.05, df = 2, lower.tail = FALSE)
```
![](/img/3c.jpg)

#### 3d. Nilai Kritikal
H0 diterima

#### 3e. Keputusan
Tidak ada perbedaan rata-rata antara Bandung dan Bali

#### 3f. Kesimpulan
Tidak ada perbedaan rata-rata antara Bandung dan Bali

### 4. Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. Jika: diketahui dataset https://intip.in/datasetprobstat1 dan H0: Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama. Maka Kerjakan atau Carilah:
#### 4a. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
```R
hist(group1$Length, xlim = c(16, 20))
hist(group2$Length, xlim = c(16, 20))
hist(group3$Length, xlim = c(16, 20))
```
![](/img/4a-1.jpg)
![](/img/4a-2.jpg)
![](/img/4a-3.jpg)


#### 4b. Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil?
```R
bartlett.test(nomor4$Length, nomor4$Group)
```
![](/img/4b.jpg)

#### 4c. Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.
```R
model1 <- lm(nomor4$Length~nomor4$Group)
summary(model1)
```
![](/img/4c.jpg)

#### 4d. Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?
H0 diterima karena p-value bernilai 0.6401

#### 4e. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain?
```R
av <- aov(Length ~ factor(Group), data = nomor4)
TukeyHSD(av)
```
![](/img/4e.jpg)

#### 4f. Visualisasikan data dengan ggplot2
```R
ggplot(nomor4, mapping = aes(x = Group, y = Length, group = 1)) +  geom_boxplot()
```
![](/img/4f.jpg)

### 5. Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:
#### 5a. Buatlah plot sederhana untuk visualisasi data!

#### 5b. Lakukan uji ANOVA dua arah!

#### 5c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)!

#### 5d. Lakukan uji Tukey!

#### 5e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey!
