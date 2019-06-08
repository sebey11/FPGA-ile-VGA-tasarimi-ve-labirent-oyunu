library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Giriş çıkış tanımlamaları yapılır.
entity SYNC is
port(
CLK:  in std_logic;                          --clock sinyali
HSYNC,VSYNC: out std_logic;                  --Yatay dikey tarama için çıkış değerleri
R,G,B: out std_logic_vector(9 downto 0);      --10 kanallı RGB çıkışları
yukariButon: in std_logic;
asagiButon: in std_logic;
solButon: in std_logic;
sagButon: in std_logic
);
end SYNC;


--Yapılması istenen işlemler Architecture kısmında yapılır.
architecture MAIN of SYNC is
--horizantal timing (line)
CONSTANT H_va: integer:=1280;
CONSTANT H_fp: integer:=48;
CONSTANT H_sp: integer:=112;
CONSTANT H_bp: integer:=248;
CONSTANT H_wl: integer:= H_va + H_fp + H_sp +H_bp ;
--vertical timin (frame)
CONSTANT V_va: integer:=1024;
CONSTANT V_fp: integer:=1;
CONSTANT V_sp: integer:=3;
CONSTANT V_bp: integer:=38;
CONSTANT V_wl: integer:= V_va + V_fp + V_sp +V_bp ;

signal HPOS: integer range 0 to H_wl:=0;
signal VPOS: integer range 0 to V_wl:=0;

begin --Main
process(CLK)
Variable kareVPOS1 :integer:=180;
Variable kareVPOS2 :integer:=220;
Variable kareHPOS1 :integer:=1465;
Variable kareHPOS2 :integer:=1505;
begin

