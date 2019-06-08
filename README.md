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

- Görüntü: Görüntünün gösterildiği kısım.
-	Geri kayma:Piksel işaretcisinin tekrar yatay olarak sol tarafa geldiği alan. Video sinyali bu kısımda ekrana basılmaması gerekir.
-	Front porch (Geri kaydırma işleminden önceki) Ekranın sağ sınır alanı olarak tanımlanır. Video sinyali bu kısımda ekrana basılmaması gerekir.
-	Back porch(Geri kaydırma işleminden sonraki) Ekranın sol sınır alanı olarak tanımlanır. Video sinyali bu kısımda ekrana basılmaması gerekir.

![image](https://user-images.githubusercontent.com/45830441/59140654-4f095200-89a9-11e9-9c80-fa80181f8299.png)
## VGA Modları
Vga modları bilgisayarın çözünürlüklerine göre değişmektedir. 

![image](https://user-images.githubusercontent.com/45830441/59140661-5d576e00-89a9-11e9-908b-5c7e4eb8c0d2.png)
![image](https://user-images.githubusercontent.com/45830441/59140663-621c2200-89a9-11e9-981a-5e4f39c99dfc.png)

## Proje Aşamalası-1
Projede vga  modülünü aktifleştirmek için en gerekli olan BLANK  sinyali tanımlanmalıdır. 


![image](https://user-images.githubusercontent.com/45830441/59140709-ed95b300-89a9-11e9-9d15-f77a4b1a11d0.png)

Proje kapsamında 1280 x 1024 çözünürlüğü ve 60 Hz frekansı kullanılmıştır. PLL oluşturulurken piksel frekansı 108 MHz olarak ayarlanmalıdır.

![image](https://user-images.githubusercontent.com/45830441/59140723-22a20580-89aa-11e9-93a2-fc1a0aa908fb.png)

Çözünürlügü 1280 x 1024 piksel olan videonun senkronizasyonlarını sağlayabilmek için program içerisinde çeşitli sabitler tanımlanmalıdır.

![image](https://user-images.githubusercontent.com/45830441/59140726-27ff5000-89aa-11e9-9312-c990f51760b8.png)

Aşağıdaki şekilde olduğu gibi projede gerekli tanımlamalar yapılmıştr. 
![image](https://user-images.githubusercontent.com/45830441/59140729-2d5c9a80-89aa-11e9-8bb0-834ae5c134d2.png)


## Proje Aşamalası-2
2 kısım olarak öncelikle labirent tasarımı yapıldı  ve vhdl kodlar ile vga üzerinden
monitöre aktarılmıştır.

![image](https://user-images.githubusercontent.com/45830441/59140771-ddca9e80-89aa-11e9-97ea-0c0b96d6f2e1.png)

- Yazılımın fpga aktarılması ile ilk olarak kenar üzerinde sınırların çizilir.


1.Üst kenar ve alt kenar  üzerinde HPOS tüm ekran üzerinde tarama yapılır VPOS ise 0 ile 150 arasında  alt kenarda da  950  üzerinde tarama gerçekleştirip çizme işlemi yapar.

2.Sol kenar üzerinde 500 ve üzeri olmalıdır 500 altında ekran üzerinde herhangi bir çizim yapmamaktadır.

3.Sağ kenar üzerinde VPOS  üzerinde herhangi bir aralık belirlenmeyip sadece HPOS 1600 üzerinde aralık arası tarama işlemi ile çizim yapılır.  


![image](https://user-images.githubusercontent.com/45830441/59140776-f5098c00-89aa-11e9-9abd-8f6e5c679af6.png)

- Başlangıç ve bitiş çizgileri belirlenir.

![image](https://user-images.githubusercontent.com/45830441/59140777-f89d1300-89aa-11e9-886b-cf2786c9ce8d.png)

Aşağıdaki şekilde  de mavi renk olan bölgeler labirent dışında bulunan duvar görevi gören kenarlardır. Mor kısımlarda başlangıç ve bitiş noktalarıdır Aşağı, yukarı, sağ, sol olmak üzere 4 butonlarada hareketi gerçekleştirilerek bitiş noktasına götürülür.

![image](https://user-images.githubusercontent.com/45830441/59140778-fc309a00-89aa-11e9-8bb6-28456edaa708.png)

Kutu konumları  önceden tanımlanır. Kutumuz default olarak Başlangıç noktasında gösterilir.Aşağı, yukarı, sağ, sol olmak üzere 4 butonlarada hareketi gerçekleştirilerek bitiş noktasına götürülür

![image](https://user-images.githubusercontent.com/45830441/59140782-ff2b8a80-89aa-11e9-88ab-adce847751dc.png)

![image](https://user-images.githubusercontent.com/45830441/59140787-02bf1180-89ab-11e9-894e-5e2c75e80a76.png)

![image](https://user-images.githubusercontent.com/45830441/59140788-094d8900-89ab-11e9-9443-769c2c2bca56.png)

Aşağıdaki şekilde kutunun default olarak başlangıç konumda gelmektedir.
![image](https://user-images.githubusercontent.com/45830441/59140792-0c487980-89ab-11e9-8353-f1ac90a791d4.png)

Tasarlanan engeller çizilmiştir.

![image](https://user-images.githubusercontent.com/45830441/59140801-23876700-89ab-11e9-9a9c-296b6dfe6844.png)



![image](https://user-images.githubusercontent.com/45830441/59140795-123e5a80-89ab-11e9-8841-c43150903ed8.png)

![image](https://user-images.githubusercontent.com/45830441/59140797-14a0b480-89ab-11e9-94ef-efa3dbaea8b0.png)

![image](https://user-images.githubusercontent.com/45830441/59140799-1b2f2c00-89ab-11e9-9370-6d964b34cd6b.png)

![image](https://user-images.githubusercontent.com/45830441/59140800-1ff3e000-89ab-11e9-9b26-32a4a92e5a12.png)




- Buton  kontrolleri engelde durulması bir örnek  üzerinde anlatalım.

Örneğin E5 kolonunu kontrol edelim.

![image](https://user-images.githubusercontent.com/45830441/59140802-25e9c100-89ab-11e9-992b-5dd89eb31141.png)

Aşağı buton ve yukarı buton  kullanıldığı zaman  E5 kolonunun koordinatları üzerine kutunun gerekli noktaları geldiği zaman herhangi hareket etmemektedir. 
Buton hareketleri aşağıda anlatılmıştır.
-Aşağıdaki şekilde gösterildiği gibi hareket edilmesini istediğimiz  e5 kolonu kutunun aşağıda olması durumunda yukarı buton yardımıyla hareket ettirildiği zaman kontrol yapılması gereklidir.  Kolonun yukarı kısmında olması takdirde ise aşağı buton yardımıyla hareket ettirildiği zaman kontrol yapılması gereklidir.Aynı işlem sağ sol butonla aynı mantık ile kontrolü gerçekleştirilmelidir. 

![image](https://user-images.githubusercontent.com/45830441/59140803-297d4800-89ab-11e9-85f0-78109d531f45.png)

Yukarı durumda yapılması gereken kontrol, kutunun üst tarafı yani KareVPOS1 kısmı ile kolonun V2 aynı olduğu zaman ve kutunun  kolonun her kısmında geçmesini istemediğim için geniş skala olarak HPOS1 ve HPOS2 arası belirlenir. 
![image](https://user-images.githubusercontent.com/45830441/59140804-2c783880-89ab-11e9-855b-e3f333032c82.png)

Aynı işlemi aşağı buton için gerçekleştirilirken kutunun üst tarafta olma durumu için kutunun KareVPOS2 ‘ nin kolonun V1 koordinatı ile aynı olma durumuna bakılır.
![image](https://user-images.githubusercontent.com/45830441/59140806-300bbf80-89ab-11e9-99af-005969c1e15b.png)


- Buton Kontrolleri:

1.Yukarı buton

![image](https://user-images.githubusercontent.com/45830441/59140808-3306b000-89ab-11e9-9e4e-e894a1b37a60.png)

![image](https://user-images.githubusercontent.com/45830441/59140809-369a3700-89ab-11e9-82d3-d9799cfdadea.png)


2.Aşağı Buton


![image](https://user-images.githubusercontent.com/45830441/59140810-39952780-89ab-11e9-9cc0-3f853ee32661.png)ü



3.Sol Buton


![image](https://user-images.githubusercontent.com/45830441/59140811-3dc14500-89ab-11e9-903d-4ad759fe0c23.png)




4.Sağ Buton 

![image](https://user-images.githubusercontent.com/45830441/59140812-4154cc00-89ab-11e9-9a99-affcda3367ba.png)

## Proje Çıktıları
![image](https://user-images.githubusercontent.com/45830441/59140813-44e85300-89ab-11e9-83f5-7ade07d019b5.png)
![image](https://user-images.githubusercontent.com/45830441/59140815-49147080-89ab-11e9-82a2-bd0c8b6950da.png)

![image](https://user-images.githubusercontent.com/45830441/59140816-4d408e00-89ab-11e9-9e64-ba6f2d0e6294.png)
![image](https://user-images.githubusercontent.com/45830441/59140817-503b7e80-89ab-11e9-8ca4-4b69c6fe399b.png)

![image](https://user-images.githubusercontent.com/45830441/59140818-5598c900-89ab-11e9-9bc9-45ff1a18f2f4.png)

![image](https://user-images.githubusercontent.com/45830441/59140819-5893b980-89ab-11e9-91c9-81d296c45c92.png)
![image](https://user-images.githubusercontent.com/45830441/59140823-5b8eaa00-89ab-11e9-8a56-9cc6f1112b16.png)




