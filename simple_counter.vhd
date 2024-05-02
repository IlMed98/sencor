library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity simple_counter is
    port (
        clk   : in    std_logic;                          
        rst   : in    std_logic;                          
        en    : in    std_logic;                          
        count : out   std_logic_vector(20 downto 0);     
        stor : in    std_logic
    );
end entity simple_counter;

architecture behavioral of simple_counter is
    
    signal sig_count : integer range 0 to (2 ** 21 - 1) := 0;
    signal sig_prev_stor : std_logic := '0';
begin

    
    simple_counter : process (clk) is
    begin
        if rising_edge(clk) then
            
            if rst = '1' then
                sig_count <= 0;
            
            elsif en = '1' then
                
                if sig_count < (2 ** 21 - 1) then
                    sig_count <= sig_count + 1;
                end if;
                if stor = '1' and sig_prev_stor = '0' then 
                    sig_count <= 0;
                elsif stor = '0' and sig_prev_stor = '1' then 
                    
                    count <= std_logic_vector(to_unsigned(sig_count, 21));
                end if;
            end if;
            sig_prev_stor <= stor;
        end if;
    end process simple_counter;

end architecture behavioral;
