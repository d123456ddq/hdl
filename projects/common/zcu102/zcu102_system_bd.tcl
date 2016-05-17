
# create board design
# default ports

create_bd_port -dir O -from 2 -to 0 spi0_csn
create_bd_port -dir O spi0_sclk
create_bd_port -dir O spi0_mosi
create_bd_port -dir I spi0_miso

create_bd_port -dir O -from 2 -to 0 spi1_csn
create_bd_port -dir O spi1_sclk
create_bd_port -dir O spi1_mosi
create_bd_port -dir I spi1_miso

create_bd_port -dir I -from 95 -to 0 gpio_i
create_bd_port -dir O -from 95 -to 0 gpio_o

# interrupts

create_bd_port -dir I -type intr ps_intr_00
create_bd_port -dir I -type intr ps_intr_01
create_bd_port -dir I -type intr ps_intr_02
create_bd_port -dir I -type intr ps_intr_03
create_bd_port -dir I -type intr ps_intr_04
create_bd_port -dir I -type intr ps_intr_05
create_bd_port -dir I -type intr ps_intr_06
create_bd_port -dir I -type intr ps_intr_07
create_bd_port -dir I -type intr ps_intr_08
create_bd_port -dir I -type intr ps_intr_09
create_bd_port -dir I -type intr ps_intr_10
create_bd_port -dir I -type intr ps_intr_11
create_bd_port -dir I -type intr ps_intr_12
create_bd_port -dir I -type intr ps_intr_13
create_bd_port -dir I -type intr ps_intr_14
create_bd_port -dir I -type intr ps_intr_15

# instance: sys_ps8

set sys_ps8  [create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:1.0 sys_ps8]

