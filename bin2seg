library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity bin2seg is
    port (
        clear       : in    std_logic;                    
        seg         : out   std_logic_vector(6 downto 0); 
        clk         : in    std_logic;                    
        pls_lngth : in    std_logic_vector (20 downto 0); 
        AN          : out   std_logic_vector (2 downto 0) 
    );
end entity bin2seg;

architecture behavioral of bin2seg is
    signal distance : integer := 0;
    signal counter : integer := 0;
    signal sig_AN : std_logic_vector(2 downto 0) := "110";
    signal bin : std_logic_vector(3 downto 0);
begin
  
    distance <= to_integer(unsigned(pls_lngth)) / (2915 * 2);   
   
    process (clk)
    begin
        if rising_edge(clk) then
            counter <= counter + 1; 

            if counter = 2000 then 
                counter <= 0;
                if sig_AN = "110" then 
                    sig_AN <= "101"; 
                    bin <= std_logic_vector(to_unsigned(distance/10 - (distance/100)*10 , 4));
                elsif sig_AN = "101" then 
                    sig_AN <= "011"; 
                    bin <= std_logic_vector(to_unsigned(distance/100, 4));
                elsif sig_AN = "011" then 
                    sig_AN <= "110"; 
                    bin <= std_logic_vector(to_unsigned(distance mod 10, 4));
                end if;

                if distance > 200 then
                    bin <= "0000"; 
                end if;
            end if;
        end if;
        
        AN <= sig_AN;
    end process;

    p_7seg_decoder : process (bin, clear) is
    begin

        if (clear = '1') then
            seg <= "1111111"; 
        else
            case bin is
                when x"0" =>
                    seg <= "0000001";

                when x"1" =>
                    seg <= "1001111";

                when x"2" =>
                    seg <= "0010010";

                when x"3" =>
                    seg <= "0000110";

                when x"4" =>
                    seg <= "1001100";

                when x"5" =>
                    seg <= "0100100";

                when x"6" =>
                    seg <= "0100000";

                when x"7" =>
                    seg <= "0001111";

                when x"8" =>
                    seg <= "0000000";

                when x"9" =>
                    seg <= "0000100";

                when x"A" =>
                    seg <= "0001000";

                when x"b" =>
                    seg <= "1100000";

                when x"C" =>
                    seg <= "0110001";

                when x"d" =>
                    seg <= "1000010";

                when x"E" =>
                    seg <= "0110000";

                when others =>
                    seg <= "0111000";
            end case;
        end if;

    end process p_7seg_decoder;

end architecture behavioral;
