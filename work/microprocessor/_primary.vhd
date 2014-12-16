library verilog;
use verilog.vl_types.all;
entity microprocessor is
    port(
        data_in         : in     vl_logic_vector(7 downto 0);
        Enter           : in     vl_logic;
        Reset           : in     vl_logic;
        Clock           : in     vl_logic;
        testStart       : in     vl_logic;
        dataOut         : out    vl_logic_vector(7 downto 0);
        CheckState      : out    vl_logic_vector(3 downto 0);
        IR              : out    vl_logic_vector(2 downto 0);
        Halt            : out    vl_logic;
        IRload          : out    vl_logic
    );
end microprocessor;