# defaults -- remove after board is supported in the tool
set_property -dict [list\
  CONFIG.PSU__CAN1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__CAN1__PERIPHERAL__IO {MIO 24 .. 25} \
  CONFIG.PSU__ENET3__GRP_MDIO__ENABLE {1} \
  CONFIG.PSU__ENET3__GRP_MDIO__IO {MIO 76 .. 77} \
  CONFIG.PSU__ENET3__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__ENET3__PERIPHERAL__IO {MIO 64 .. 75} \
  CONFIG.PSU__GPIO0_MIO__IO {MIO 0 .. 25} \
  CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__GPIO1_MIO__IO {MIO 26 .. 51} \
  CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__I2C0__PERIPHERAL__IO {MIO 14 .. 15} \
  CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__I2C1__PERIPHERAL__IO {MIO 16 .. 17} \
  CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {1} \
  CONFIG.PSU__QSPI__GRP_FBCLK__IO {MIO 6} \
  CONFIG.PSU__QSPI__PERIPHERAL__DATA_MODE {x4} \
  CONFIG.PSU__QSPI__PERIPHERAL__IO {MIO 0 .. 12} \
  CONFIG.PSU__QSPI__PERIPHERAL__MODE {Dual Parallel} \
  CONFIG.PSU__SD1__GRP_CD__ENABLE {1} \
  CONFIG.PSU__SD1__GRP_CD__IO {MIO 45} \
  CONFIG.PSU__SD1__GRP_POW__ENABLE {1} \
  CONFIG.PSU__SD1__GRP_POW__IO {MIO 43} \
  CONFIG.PSU__SD1__GRP_WP__ENABLE {1} \
  CONFIG.PSU__SD1__GRP_WP__IO {MIO 44} \
  CONFIG.PSU__SD1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__SD1__PERIPHERAL__IO {MIO 46 .. 51} \
  CONFIG.PSU__SD1__SLOT_TYPE {SD} \
  CONFIG.PSU__UART0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__UART0__PERIPHERAL__IO {MIO 18 .. 19} \
  CONFIG.PSU__UART1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__UART1__PERIPHERAL__IO {MIO 20 .. 21} \
  CONFIG.PSU__USB0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__USB0__PERIPHERAL__IO {MIO 52 .. 63} \
  CONFIG.PSU__USE__M_AXI_GP2 {1} \
  CONFIG.PSU__MAXIGP2__DATA_WIDTH {64} \
  CONFIG.PSU__GT__LANE0_REF_SEL {Ref Clk0} \
  CONFIG.PSU__GT__LANE1_REF_SEL {Ref Clk0} \
  CONFIG.PSU__GT__LANE2_REF_SEL {Ref Clk2} \
  CONFIG.PSU__GT__LANE3_REF_SEL {Ref Clk1} \
  CONFIG.PSU__GT__REF_SEL0 {100} \
  CONFIG.PSU__GT__REF_SEL1 {100} \
  CONFIG.PSU__GT__REF_SEL2 {26} \
  CONFIG.PSU__GT__REF_SEL3 {125} \
  CONFIG.PSU__PCIE__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__PCIE__PERIPHERAL__ROOTPORT_IO {MIO 31} \
  CONFIG.PSU__PCIE__DEVICE_PORT_TYPE {Root Port} \
  CONFIG.PSU__PCIE__BAR0_ENABLE {0} \
  CONFIG.PSU__PCIE__DEVICE_ID {0xD021} \
  CONFIG.PSU__PCIE__CLASS_CODE_BASE {0x06} \
  CONFIG.PSU__PCIE__CLASS_CODE_SUB {0x4} \
  CONFIG.PSU__PCIE__CRS_SW_VISIBILITY {1} \
  CONFIG.PSU__PCIE__LANE0__ENABLE {1} \
  CONFIG.PSU__PCIE__LANE0__IO {GT Lane0} \
  CONFIG.PSU__PCIE__LANE1__ENABLE {0} \
  CONFIG.PSU__PCIE__MAXIMUM_LINK_WIDTH {x1} \
  CONFIG.PSU__PCIE__LINK_SPEED {5.0 Gb/s} \
  CONFIG.PSU__SATA__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__SATA__LANE1__ENABLE {1} \
  CONFIG.PSU__SATA__LANE1__IO {GT Lane3} \
  CONFIG.PSU__USB3_0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__USB3_0__PERIPHERAL__IO {GT Lane2} \
  CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1} \
  CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {64} \
  CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRF_APB__DDR_CTRL__SRCSEL {DPLL} \
  CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__DDRC__TRAIN_WRITE_LEVEL {1} \
  CONFIG.PSU__DDRC__TRAIN_READ_GATE {1} \
  CONFIG.PSU__DDRC__TRAIN_DATA_EYE {1} \
  CONFIG.PSU__DDRC__VREF {1} \
  CONFIG.PSU__DDRC__ECC {0} \
  CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
  CONFIG.PSU__DDRC__DRAM_WIDTH {8 Bits} \
  CONFIG.PSU__DDRC__MEMORY_TYPE {DDR 4} \
  CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2133P} \
  CONFIG.PSU__DDRC__FREQ_MHZ {1066.50} \
  CONFIG.PSU__CRF_APB__DDR_CTRL__FREQMHZ {1067} \
  CONFIG.PSU__DDRC__DEVICE_CAPACITY {4096 MBits} \
  CONFIG.PSU__DDRC__RANK_ADDR_COUNT {0} \
  CONFIG.PSU__DDRC__BG_ADDR_COUNT {2} \
  CONFIG.PSU__DDRC__BANK_ADDR_COUNT {2} \
  CONFIG.PSU__DDRC__ROW_ADDR_COUNT {15} \
  CONFIG.PSU__DDRC__COL_ADDR_COUNT {10} \
  CONFIG.PSU__DDRC__CL {15} \
  CONFIG.PSU__DDRC__T_RCD {15} \
  CONFIG.PSU__DDRC__T_RP {15} \
  CONFIG.PSU__DDRC__CWL {14} \
  CONFIG.PSU__DDRC__AL {0} \
  CONFIG.PSU__DDRC__BL {8} \
  CONFIG.PSU__DDRC__T_RC {46.5} \
  CONFIG.PSU__DDRC__T_RAS_MIN {33} \
  CONFIG.PSU__DDRC__T_FAW {21.0} \
  CONFIG.PSU__DDRC__ADDR_MIRROR {0} \
  CONFIG.PSU__DDRC__DDR4_T_REF_MODE {0} \
  CONFIG.PSU__DDRC__DDR4_T_REF_RANGE {0} \
  CONFIG.PSU__DDRC__RD_DBI_ENABLE {0} \
  CONFIG.PSU__DDRC__WR_DBI_ENABLE {0} \
  CONFIG.PSU__DDRC__PHY_DBI_MODE {0} \
  CONFIG.PSU__DDRC__DATA_MASK {1} \
  CONFIG.PSU__DDRC__PARITY_ENABLE {0} \
  CONFIG.PSU__DDRC__CLOCK_STOP_EN {0} \
  CONFIG.PSU__DDRC__DDR4_CAL_MODE_ENABLE {0} \
  CONFIG.PSU__DDRC__DDR4_CRC_CONTROL {0} \
  CONFIG.PSU__DDRC__DDR4_ADDR_MAPPING {0} \
  CONFIG.PSU__DDRC__BRC_MAPPING {0} \
  CONFIG.PSU__DDRC__PER_BANK_REFRESH {0} \
  CONFIG.PSU__DDRC__FGRM {0} \
  CONFIG.PSU__DDRC__LP_ASR {0} \
  CONFIG.PSU__DDRC__UDIMM_INDICATOR {1} \
  CONFIG.PSU__DDRC__RDIMM_INDICATOR {0} \
  CONFIG.PSU__DDRC__DIMM_ADDR_MIRROR {0} \
  CONFIG.PSU__DDRC__STATIC_RD_MODE {0} \
  CONFIG.PSU__DDRC__SELF_REF_ABORT {0} \
  CONFIG.PSU__OVERRIDE__BASIC_CLOCK {1} \
  CONFIG.PSU__PSS_REF_CLK__FREQMHZ {33.333} \
  CONFIG.PSU__CRF_APB__APLL_CTRL__SRCSEL {PSS_REF_CLK} \
  CONFIG.PSU__CRF_APB__APLL_CTRL__DIV2 {1} \
  CONFIG.PSU__CRF_APB__APLL_CTRL__FBDIV {66} \
  CONFIG.PSU__CRF_APB__DPLL_CTRL__SRCSEL {PSS_REF_CLK} \
  CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1} \
  CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {64} \
  CONFIG.PSU__CRF_APB__VPLL_CTRL__SRCSEL {PSS_REF_CLK} \
  CONFIG.PSU__CRF_APB__VPLL_CTRL__DIV2 {1} \
  CONFIG.PSU__CRF_APB__VPLL_CTRL__FBDIV {57} \
  CONFIG.PSU__CRF_APB__VPLL_FRAC_CFG__ENABLED {1} \
  CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACDATA {0.508} \
  CONFIG.PSU__CRL_APB__IOPLL_CTRL__SRCSEL {PSS_REF_CLK} \
  CONFIG.PSU__CRL_APB__IOPLL_CTRL__DIV2 {0} \
  CONFIG.PSU__CRL_APB__IOPLL_CTRL__FBDIV {45} \
  CONFIG.PSU__CRL_APB__RPLL_CTRL__SRCSEL {PSS_REF_CLK} \
  CONFIG.PSU__CRL_APB__RPLL_CTRL__DIV2 {1} \
  CONFIG.PSU__CRL_APB__RPLL_CTRL__FBDIV {72} \
  CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__SRCSEL {APLL} \
  CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__SRCSEL {DPLL} \
  CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__SRCSEL {VPLL} \
  CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRF_APB__ACPU_CTRL__SRCSEL {APLL} \
  CONFIG.PSU__CRF_APB__ACPU_CTRL__DIVISOR0 {1} \
  CONFIG.PSU__CRF_APB__DBG_TRACE__ENABLE {1} \
  CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__CRF_APB__DBG_FPD__ENABLE {1} \
  CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__CRF_APB__DBG_TSTMP__ENABLE {1} \
  CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {VPLL} \
  CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR0 {39} \
  CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR0 {17} \
  CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRF_APB__DPDMA__ENABLE {1} \
  CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__SRCSEL {APLL} \
  CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__CRF_APB__DDR_CTRL__SRCSEL {DPLL} \
  CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__CRF_APB__GPU_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRF_APB__GPU_REF_CTRL__DIVISOR0 {1} \
  CONFIG.PSU__CRF_APB__SATA_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRF_APB__SATA_REF_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__CRF_APB__GDMA__ENABLE {1} \
  CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__SRCSEL {APLL} \
  CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__CRF_APB__GTGREF0__ENABLE {1} \
  CONFIG.PSU__CRF_APB__GTGREF0_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRF_APB__GTGREF0_REF_CTRL__DIVISOR0 {4} \
  CONFIG.PSU__CRF_APB__TOPSW_MAIN__ENABLE {1} \
  CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__SRCSEL {VPLL} \
  CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__DIVISOR0 {2} \
  CONFIG.PSU__CRF_APB__TOPSW_LSBUS__ENABLE {1} \
  CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__DIVISOR0 {5} \
  CONFIG.PSU__CRL_APB__IOU_SWITCH__ENABLE {1} \
  CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__DIVISOR0 {6} \
  CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR0 {12} \
  CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR0 {12} \
  CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR0 {12} \
  CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR0 {12} \
  CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR0 {6} \
  CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR0 {6} \
  CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__USB3__ENABLE {1} \
  CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR0 {5} \
  CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR1 {15} \
  CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR0 {12} \
  CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR0 {6} \
  CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR0 {6} \
  CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__UART0_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__UART1_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR0 {6} \
  CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR0 {6} \
  CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__NAND_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__ADMA__ENABLE {1} \
  CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRL_APB__DBG_LPD__ENABLE {1} \
  CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__DIVISOR0 {6} \
  CONFIG.PSU__CRL_APB__CPU_R5_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__CPU_R5_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRL_APB__CSU_PLL_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRL_APB__CSU_PLL_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRL_APB__PCAP__ENABLE {1} \
  CONFIG.PSU__CRL_APB__PCAP_CTRL__SRCSEL {RPLL} \
  CONFIG.PSU__CRL_APB__PCAP_CTRL__DIVISOR0 {6} \
  CONFIG.PSU__CRL_APB__LPD_LSBUS__ENABLE {1} \
  CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__CRL_APB__LPD_SWITCH__ENABLE {1} \
  CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__DIVISOR0 {3} \
  CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR1 {1} \
  CONFIG.PSU__CRL_APB__TIMESTAMP__ENABLE {1} \
  CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__FPGA_PL0_ENABLE {1} \
  CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {IOPLL} \
  CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {15} \
  CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1} \
] $sys_ps8

