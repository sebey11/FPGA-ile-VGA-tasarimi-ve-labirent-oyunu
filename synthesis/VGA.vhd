library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity VGA is
port(
CLOCK_24 : in std_logic_vector(1 downto 0);
VGA_HS,VGA_VS: out std_logic;
VGA_R,VGA_G,VGA_B: out std_logic_vector(3 downto 0)
);

end VGA;


architecture MAIN of VGA is 
signal VGACLK,RESET: std_logic:='0';
----------------------------------------


    component PLL is
        port (
            clk_in_clk  : in  std_logic := 'X'; -- clk
            reset_reset : in  std_logic := 'X'; -- reset
            clk_out_clk : out std_logic         -- clk
        );
    end component PLL;


----------------------------------------

component SYNC is
port(

CLK:  in std_logic;
HSYNC,VSYNC: out std_logic;
R,G,B: out std_logic_vector(3 downto 0)


);


end component SYNC;
begin

C1: SYNC PORT MAP (VGACLK,VGA_HS,VGA_VS,VGA_R,VGA_G,VGA_B);
C2: PLL PORT MAP (CLOCK_24(0),RESET,VGACLK);




end MAIN;