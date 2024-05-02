library ieee;
use ieee.std_logic_1164.all;

entity tb_toplevel is
end tb_toplevel;

architecture tb of tb_toplevel is

    component toplevel
        port (CLK100MHZ : in std_logic;
              TRIG      : out std_logic;
              ECHO      : in std_logic);
    end component;

    signal CLK100MHZ : std_logic;
    signal TRIG      : std_logic;
    signal ECHO      : std_logic;

    constant TbPeriod : time := 20 ns; 
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : toplevel
    port map (CLK100MHZ => CLK100MHZ,
              TRIG      => TRIG,
              ECHO      => ECHO);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    CLK100MHZ <= TbClock;

    stimuli : process
    begin
        wait for 100 ns;
        ECHO <= '0';
        wait for 50 ns;
        ECHO <= '1';
        wait for 50 ns;
        ECHO <= '0';

        wait for 1000000000 * TbPeriod;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;


configuration cfg_tb_toplevel of tb_toplevel is
    for tb
    end for;
end cfg_tb_toplevel;