set_property CONFIG.PSU__USE__M_AXI_GP2 {1} $sys_ps8
set_property CONFIG.PSU__MAXIGP2__DATA_WIDTH {32} $sys_ps8
set_property CONFIG.PSU__FPGA_PL0_ENABLE {1} $sys_ps8
set_property CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {100} $sys_ps8
set_property CONFIG.PSU__FPGA_PL1_ENABLE {1} $sys_ps8
set_property CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {200} $sys_ps8
set_property CONFIG.PSU__USE__IRQ0 {1} $sys_ps8
set_property CONFIG.PSU__USE__IRQ1 {1} $sys_ps8
set_property CONFIG.PSU__GPIO0_EMIO__PERIPHERAL__ENABLE {1} $sys_ps8

set_property -dict [list\
  CONFIG.PSU__SPI0__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__SPI0__PERIPHERAL__IO {EMIO} \
  CONFIG.PSU__SPI1__PERIPHERAL__ENABLE {1} \
  CONFIG.PSU__SPI1__PERIPHERAL__IO {EMIO} \
] $sys_ps8

set sys_rstgen [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 sys_rstgen]
set_property -dict [list CONFIG.C_EXT_RST_WIDTH {1}] $sys_rstgen

# system reset/clock definitions

ad_connect  sys_cpu_clk sys_ps8/pl_clk0
ad_connect  sys_200m_clk sys_ps8/pl_clk1
ad_connect  sys_cpu_reset sys_rstgen/peripheral_reset
ad_connect  sys_cpu_resetn sys_rstgen/peripheral_aresetn
ad_connect  sys_cpu_clk sys_rstgen/slowest_sync_clk
ad_connect  sys_rstgen/ext_reset_in GND

