library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Giriş çıkış tanımlamaları yapılır.
entity proje is
port(
CLOCK_24 : in std_logic_vector(1 downto 0);               --clock sinyali
VGA_HS,VGA_VS: out std_logic; 
vgaclock : out std_logic;   
vgablank : out std_logic;
vgasync : out std_logic;                         --Yatay dikey tarama için çıkış değerleri
VGA_R,VGA_G,VGA_B: out std_logic_vector(9 downto 0);    --10 kanallı RGB çıkışları
yukariButon: in std_logic;
asagiButon: in std_logic;
solButon: in std_logic;
sagButon: in std_logic
);
end proje;

--Yapılması istenen işlemler Architecture kısmında yapılır.
architecture MAIN of proje is 
signal VGACLK,RESET: std_logic:='0';

--QSYS ile oluşturulan PLL VGA'ya bileşen olarak eklenir.
		 component PLL is
			  port (
					clock_in_clk  : in  std_logic := 'X'; -- clk
					reset_reset   : in  std_logic := 'X'; -- reset
					clock_out_clk : out std_logic         -- clk
			  );
		 end component PLL;


--Oluşturlan SYNC dosyası bileşen olarak eklenir.
component SYNC is
port(
CLK:  in std_logic;
HSYNC,VSYNC: out std_logic;
R,G,B: out std_logic_vector(9 downto 0);
yukariButon: in std_logic;
asagiButon: in std_logic;
solButon: in std_logic;
sagButon: in std_logic
);
end component SYNC;


begin
--SYNC ve PLL'e değişkenleri gönderme.
C1: SYNC PORT MAP (VGACLK,VGA_HS,VGA_VS,VGA_R,VGA_G,VGA_B,yukariButon,asagiButon,solButon,sagButon);
C2: PLL PORT MAP (CLOCK_24(0),RESET,VGACLK);
vgaclock<=VGACLK;
vgablank<='1';
vgasync<='0';
end MAIN;