if(CLK'event  and CLK='1') then
	-- Ekrana renk paletlerinin çizdirilme işlemleri yapılıyor..
   if(VPOS >= 0 AND VPOS <= 150 )  then -- Üst kenara kırmızı renk paleti çizdiriliyor.
		 R<=(others=>'0');
		 G<=(others=>'1');
		 B<=(others=>'1');
	elsif(VPOS >= 950)  then -- Alt kenara koyu mavi renk paleti çizdiriliyor.
		 R<=(others=>'0');
		 G<=(others=>'1');
		 B<=(others=>'1');
	elsif(HPOS <= 500)  then -- Sol kenara açık mavi renk paleti çizdiriliyor.
		 R<=(others=>'0');
		 G<=(others=>'1');
		 B<=(others=>'1');
	elsif(HPOS >= 1600 )  then -- Sağ kenara yeşil renk paleti çizdiriliyor.
		 R<=(others=>'0');
		 G<=(others=>'1');
		 B<=(others=>'1');
		 
	elsif(VPOS >= kareVPOS1 and VPOS <= kareVPOS2 and HPOS >= kareHPOS1 and HPOS <= kareHPOS2)  then --KUTU
		 R<=(others=>'1');
		 G<=(others=>'0');
		 B<=(others=>'0');

	elsif(HPOS >=1450 and HPOS <=1530  and VPOS>=170 and VPOS<=180) then      --başlangıç noktası
       R<=(others=>'1');
		 G<=(others=>'0');
		 B<=(others=>'1');
	   

	elsif(HPOS >=850 and HPOS <=920 and VPOS>=940 and VPOS<=950) then      --bitiş noktası
       R<=(others=>'1');
		 G<=(others=>'0');
		 B<=(others=>'1');
		 
 
   elsif(HPOS >=1300 and HPOS <=1310 and VPOS>=160 and VPOS<=500) then      --e1
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 
   elsif(HPOS >=820 and HPOS <=1300 and VPOS>=320 and VPOS<=340) then      --e2
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 
    
	elsif(HPOS >=1300 and HPOS <=1440 and VPOS>=160 and VPOS<=180) then      --e3
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		  

  
  elsif(HPOS >=1580 and HPOS <=1600 and VPOS>=160 and VPOS<=950 ) then      --e4
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		  
   
	elsif(HPOS >=1100 and HPOS <=1590 and VPOS>=930 and VPOS<=950 ) then      --e5
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		  
   
	elsif(HPOS >=810 and HPOS <=820 and VPOS>=160 and VPOS<=500 ) then      --e6
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 
		 
	elsif(HPOS >=570 and HPOS <=810 and VPOS>=160 and VPOS<=180 ) then      --e7
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 	 
	elsif(HPOS >=550 and HPOS <=570 and VPOS>=160 and VPOS<=910 ) then      --e8
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 	 	  
 
	elsif(HPOS >=1500 and HPOS <1580 and VPOS>=600 and VPOS<=610 ) then      --e9
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 
		 
	elsif(HPOS >=1400 and HPOS <1410 and VPOS>=250 and VPOS<=540 ) then      --e10
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	 
		 
		 
		 
	elsif(HPOS >=1400 and HPOS <1480 and VPOS>=400 and VPOS<=410 ) then      --e11
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	 	 
		 
		 
		 
	 elsif(HPOS >=950 and HPOS <=1100 and VPOS>=450 and VPOS<=460) then      --e12
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	 
		 
		 
		 
  elsif(HPOS >=1025 and HPOS <=1035 and VPOS>=450 and VPOS<=590) then      --e13
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	
		

		
	elsif(HPOS >=1540 and HPOS <=1600  and VPOS>=160 and VPOS<=180) then      --başlangıç noktasının yanı e14
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
	   

  	elsif(HPOS >=1100 and HPOS <=1120 and VPOS>=800 and VPOS<=950 ) then      --alt kenar siyahlar  e15
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 
		 
		 
	elsif(HPOS >=960 and HPOS <=1100 and VPOS>=800 and VPOS<=820 ) then      --alt kenar siyahlar  e16
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	 
		 
		 
		 
	elsif(HPOS >=940 and HPOS <=960 and VPOS>=800 and VPOS<=950 ) then      --alt kenar siyahlar  e17
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	 	 
		 
		 
	elsif(HPOS >=550 and HPOS <=700 and VPOS>=900 and VPOS<=920 ) then      --slol alt çizgiler    e18
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	
		
	
   		 
	elsif(HPOS >=700 and HPOS <=720 and VPOS>=800 and VPOS<=920 ) then      --slol alt çizgiler   e19
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	
		
		
	
	elsif(HPOS >=720 and HPOS <=820 and VPOS>=800 and VPOS<=820 ) then      --slol alt çizgiler e20
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	
		
		
	

  elsif(HPOS >=800 and HPOS <=820 and VPOS>=800 and VPOS<=950 ) then      --slol alt çizgiler  e21
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');	

		 

  
  	elsif(HPOS >=690 and HPOS <=700 and VPOS>=350 and VPOS<=640 ) then      --sol iç taraf1   e22
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');

  

	
 	elsif(HPOS >=690 and HPOS <=820 and VPOS>=490 and VPOS<=500 ) then     --sol iç taraf2   e23
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');

		 
	elsif(HPOS >=1200 and HPOS <=1500 and VPOS>=800 and VPOS<=810 ) then      --e5 üstü sağ alt iç taraf e24
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 
		 
		 
	elsif(HPOS >=1300 and HPOS <=1310 and VPOS>=700 and VPOS<=810 ) then      --e5 üstü sağ alt iç taraf e25
       R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 	 
		 
  
	else	-- Diğer durumlarda rgb sinyalleri 0 atanıyor. Yani belirlenmeyen diğer koordinatların siyah renk olması sağlanıyor. 
	    R<=(others=>'0');
		 G<=(others=>'0');
		 B<=(others=>'0');
		 
		 
 if(HPOS>=500 and HPOS<=1600  and VPOS>=150  and VPOS<=950)then	 --arka planı beyaz yapma işlemidir.
		 R<=(others=>'1');
		 G<=(others=>'1');
		 B<=(others=>'1');		 
  end if;		 
  


  
	-- Karenin yukarı yönde hareketi	
	if yukariButon = '0' then
		if(VPOS >= kareVPOS1-1 and VPOS <= kareVPOS2-1 and HPOS >= kareHPOS1 and HPOS <= kareHPOS2)then 
	
	       R<=(others=>'1');
			 G<=(others=>'1');
			 B<=(others=>'1');
			 
			 kareVPOS1:=kareVPOS1-1;
			 kareVPOS2:=kareVPOS2-1;
		end if;

  if(kareVPOS1=870  and (kareHPOS1>=800 or kareHPOS2<=870)) then   ---yukarı çıkarkenki durumu

     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 

  end if;
  
 ---E2 kolonu için 
 if(kareVPOS1=500  and (kareHPOS1>=820 or kareHPOS2<=1300)) then   ---yukarı çıkarkenki durumu

     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 

  end if;
  
  
   ---E5 kolonu için 
 if(kareVPOS2=950  and (kareHPOS1>=1100 or kareHPOS2<=1590)) then   ---yukarı çıkarkenki durumu

     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 

  end if;
  
  
 ---E5 üst iç kolonu için 
 if(kareVPOS2=800  and (kareHPOS1>=1200 or kareHPOS2<=1500)) then   ---yukarı çıkarkenki durumu

     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 

  end if;
   
 ---yukarı çıkarkenki --başlangıç noktasının yanı kontrol
 
  if(kareVPOS1=180  and (kareHPOS1>=1540 or kareHPOS2<=1600)) then  

     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 

  end if; 
  
  end if;
  
	
	
	-- Karenin aşağı yönde hareketi
	if asagiButon = '0' then
		if(VPOS >= kareVPOS1+1 and VPOS <= kareVPOS2+1 and HPOS >= kareHPOS1 and HPOS <= kareHPOS2)  then 
			 R<=(others=>'1');
			 G<=(others=>'1');
			 B<=(others=>'1');
			 kareVPOS1:=kareVPOS1+1;
			 kareVPOS2:=kareVPOS2+1;
		end if;

		 
    if(kareVPOS2=800  and (kareHPOS1>=800 or kareHPOS2<=870)) then   ---yukarıdan aşağıya giderken durumu

     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 

  end if;
  
  
  if((kareVPOS2=940 or kareVPOS2=950 )  and (kareHPOS1>=1100 or kareHPOS2<=1590)) then   
     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 
		
  end if;
  
   
  if(kareVPOS2=600  and (kareHPOS1>=1500 or kareHPOS2<=1580)) then   ---e9 kontrolü için aşağı

     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 

  end if;
 end if;

	
	-- Karenin sol yönde hareketi
	if solButon = '0' then
		if(VPOS >= kareVPOS1 and VPOS <= kareVPOS2 and HPOS >= kareHPOS1-1 and HPOS <= kareHPOS2-1)  then
			 R<=(others=>'1');
			 G<=(others=>'1');
			 B<=(others=>'1');
			 kareHPOS1:=kareHPOS1-1;
			 kareHPOS2:=kareHPOS2-1;
		end if;
		
		 if((kareVPOS1>=800 or kareVPOS2<=870) and kareHPOS1=800 and kareHPOS2=800) then   ---soldan sağa giderken durumu

     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 
  end if;
end if;
	
	
	-- Karenin sağ yönde hareketi
	if sagButon = '0' then
		if(VPOS >= kareVPOS1 and VPOS <= kareVPOS2 and HPOS >= kareHPOS1+1 and HPOS <= kareHPOS2+1)  then 
			 R<=(others=>'1');
			 G<=(others=>'1');
			 B<=(others=>'1');
			 kareHPOS1:=kareHPOS1+1;
			 kareHPOS2:=kareHPOS2+1;
		end if;
	
	 if((kareVPOS1>=800 or kareVPOS2<=870) and kareHPOS2=870) then   ---sağdan sola giderken durumu

     if(VPOS >= kareVPOS1-10 and VPOS <= kareVPOS2+10 and HPOS >= kareHPOS1-10 and HPOS <= kareHPOS2+10)  then
			R<=(others=>'1');
			G<=(others=>'1');
			B<=(others=>'1'); 
		end if; 
  end if;
end if;

end if;


	
	-- VPoS ve HPos sinyallerine arttırma işlemi uygulanarak ekranın tarama yapması sağlanıyor...
	if(HPOS <H_wl) then
		 HPOS<=HPOS+1;  
		 else 
		 HPOS<=0;
	 
	if (VPOS <V_wl) then
		 VPOS<=VPOS+1;
		 else
		 VPOS<=0;
		 
	end if;
	end if;
	
	if((HPOS >0 and HPOS <(H_fp + H_sp +H_bp)) or (VPOS >0 and VPOS < (V_fp + V_sp +V_bp) ))  then
		R<=(others=> '0');
		G<=(others=> '0');
		B<=(others=> '0');
	end if;
		
		if(HPOS > H_fp and HPOS < (H_fp + H_sp)) then
		HSYNC<='0';
		else
		HSYNC<='1';
		end if;
		
		if(VPOS>0 and VPOS <(V_fp+V_sp))then
		 VSYNC<='0';
		else
		VSYNC<='1';
		end if;
		

end if;

end process;
end  MAIN;




	 
	 