# gpio

ad_connect  gpio_i sys_ps8/emio_gpio_i
ad_connect  gpio_o sys_ps8/emio_gpio_o

# spi

ad_connect  sys_ps8/emio_spi0_ss_i_n VCC
ad_connect  sys_ps8/emio_spi0_sclk_i sys_ps8/emio_spi0_sclk_o
ad_connect  sys_ps8/emio_spi0_m_i sys_ps8/emio_spi0_m_o

ad_connect  spi0_csn sys_ps8/emio_spi0_ss_o_n
ad_connect  spi0_sclk sys_ps8/emio_spi0_sclk_o
ad_connect  spi0_mosi sys_ps8/emio_spi0_m_o
ad_connect  spi0_miso sys_ps8/emio_spi0_s_i

ad_connect  sys_ps8/emio_spi1_ss_i_n VCC
ad_connect  sys_ps8/emio_spi1_sclk_i sys_ps8/emio_spi1_sclk_o
ad_connect  sys_ps8/emio_spi1_m_i sys_ps8/emio_spi1_m_o

ad_connect  spi1_csn sys_ps8/emio_spi1_ss_o_n
ad_connect  spi1_sclk sys_ps8/emio_spi1_sclk_o
ad_connect  spi1_mosi sys_ps8/emio_spi1_m_o
ad_connect  spi1_miso sys_ps8/emio_spi1_s_i

