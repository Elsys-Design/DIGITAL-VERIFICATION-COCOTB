-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2014.2 
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Output Fixed or Variable Delay Element
-- /___/   /\      Filename    : ODELAYE3.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL ODELAYE3 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;

library STD;
use STD.TEXTIO.all;
use IEEE.Std_Logic_TextIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity ODELAYE3 is
  generic (
    CASCADE : string := "NONE";
    DELAY_FORMAT : string := "TIME";
    DELAY_TYPE : string := "FIXED";
    DELAY_VALUE : integer := 0;
    IS_CLK_INVERTED : bit := '0';
    IS_RST_INVERTED : bit := '0';
    REFCLK_FREQUENCY : real := 300.0;
    SIM_DEVICE : string := "ULTRASCALE";
    SIM_VERSION : real := 2.0;
    UPDATE_MODE : string := "ASYNC"
  );

  port (
    CASC_OUT             : out std_ulogic;
    CNTVALUEOUT          : out std_logic_vector(8 downto 0);
    DATAOUT              : out std_ulogic;
    CASC_IN              : in std_ulogic;
    CASC_RETURN          : in std_ulogic;
    CE                   : in std_ulogic;
    CLK                  : in std_ulogic;
    CNTVALUEIN           : in std_logic_vector(8 downto 0);
    EN_VTC               : in std_ulogic;
    INC                  : in std_ulogic;
    LOAD                 : in std_ulogic;
    ODATAIN              : in std_ulogic;
    RST                  : in std_ulogic    
  );
end ODELAYE3;

architecture ODELAYE3_V of ODELAYE3 is
  
  constant MODULE_NAME : string := "ODELAYE3";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;
  constant MAX_DELAY_COUNT  : integer := 511;
  constant MIN_DELAY_COUNT  : integer := 0;


-- Parameter encodings and registers
  constant CASCADE_MASTER : std_logic_vector(1 downto 0) := "01";
  constant CASCADE_NONE : std_logic_vector(1 downto 0) := "00";
  constant CASCADE_SLAVE_END : std_logic_vector(1 downto 0) := "10";
  constant CASCADE_SLAVE_MIDDLE : std_logic_vector(1 downto 0) := "11";
  constant DELAY_FORMAT_COUNT : std_ulogic := '1';
  constant DELAY_FORMAT_TIME : std_ulogic := '0';
  constant DELAY_TYPE_FIXED : std_logic_vector(1 downto 0) := "00";
  constant DELAY_TYPE_VARIABLE : std_logic_vector(1 downto 0) := "01";
  constant DELAY_TYPE_VAR_LOAD : std_logic_vector(1 downto 0) := "10";
  constant UPDATE_MODE_ASYNC : std_logic_vector(1 downto 0) := "00";
  constant UPDATE_MODE_MANUAL : std_logic_vector(1 downto 0) := "01";
  constant UPDATE_MODE_SYNC : std_logic_vector(1 downto 0) := "10";

  signal PER_BIT_FINE_DELAY : integer := 5 ;
  signal PER_BIT_MEDIUM_DELAY   : integer := 40;
  signal INTRINSIC_FINE_DELAY   : time := 75 ps;
  signal INTRINSIC_MEDIUM_DELAY : time := 40 ps;
  signal ODATAIN_INTRINSIC_DELAY : time := 60 ps;
  signal CASC_IN_INTRINSIC_DELAY : time := 60 ps;
  signal CASC_RET_INTRINSIC_DELAY  : time := 60 ps;
  signal DATA_OUT_INTRINSIC_DELAY : time := 25 ps;
  signal CASC_OUT_INTRINSIC_DELAY : time := 80 ps;
  signal CASCADE_BIN : std_logic_vector(1 downto 0);
  signal DELAY_FORMAT_BIN : std_ulogic;
  signal DELAY_TYPE_BIN : std_logic_vector(1 downto 0);
  signal DELAY_VALUE_BIN : std_logic_vector(10 downto 0);
  signal IS_CLK_INVERTED_BIN : std_ulogic;
  signal IS_RST_INVERTED_BIN : std_ulogic;
  signal UPDATE_MODE_BIN : std_logic_vector(1 downto 0);

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  signal trig_attr     : std_ulogic := '0';
  
  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed

  signal CASC_OUT_out : std_ulogic;
  signal CNTVALUEOUT_out : std_logic_vector(8 downto 0);
  signal DATAOUT_out : std_ulogic;
  
  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal CASC_IN_in : std_ulogic;
  signal CASC_RETURN_in : std_ulogic;
  signal CE_in : std_ulogic;
  signal CLK_in : std_ulogic;
  signal CNTVALUEIN_in : std_logic_vector(8 downto 0);
  signal EN_VTC_in : std_ulogic;
  signal INC_in : std_ulogic;
  signal LOAD_in : std_ulogic;
  signal ODATAIN_in : std_ulogic;
  signal RST_in : std_ulogic;
 
