**Téma projektu**: Inteligentní parkovací systém s ultrazvukovými senzory

Projekt: Návrh a implementace inteligentního parkovacího systému pomocí VHDL na desce Nexys A7 FPGA. Systém bude využívat několik ultrazvukových senzorů (HS-SR04) připojených ke konektorům Pmod pro detekci přítomnosti a vzdálenosti vozidel v rámci parkovacích míst. Vyvinout algoritmy pro analýzu dat ze snímačů a určení dostupnosti parkovacích míst. Vizualizovat stav obsazenosti parkovacího místa pomocí LED diod a zároveň zobrazovat naměřené vzdálenosti na 7segmentovém displeji.
 

**Členové týmu:**
- Illia Medynskyi - odpovědnost za simple_counter, github a prezentace
- Gleb Dulesov - odpovědnost za clock_enable, bin2seg
- Anton Patneleev - odpovědnost za toplevel, tb_toplevel

  
**Popis hardwarového vybavení:**

Použili jsme následující vybavení:

1. Nexys A7 50T FPGA Board: 
Nexys A7 je vývojová deska navržená pro vývojáře a studenty, kteří pracují s programovatelnými hradlovými poli (FPGAs). Tato deska je vybavena FPGA čipem z řady Artix-7 od společnosti Xilinx a poskytuje širokou škálu funkcí a konektorů pro vývoj a testování různých projektů v oblasti digitálního návrhu. 
![image](https://github.com/IlMed98/sencor/assets/167453979/98253584-1897-42ec-8fcf-98466b05279e)

2.HC-SR04 Ultrasonic Sensor: ultrazvukový senzor který obsahuje dva hlavní komponenty: vysílací ultrazvukový modul a přijímací ultrazvukový modul. Vysílací modul vysílá krátké ultrazvukové pulsy a přijímací modul detekuje odražené signály.
![image](https://github.com/IlMed98/sencor/assets/167453979/2149a996-63ee-4e9f-9f96-ad85f94cd47c)

**Popis softwaru:**
Pomocí jazyka VHDL jsme napsali následující části projektu:

simple_counter – tento kód implementuje jednoduchý čítač s možností resetování a ukládání hodnoty čítače v závislosti na externích signálech clock (clk), reset (rst), count enable (en) a store (stor).
clock_enable - tento kód implementuje zařízení pro řízení hodinového signálu. Generuje pulzní signál, který má v první polovině periody hodin hodnotu "1" a v druhé polovině "0".
bin2seg - tento kód provádí převod číselné hodnoty ve formátu binárního řetězce na výstupní signály pro sedmisegmentový displej a řídí multiplexor tak, aby vybral příslušný výstup displeje v závislosti na aktuální hodnotě.
toplevel - tento kód je popisem nejvyšší úrovně pro ovládání ultrazvukového snímače a sedmisegmentového displeje v jazyce VHDL.
tb_toplevel - tento testovací program generuje hodinový signál CLK100MHZ a sekvenci signálů ECHO pro toplevelový modul a po provedení testovacích signálů ukončí simulaci.

**Schema:**
![image](https://github.com/IlMed98/sencor/assets/167453979/b2267b3b-36cc-419d-b223-ceb20c3bd076)

