library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel is
 port (
    CLK100MHZ : in std_logic; 
    TRIG : out std_logic; 
    ECHO : in std_logic; 

    CA : out std_logic;
    CB : out std_logic;
    CC : out std_logic;
    CD : out std_logic;
    CE : out std_logic;
    CF : out std_logic;
    CG : out std_logic;
    DP : out std_logic;

    AN : out std_logic_vector(7 downto 0)
 );
end toplevel;

architecture Behavioral of toplevel is
    component clock_enable is
        generic (
            PERIOD : integer
        );
        port (
            clk   : in    std_logic; 
            rst   : in    std_logic; 
            pulse : out   std_logic  
        );
    end component;

    component simple_counter is
        port (
            clk   : in    std_logic;                          
            rst   : in    std_logic;                         
            en    : in    std_logic;                          
            count : out   std_logic_vector(20 downto 0);       
            stor : in      std_logic
        );
    end component;

    component bin2seg is 
        port (
            clear : in    std_logic;                    
            seg   : out   std_logic_vector(6 downto 0);  
            clk   : in    std_logic;                    
            pls_lngth : in std_logic_vector (20 downto 0); 
            AN    : out   std_logic_vector (2 downto 0)  
        );
    end component bin2seg;

    signal prev_echotimecount : std_logic_vector(20 downto 0); 
    signal sig_trig : std_logic; 

begin
    bin2seg0 : component bin2seg 
        port map (
            clear       => '0',
            seg(0)      => CG,
            seg(1)      => CF,
            seg(2)      => CE,
            seg(3)      => CD,
            seg(4)      => CC,
            seg(5)      => CB,
            seg(6)      => CA,
            clk         => CLK100MHZ,
            pls_lngth => prev_echotimecount, 
            AN(0)       => AN(0),
            AN(1)       => AN(1),
            AN(2)       => AN(2)
        );
   
    simple_counter0 : component simple_counter 
        port map (
            clk     => CLK100MHZ,
            rst     => sig_trig,
            en      => '1',
            count   => prev_echotimecount,
            stor   => ECHO
        );

    clock_enable0 : component clock_enable 
        generic map (
            PERIOD => 10000000
        )
        port map (
            clk      => CLK100MHZ,
            rst      => '0',
            pulse    => sig_trig
        );
        
    TRIG <= sig_trig;

    DP <= '1';
    AN (7 downto 3) <= (others => '1');
    
end Behavioral;