------------------------------------------------
-- function ODELAYE3_DelayCount
------------------------------------------------

   function ODELAYE3_DelayCount(
                   DelayType  : in string;
                   DelayValue : in integer;
                   CounterVal : in  std_logic_vector(8 downto 0)
   ) return integer is

  begin
       if((DelayType = "FIXED") OR (DelayType = "VARIABLE")) then  
           return integer(real(DelayValue)/5.0);
       elsif(DelayType = "VAR_LOAD") then
           return SLV_TO_INT(CounterVal); 
       else return 0;
       end if;
  end;   
------------------------------------------------
-- function ODELAYE3_InitDelayCount
------------------------------------------------

   function ODELAYE3_InitDelayCount(
                   DelayFormat  : in string;
                   DelayValue : in integer;
                   FineDelay: in integer
   ) return integer is

  begin
    if(DelayFormat = "TIME") then 
      return integer(real(DelayValue)/real(FineDelay));
    else return integer(DelayValue);
    end if;
  end;     

-------------- variable declaration -------------------------
    signal  idelay_count_pre       : integer := 0;
    signal  idelay_count_sync      : integer := 0;
    signal  idelay_count_async     : integer := 0;
    signal  cntvalue_updated       : real    := 0.0;
    signal  cntvalue_updated_sync  : real    := 0.0;
    signal  cntvalue_updated_async : real    := 0.0;
    signal  CNTVALUEIN_INTEGER     : integer := 0;
    signal  cntvalueout_pre    : std_logic_vector(8 downto 0);
    signal  tap_out        : std_ulogic := 'X';
    signal  cdataout_pre           : std_ulogic := 'X';
    signal  tap_out_casc_out_none          : std_ulogic := 'X';
    signal  tap_out_casc_out           : std_ulogic := 'X';
    signal  tap_out_data_out           : std_ulogic := 'X';

    signal  data_mux    : std_ulogic := 'X';
    signal  data_mux_sync1  : std_ulogic := 'X';
    signal  data_mux_sync2  : std_ulogic := 'X';
    signal  data_mux_sync3  : std_ulogic := 'X';
    signal  data_mux_sync4  : std_ulogic := 'X';
    signal  data_mux_sync   : std_ulogic := 'X';
    signal      clk_smux        : std_ulogic := 'X';
    signal      RST_sync1        : std_ulogic := 'X'; 
    signal      RST_sync2        : std_ulogic := 'X'; 
    signal      RST_sync3        : std_ulogic := 'X'; 
  
  -- start behavioral body
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
--  CASC_OUT <= CASC_OUT_out after OUT_DELAY;
--  CNTVALUEOUT <= CNTVALUEOUT_out after OUT_DELAY;
--  DATAOUT <= DATAOUT_out after OUT_DELAY;
  
  CASC_IN_in <= CASC_IN;
  CASC_RETURN_in <= CASC_RETURN;
  CE_in <= CE;
  CLK_in <= CLK xor IS_CLK_INVERTED_BIN;
  CNTVALUEIN_in(0) <= '1' when (CNTVALUEIN(0) = 'Z') else CNTVALUEIN(0); -- rv 1
  CNTVALUEIN_in(1) <= '1' when (CNTVALUEIN(1) = 'Z') else CNTVALUEIN(1); -- rv 1
  CNTVALUEIN_in(2) <= '1' when (CNTVALUEIN(2) = 'Z') else CNTVALUEIN(2); -- rv 1
  CNTVALUEIN_in(3) <= '1' when (CNTVALUEIN(3) = 'Z') else CNTVALUEIN(3); -- rv 1
  CNTVALUEIN_in(4) <= '1' when (CNTVALUEIN(4) = 'Z') else CNTVALUEIN(4); -- rv 1
  CNTVALUEIN_in(5) <= '1' when (CNTVALUEIN(5) = 'Z') else CNTVALUEIN(5); -- rv 1
  CNTVALUEIN_in(6) <= '1' when (CNTVALUEIN(6) = 'Z') else CNTVALUEIN(6); -- rv 1
  CNTVALUEIN_in(7) <= '1' when (CNTVALUEIN(7) = 'Z') else CNTVALUEIN(7); -- rv 1
  CNTVALUEIN_in(8) <= '1' when (CNTVALUEIN(8) = 'Z') else CNTVALUEIN(8); -- rv 1
  EN_VTC_in <= EN_VTC;
  INC_in <= INC;
  LOAD_in <= LOAD;
  ODATAIN_in <= ODATAIN;
  RST_in <= RST xor IS_RST_INVERTED_BIN;
  
  CASCADE_BIN <= 
    CASCADE_NONE when (CASCADE = "NONE") else
    CASCADE_MASTER when (CASCADE = "MASTER") else
    CASCADE_SLAVE_END when (CASCADE = "SLAVE_END") else
    CASCADE_SLAVE_MIDDLE when (CASCADE = "SLAVE_MIDDLE") else
    CASCADE_NONE;

  DELAY_FORMAT_BIN <= 
    DELAY_FORMAT_TIME when (DELAY_FORMAT = "TIME") else
    DELAY_FORMAT_COUNT when (DELAY_FORMAT = "COUNT") else
    DELAY_FORMAT_TIME;

  DELAY_TYPE_BIN <= 
    DELAY_TYPE_FIXED when (DELAY_TYPE = "FIXED") else
    DELAY_TYPE_VARIABLE when (DELAY_TYPE = "VARIABLE") else
    DELAY_TYPE_VAR_LOAD when (DELAY_TYPE = "VAR_LOAD") else
    DELAY_TYPE_FIXED;

  DELAY_VALUE_BIN <= std_logic_vector(to_unsigned(DELAY_VALUE,11));

  IS_CLK_INVERTED_BIN <= TO_X01(IS_CLK_INVERTED);
  IS_RST_INVERTED_BIN <= TO_X01(IS_RST_INVERTED);
  UPDATE_MODE_BIN <= 
    UPDATE_MODE_ASYNC when (UPDATE_MODE = "ASYNC") else
    UPDATE_MODE_MANUAL when (UPDATE_MODE = "MANUAL") else
    UPDATE_MODE_SYNC when (UPDATE_MODE = "SYNC") else
    UPDATE_MODE_ASYNC;

  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin

  if (SIM_DEVICE = "ULTRASCALE") then
        PER_BIT_FINE_DELAY <= 5;
        PER_BIT_MEDIUM_DELAY <= 40;
        INTRINSIC_FINE_DELAY <= 75 ps;
        INTRINSIC_MEDIUM_DELAY <= 40 ps;
        ODATAIN_INTRINSIC_DELAY <= 60 ps;
        CASC_IN_INTRINSIC_DELAY <= 60 ps;
        CASC_RET_INTRINSIC_DELAY <= 60 ps;

        DATA_OUT_INTRINSIC_DELAY <= 25 ps;
        CASC_OUT_INTRINSIC_DELAY <= 80 ps;
  else
        PER_BIT_FINE_DELAY <= 4;
        PER_BIT_MEDIUM_DELAY <= 32;
        INTRINSIC_FINE_DELAY <= 60 ps;
        INTRINSIC_MEDIUM_DELAY <= 32 ps;
        ODATAIN_INTRINSIC_DELAY <= 32 ps;
        CASC_IN_INTRINSIC_DELAY <= 32 ps;
        CASC_RET_INTRINSIC_DELAY <= 32 ps;
        DATA_OUT_INTRINSIC_DELAY <= 20 ps;
        CASC_OUT_INTRINSIC_DELAY <= 45 ps;
  end if;
      -------- CASCADE check
  if((xil_attr_test) or
     ((CASCADE /= "NONE") and 
      (CASCADE /= "MASTER") and 
      (CASCADE /= "SLAVE_END") and 
      (CASCADE /= "SLAVE_MIDDLE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-101] CASCADE attribute is set to """));
    Write ( Message, string'(CASCADE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""NONE"", "));
    Write ( Message, string'("""MASTER"", "));
    Write ( Message, string'("""SLAVE_END"" or "));
    Write ( Message, string'("""SLAVE_MIDDLE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- DELAY_FORMAT check
  if((xil_attr_test) or
     ((DELAY_FORMAT /= "TIME") and 
      (DELAY_FORMAT /= "COUNT"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-102] DELAY_FORMAT attribute is set to """));
    Write ( Message, string'(DELAY_FORMAT));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TIME"" or "));
    Write ( Message, string'("""COUNT"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- DELAY_TYPE check
  if((xil_attr_test) or
     ((DELAY_TYPE /= "FIXED") and 
      (DELAY_TYPE /= "VARIABLE") and 
      (DELAY_TYPE /= "VAR_LOAD"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-103] DELAY_TYPE attribute is set to """));
    Write ( Message, string'(DELAY_TYPE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""FIXED"", "));
    Write ( Message, string'("""VARIABLE"" or "));
    Write ( Message, string'("""VAR_LOAD"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- DELAY_VALUE check
    if (SIM_DEVICE = "ULTRASCALE" and ((DELAY_VALUE < 0) or (DELAY_VALUE > 1250))) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-104] DELAY_VALUE attribute is set to "));
      Write ( Message, DELAY_VALUE);
      Write ( Message, string'(". Legal values for this attribute are 0 to 1250. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    if (SIM_DEVICE /= "ULTRASCALE" and ((DELAY_VALUE < 0) or (DELAY_VALUE > 1100))) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-104] DELAY_VALUE attribute is set to "));
      Write ( Message, DELAY_VALUE);
      Write ( Message, string'(". Legal values for this attribute are 0 to 1100. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    
    -------- REFCLK_FREQUENCY check
    if (SIM_DEVICE /= "ULTRASCALE" and ((REFCLK_FREQUENCY < 300.0) or (REFCLK_FREQUENCY > 2667.0))) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-107] REFCLK_FREQUENCY attribute is set to "));
      Write ( Message, REFCLK_FREQUENCY);
      Write ( Message, string'(". Legal values for this attribute are 300.0 to 2667.0. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    if (SIM_DEVICE = "ULTRASCALE" and ((REFCLK_FREQUENCY < 200.0) or (REFCLK_FREQUENCY > 2400.0))) then
      attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-107] REFCLK_FREQUENCY attribute is set to "));
      Write ( Message, REFCLK_FREQUENCY);
      Write ( Message, string'(". Legal values for this attribute are 200.0 to 2400.0. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
      writeline(output, Message);
      DEALLOCATE (Message);
    end if;
    
   -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE") and
          (SIM_DEVICE /= "ULTRASCALE_PLUS") and
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-109] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"" or "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    
    -------- SIM_VERSION check
  if((xil_attr_test) or
     ((SIM_VERSION /= 2.0) and 
      (SIM_VERSION /= 1.0))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-108] SIM_VERSION attribute is set to "));
    Write ( Message, SIM_VERSION);
    Write ( Message, string'(". Legal values for this attribute are "));
    Write ( Message, string'("2.0 or "));
    Write ( Message, string'("1.0. "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    -------- UPDATE_MODE check
  if((xil_attr_test) or
     ((UPDATE_MODE /= "ASYNC") and 
      (UPDATE_MODE /= "MANUAL") and 
      (UPDATE_MODE /= "SYNC"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-109] UPDATE_MODE attribute is set to """));
    Write ( Message, string'(UPDATE_MODE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""ASYNC"", "));
    Write ( Message, string'("""MANUAL"" or "));
    Write ( Message, string'("""SYNC"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-110] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
      assert FALSE report Message.all severity error;
    end if;
    wait;
  end process INIPROC;

  trig_attr <= '1' after 1 ps;
  
  DELAY_CALC : process
  begin
    wait until rising_edge(trig_attr);
    ------ delay value initial calculation declaration -------------------------
    idelay_count_pre       <= ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY);
    idelay_count_sync      <= ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY);
    --idelay_count_async     <= ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY);
    --cntvalue_updated       <= real(ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY));
    --cntvalue_updated_sync  <= real(ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY));
    --cntvalue_updated_async <= real(ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY));
  end process DELAY_CALC;
    
 prcs_rst:process(RST_in)
  variable Message : line;
  begin
    if ((RST_in = '1') and (DELAY_FORMAT = "TIME")) then
      DEALLOCATE (Message);
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-1] Ultrascale IDELAYCTRL and I/ODELAYE3, RST simulation behaviour may not match hardware behaviour when DELAY_FORMAT = TIME, if SelectIO User Guide recommendation for I/ODELAY connections or reset sequence are not followed. For more information, refer to the Select IO Userguide."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
      assert FALSE report Message.all severity Warning;
      DEALLOCATE (Message);
    end if;
  end process prcs_rst;

   
--####################################################################
--#####                       cntvalueout                        #####
--####################################################################
  prcs_cntvalueout:process(idelay_count_sync, idelay_count_async,cntvalue_updated_sync,cntvalue_updated_async)
  begin
    if(UPDATE_MODE = "SYNC") then
      cntvalueout_pre  <= CONV_STD_LOGIC_VECTOR(idelay_count_sync, 9);
      cntvalue_updated <= real(idelay_count_sync);
    else
      cntvalueout_pre  <= CONV_STD_LOGIC_VECTOR(idelay_count_sync, 9);
      cntvalue_updated <= real(idelay_count_sync);
    end if;
  end process prcs_cntvalueout;

--####################################################################
--#####                       clk_smux                        #####
--####################################################################  
  prcs_clk_smux: process(CLK_in,RST_in, RST_sync1, RST_sync2, RST_sync3)
  begin
      if(RST_in = '1' or RST_sync1 = '1' or RST_sync2 = '1' or RST_sync3 = '1') then
          clk_smux <= '0';
      elsif(RST_sync3 = '0') then
              clk_smux <= CLK_in;
      end if;
  end process prcs_clk_smux;
--####################################################################
--#####                       RST_sync                        #####
--####################################################################  
  prcs_RST_sync: process(CLK_in)
  begin
      if(rising_edge(CLK_in)) then
          RST_sync1 <= RST_in;
          RST_sync2 <= RST_sync1;
          RST_sync3 <= RST_sync2;
      end if;
  end process prcs_RST_sync;
  prcs_data_sync: process(data_mux)
  begin
         data_mux_sync1 <= data_mux;
         data_mux_sync2 <= data_mux_sync1;
         data_mux_sync3 <= data_mux_sync2;
         data_mux_sync4 <= data_mux_sync3;
         data_mux_sync  <= data_mux_sync4;
  end process prcs_data_sync;
--####################################################################
--#####                  CALCULATE iDelay                        #####
--####################################################################
  prcs_calc_idelay:process(CLK_in,clk_smux, glblGSR, RST_in,RST_sync1,RST_sync2, RST_sync3)
  variable idelay_count_var : integer := ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY);
  variable FIRST_TIME   : boolean :=true;
  variable BaseTime_var : time    := 1 ps ;
  variable bcat : std_logic_vector(2 downto 0);
  variable  Message : line;
  begin
-- CR 595286
    bcat := LOAD_in & CE_in & INC_in;      
    if((glblGSR = '1') or (FIRST_TIME) or (RST_in = '1'))then
      idelay_count_async <= ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY);
      idelay_count_var   := ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY);
      FIRST_TIME         := false;
      cntvalue_updated_async <= real(ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY));
    elsif(glblGSR = '0') then
      if (RST_in = '1' or RST_sync1 = '1' or RST_sync2 = '1' or RST_sync3 = '1') then
        idelay_count_async <= ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY);
        idelay_count_var   := ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY);
        cntvalue_updated_async <= real(ODELAYE3_InitDelayCount(DELAY_FORMAT,DELAY_VALUE,PER_BIT_FINE_DELAY));
      elsif(RST_sync3 = '0') then
        if(rising_edge(clk_smux)) then
          case DELAY_TYPE_BIN is
            when "00" => null; 
            when "10" =>
              if (EN_VTC_in = '0') then
                case bcat is
                  when "000" => null;
                  when "001" => null;
                  when "010" =>
                    if (idelay_count_var > MIN_DELAY_COUNT) then
                      idelay_count_var := idelay_count_var - 1;
                    elsif (idelay_count_var = MIN_DELAY_COUNT) then
                      idelay_count_var := MAX_DELAY_COUNT;
                    end if;
                    if(UPDATE_MODE /= "MANUAL") then
                      cntvalue_updated_async <= real(idelay_count_var);
                    end if;   
                  when "011" =>
                    if (idelay_count_var < MAX_DELAY_COUNT) then
                     idelay_count_var := idelay_count_var + 1;
                    elsif (idelay_count_var = MAX_DELAY_COUNT) then
                      idelay_count_var := MIN_DELAY_COUNT;
                    end if;
                    if(UPDATE_MODE /= "MANUAL") then
                      cntvalue_updated_async <= real(idelay_count_var);
                    end if;
                  when "100"|"101" =>
                    idelay_count_var := SLV_TO_INT(CNTVALUEIN_in);
                    if (UPDATE_MODE /= "MANUAL") then
                      cntvalue_updated_async <= real(idelay_count_var);
                    end if;
                  when "110" =>
                    if (UPDATE_MODE /= "MANUAL") then
                      DEALLOCATE (Message);
                      Write ( Message, string'("[Unisim "));
                      Write ( Message, string'(MODULE_NAME));
                      Write ( Message, string'("-2] Invalid scenario. LOAD = 1, CE = 1 INC = 0 is valid only for UPDATE_MODE = MANUAL and DELAY_TYPE = VAR_LOAD. "));
                      Write ( Message, string'("Instance "));
                      Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
                      assert FALSE  report Message.all  severity Warning;
                      DEALLOCATE (Message);
                    else
                      cntvalue_updated_async <= real(idelay_count_var);
                    end if;
                      when "111" =>
                        if (UPDATE_MODE /= "MANUAL") then
                          Write ( Message, string'("[Unisim "));
                          Write ( Message, string'(MODULE_NAME));
                          Write ( Message, string'("-3] Invalid scenario. LOAD = 1, CE = 1 INC = 1 is valid only for UPDATE_MODE = MANUAL and DELAY_TYPE = VAR_LOAD. "));
                          Write ( Message, string'("Instance "));
                          Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
                          assert FALSE  report Message.all  severity Warning;
                          DEALLOCATE (Message);
                        else
                          idelay_count_var := idelay_count_var + SLV_TO_INT(CNTVALUEIN_in);
                        end if;
                    when others =>  Write ( Message, string'("[Unisim "));
                       Write ( Message, string'(MODULE_NAME));
                       Write ( Message, string'("-4] Invalid Scenario LOAD  = "));
                       Write (Message, LOAD_in);
                       Write (Message, string'(" CE = "));
                       Write (Message, CE_in);
                       Write (Message, string'(" INC = "));
                       Write (Message, INC_in);
                       Write ( Message, string'(" are invalid for DELAY_TYPE = VAR_LOAD "));
                       assert false  report Message.all severity Warning;
                       DEALLOCATE (Message);
                    end case;
                  end if;
                when "01" =>
                  if (EN_VTC_in = '0') then
                  case bcat is
                    when "000" => null;
                    when "001" => null;
                    when "010" =>
                      if (idelay_count_var > MIN_DELAY_COUNT) then
                        idelay_count_var := idelay_count_var - 1;
                      elsif (idelay_count_var = MIN_DELAY_COUNT) then
                        idelay_count_var := MAX_DELAY_COUNT;
                      end if;
                      cntvalue_updated_async <= real(idelay_count_var);
                    when "011" =>
                      if (idelay_count_var < MAX_DELAY_COUNT) then
                        idelay_count_var := idelay_count_var + 1;
                      elsif (idelay_count_var = MAX_DELAY_COUNT) then
                        idelay_count_var := MIN_DELAY_COUNT;
                      end if;
                      cntvalue_updated_async <= real(idelay_count_var);
                    when others =>  
                      Write ( Message, string'("[Unisim "));
                      Write ( Message, string'(MODULE_NAME));
                      Write ( Message, string'("-5] Invalid Scenario LOAD = "));
                      Write (Message, LOAD_in);
                      Write (Message, string'(" CE = "));
                      Write (Message, CE_in);
                      Write (Message, string'(" INC = "));
                      Write (Message, INC_in);
                      Write ( Message, string'(" are invalid for DELAY_TYPE = VARIABLE "));
                      assert false report Message.all severity Warning;
                      DEALLOCATE (Message);
                  end case;
                end if;
              when others => Write ( Message, string'("[Unisim "));
                Write ( Message, string'(MODULE_NAME));
                Write ( Message, string'("-6] Attribute Syntax Error : Legal values for DELAY_TYPE on ODELAYE3 instance are FIXED or VAR_LOAD or VARIABLE."));
                Write ( Message, string'("Instance "));
                Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
                assert FALSE report Message.all severity Failure;
                DEALLOCATE (Message);
          end case;
          idelay_count_async <= idelay_count_var;
          end if; -- CLK_in
        end if; -- RST_in
      end if; -- glblGSR
  end process prcs_calc_idelay;

  prcs_calc_idelay_sync:process(data_mux_sync)
  begin
    cntvalue_updated_sync <= cntvalue_updated_async; 
  end process prcs_calc_idelay_sync;
  
--####################################################################
--#####                      SELECT IDATA_MUX                    #####
--####################################################################
  prcs_data_mux:process(ODATAIN_in, CASC_RETURN_in, CASC_IN_in)
  variable  Message : line;
  begin
      if(CASCADE = "MASTER") then     
            data_mux <= CASC_RETURN_in;
            cdataout_pre <= ODATAIN_in;
      elsif(CASCADE = "NONE") then    
            data_mux <= ODATAIN_in;
            cdataout_pre <= ODATAIN_in;
      elsif(CASCADE = "SLAVE_END") then
         data_mux <= CASC_IN_in;
     cdataout_pre <= '0';
      elsif(CASCADE = "SLAVE_MIDDLE") then
            data_mux <= CASC_RETURN_in;
        cdataout_pre <= CASC_IN_in;
      else
       Write ( Message, string'("[Unisim "));
       Write ( Message, string'(MODULE_NAME));
       Write ( Message, string'("-6] Attribute Syntax Error : Legal values for CASCADE on ODELAYE3 instance are NONE or MASTER or SLAVE_END or SLAVE_MIDDLE."));
       Write ( Message, string'("Instance "));
       Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
       assert FALSE report Message.all severity Failure;
       DEALLOCATE (Message);
       end if; --CASCADE
  end process prcs_data_mux;   

--####################################################################
--#####                      CALC DELAY                       #####
--####################################################################
  prcs_DelayData:process(cntvalue_updated, data_mux, CASC_RETURN_in)
  variable cntvalue : std_logic_vector(8 downto 0);
  variable cntvalue_lower_nibble : integer;
  variable cntvalue_upper_nibble : integer;
  variable delay_value_calc_format : time := 1 ps;
  variable delay_value_calc : time := 1 ps;
  variable  Message : line;
  begin
    cntvalue                := CONV_STD_LOGIC_VECTOR(integer(cntvalue_updated), 9);
    cntvalue_lower_nibble   := SLV_TO_INT(cntvalue(2 downto 0));
    cntvalue_upper_nibble   := SLV_TO_INT(cntvalue(8 downto 3));
    delay_value_calc_format := ((cntvalue_lower_nibble * PER_BIT_FINE_DELAY)* 1 ps) + 
                                (cntvalue_upper_nibble * PER_BIT_MEDIUM_DELAY * 1 ps) + 
                                INTRINSIC_FINE_DELAY + INTRINSIC_MEDIUM_DELAY; 
    --Write ( Message, string'("Instance "));
    --Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
    --Write ( Message, string'(", cntvalue: "));
    --Write ( Message, cntvalue);
    --Write ( Message, string'(", cntvalue_lower_nibble: "));
    --Write ( Message, cntvalue_lower_nibble);
    --Write ( Message, string'(", cntvalue_upper_nibble: "));
    --Write ( Message, cntvalue_upper_nibble);
    --Write ( Message, string'(", delay_value_calc_format: "));
    --Write ( Message, delay_value_calc_format);
    --writeline (output,Message);
    if (CASCADE = "NONE") then    
      delay_value_calc := delay_value_calc_format + ODATAIN_INTRINSIC_DELAY;
    elsif ((CASCADE = "MASTER") or (CASCADE = "SLAVE_MIDDLE")) then
      delay_value_calc := delay_value_calc_format + CASC_RET_INTRINSIC_DELAY;
    elsif (CASCADE = "SLAVE_END") then
      delay_value_calc := delay_value_calc_format + CASC_IN_INTRINSIC_DELAY;
    else
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-7] Attribute Syntax Error : Legal values for CASCADE on ODELAYE3 instance are NONE or MASTER or SLAVE_END or SLAVE_MIDDLE."));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ODELAYE3_V'INSTANCE_NAME));
      assert FALSE report Message.all severity Failure;
      DEALLOCATE (Message);
    end if; --CASCADE 

      tap_out <= transport data_mux after delay_value_calc;
  end process prcs_DelayData;


--####################################################################
--#####                      OUTPUT  TAP                         #####
--####################################################################

    CNTVALUEOUT_out <= "XXXXXXXXX" when EN_VTC_in = '1' else cntvalueout_pre;

  prcs_tapout:process(tap_out, cdataout_pre)
  begin
      DATAOUT_out <= transport tap_out after DATA_OUT_INTRINSIC_DELAY;
      CASC_OUT_out <= transport cdataout_pre after CASC_OUT_INTRINSIC_DELAY;
  end process prcs_tapout;

--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process(DATAOUT_out, CNTVALUEOUT_out, CASC_OUT_out)
  begin
      CNTVALUEOUT    <= CNTVALUEOUT_out;
      DATAOUT        <= DATAOUT_out;
      CASC_OUT       <= CASC_OUT_out;
  end process prcs_output;  
   
    -- end behavioral body
  end ODELAYE3_V;
