# FPGA-ile-VGA-tasarimi-ve-labirent-oyunu



## VGA(Video Graphics Array)
VGA, bir video standartı olup, 1980’de  IBM PC tarafından ilk kez dünyaya tanıştırılmıştır. VGA'de,  ekran piksellere (noktalara) ayrılır. Bu piksellere, Kırmızı, Mavi ve Yeşil renlerin oluşturduğu renk kombinasyonları  basılır. Bu sayede ekran üzerinde görüntü elde edilir.
Ekrana görüntü basma  işlemi tarama şeklinde olur. ilk piksel ekranın sol kısmına basılır ve piksel basma işlemi  ekranın sağ kısmına  doğru devam eder. Ekranda satır sonuna gelindiğinde ,  bir  alt satıra geçilir ve yukarıdaki satırdaki gibi pikseller soldan sağa doğru basılır. Aynı işlem Ekranın el alt kısmına gelinceye kadar tekrarlanır. Ekranın el alt kısmına gelindiğinde, tekrar ilk başlanılan noktaya geri dönülür. Ve aynı işlemler tekrarlanır.
VGA'de 2 adet  sinyal tipi vardır. 
Kontrol sinyalleri
Yatay senkronizasyon (Horizontal synchronization) ve Düşey senkronizasyon (Vertical synchronization) sinyallerindn oluşur. Dijital sinyallerdir.


-	Horizontal synchronization: Yatay konumda piksel işaretcisinin ekranın sol kısmına    geldiğinde, işaretleyici bir alt satıra geçmesini sağlayan kontroldür.

-	Verticak synchronization: Ekrana piksel basma olayı  bittikten sonra piksel işaretcisinin tekrar ilk başlanılan noktaya geri dönmesini sağlayan  kontroldür.

### Video sinyalleri
Red, Green ve Blue sinyallerinden oluşur.  0- 0,7 volt arasında değişen analog sinyallerdir. Her bir sinyaldeki farklı voltaj değeri o rengin farklı tonlarını ifade etmektedir.

Üç bit VGA renk kombinasyonu

![image](https://user-images.githubusercontent.com/45830441/59140624-018ce500-89a9-11e9-9d20-f02ab097797e.png)



## VGA senkronizasyonu
### Yatay senkronizasyon (Horizontal synchronization)



-•	Görüntü: Görüntünün gösterildiği kısım.
-•	Geri kayma:Piksel işaretcisinin tekrar yatay olarak sol tarafa geldiği alan. Video sinyali bu kısımda ekrana basılmaması gerekir.
-•	Front porch (Geri kaydırma işleminden önceki) Ekranın sağ sınır alanı olarak tanımlanır. Video sinyali bu kısımda ekrana basılmaması gerekir.
-•	Back porch(Geri kaydırma işleminden sonraki) Ekranın sol sınır alanı olarak tanımlanır. Video sinyali bu kısımda ekrana basılmaması gerekir.



![k_yukari](https://user-images.githubusercontent.com/45830441/59140611-d1454680-89a8-11e9-8359-52b104211fb0.JPG)
