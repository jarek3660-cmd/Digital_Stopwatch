architecture Behavioral of 4bit_counter is

    signal temp    : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal notTemp : STD_LOGIC_VECTOR(3 downto 0);
    signal Clk_1Hz : STD_LOGIC := '0';

begin

    notTemp <= not(temp);

    process(Clk_1Hz)
    begin
        if rising_edge(Clk_1Hz) then
            temp(0) <= notTemp(0);
        end if;
    end process;

    process(temp(0))
    begin
        if rising_edge(temp(0)) then
            temp(1) <= notTemp(1);
        end if;
    end process;

    process(temp(1))
    begin
        if rising_edge(temp(1)) then
            temp(2) <= notTemp(2);
        end if;
    end process;

    process(temp(2))
    begin
        if rising_edge(temp(2)) then
            temp(3) <= notTemp(3);
        end if;
    end process;

    Count <= temp;

end Behavioral;
