library verilog;
use verilog.vl_types.all;
entity CU is
    generic(
        start           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        fetch           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        decode          : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        load            : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        store           : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        add             : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0);
        sub             : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi1);
        inputs          : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi0);
        jz              : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi1);
        jpos            : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi0);
        halt            : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi1)
    );
    port(
        IRload          : out    vl_logic;
        JMPmux          : out    vl_logic;
        PCload          : out    vl_logic;
        Meminst         : out    vl_logic;
        MemWr           : out    vl_logic;
        Asel            : out    vl_logic_vector(1 downto 0);
        Aload           : out    vl_logic;
        \Sub\           : out    vl_logic;
        \Halt\          : out    vl_logic;
        CheckState      : out    vl_logic_vector(3 downto 0);
        Enter           : in     vl_logic;
        Reset           : in     vl_logic;
        Clock           : in     vl_logic;
        IR              : in     vl_logic_vector(2 downto 0);
        Aeq0            : in     vl_logic;
        Apos            : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of start : constant is 1;
    attribute mti_svvh_generic_type of fetch : constant is 1;
    attribute mti_svvh_generic_type of decode : constant is 1;
    attribute mti_svvh_generic_type of load : constant is 1;
    attribute mti_svvh_generic_type of store : constant is 1;
    attribute mti_svvh_generic_type of add : constant is 1;
    attribute mti_svvh_generic_type of sub : constant is 1;
    attribute mti_svvh_generic_type of inputs : constant is 1;
    attribute mti_svvh_generic_type of jz : constant is 1;
    attribute mti_svvh_generic_type of jpos : constant is 1;
    attribute mti_svvh_generic_type of halt : constant is 1;
end CU;