# interrupts

set sys_concat_intc_0 [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 sys_concat_intc_0]
set_property -dict [list CONFIG.NUM_PORTS {8}] $sys_concat_intc_0

set sys_concat_intc_1 [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 sys_concat_intc_1]
set_property -dict [list CONFIG.NUM_PORTS {8}] $sys_concat_intc_1

ad_connect  sys_concat_intc_0/dout sys_ps8/pl_ps_irq0
ad_connect  sys_concat_intc_1/dout sys_ps8/pl_ps_irq1

ad_connect  sys_concat_intc_1/In7 ps_intr_15
ad_connect  sys_concat_intc_1/In6 ps_intr_14
ad_connect  sys_concat_intc_1/In5 ps_intr_13
ad_connect  sys_concat_intc_1/In4 ps_intr_12
ad_connect  sys_concat_intc_1/In3 ps_intr_11
ad_connect  sys_concat_intc_1/In2 ps_intr_10
ad_connect  sys_concat_intc_1/In1 ps_intr_09
ad_connect  sys_concat_intc_1/In0 ps_intr_08
ad_connect  sys_concat_intc_0/In7 ps_intr_07
ad_connect  sys_concat_intc_0/In6 ps_intr_06
ad_connect  sys_concat_intc_0/In5 ps_intr_05
ad_connect  sys_concat_intc_0/In4 ps_intr_04
ad_connect  sys_concat_intc_0/In3 ps_intr_03
ad_connect  sys_concat_intc_0/In2 ps_intr_02
ad_connect  sys_concat_intc_0/In1 ps_intr_01
ad_connect  sys_concat_intc_0/In0 ps_intr_00
