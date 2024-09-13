<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A" />
        <signal name="B" />
        <signal name="C" />
        <signal name="D" />
        <signal name="E" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="O" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="D" />
        <port polarity="Input" name="E" />
        <port polarity="Output" name="O" />
        <blockdef name="nand5">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="216" y1="-192" y2="-192" x1="256" />
            <circle r="12" cx="204" cy="-192" />
            <line x2="64" y1="-64" y2="-320" x1="64" />
            <arc ex="144" ey="-240" sx="144" sy="-144" r="48" cx="144" cy="-192" />
            <line x2="144" y1="-240" y2="-240" x1="64" />
            <line x2="64" y1="-144" y2="-144" x1="144" />
        </blockdef>
        <blockdef name="nand2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
        </blockdef>
        <block symbolname="nand5" name="XLXI_2">
            <blockpin signalname="XLXN_15" name="I0" />
            <blockpin signalname="XLXN_14" name="I1" />
            <blockpin signalname="XLXN_13" name="I2" />
            <blockpin signalname="XLXN_12" name="I3" />
            <blockpin signalname="XLXN_11" name="I4" />
            <blockpin signalname="O" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_3">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_4">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_5">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_6">
            <blockpin signalname="E" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_7">
            <blockpin signalname="E" name="I0" />
            <blockpin signalname="D" name="I1" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2560" y="1440" name="XLXI_2" orien="R0" />
        <instance x="1712" y="880" name="XLXI_3" orien="R0" />
        <instance x="1712" y="1168" name="XLXI_4" orien="R0" />
        <instance x="1712" y="1440" name="XLXI_5" orien="R0" />
        <instance x="1712" y="1696" name="XLXI_6" orien="R0" />
        <instance x="1712" y="2000" name="XLXI_7" orien="R0" />
        <branch name="A">
            <wire x2="1552" y1="752" y2="752" x1="1344" />
            <wire x2="1712" y1="752" y2="752" x1="1552" />
            <wire x2="1552" y1="752" y2="1040" x1="1552" />
            <wire x2="1712" y1="1040" y2="1040" x1="1552" />
        </branch>
        <branch name="B">
            <wire x2="1616" y1="816" y2="816" x1="1312" />
            <wire x2="1712" y1="816" y2="816" x1="1616" />
            <wire x2="1616" y1="816" y2="1312" x1="1616" />
            <wire x2="1712" y1="1312" y2="1312" x1="1616" />
        </branch>
        <branch name="C">
            <wire x2="1376" y1="1104" y2="1104" x1="1200" />
            <wire x2="1712" y1="1104" y2="1104" x1="1376" />
            <wire x2="1376" y1="1104" y2="1568" x1="1376" />
            <wire x2="1712" y1="1568" y2="1568" x1="1376" />
        </branch>
        <branch name="D">
            <wire x2="1248" y1="1376" y2="1376" x1="976" />
            <wire x2="1696" y1="1376" y2="1376" x1="1248" />
            <wire x2="1712" y1="1376" y2="1376" x1="1696" />
            <wire x2="1248" y1="1376" y2="1872" x1="1248" />
            <wire x2="1712" y1="1872" y2="1872" x1="1248" />
        </branch>
        <branch name="E">
            <wire x2="912" y1="1632" y2="1632" x1="768" />
            <wire x2="1712" y1="1632" y2="1632" x1="912" />
            <wire x2="912" y1="1632" y2="1936" x1="912" />
            <wire x2="1712" y1="1936" y2="1936" x1="912" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="2560" y1="784" y2="784" x1="1968" />
            <wire x2="2560" y1="784" y2="1120" x1="2560" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="2256" y1="1072" y2="1072" x1="1968" />
            <wire x2="2256" y1="1072" y2="1184" x1="2256" />
            <wire x2="2560" y1="1184" y2="1184" x1="2256" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="2256" y1="1344" y2="1344" x1="1968" />
            <wire x2="2256" y1="1248" y2="1344" x1="2256" />
            <wire x2="2560" y1="1248" y2="1248" x1="2256" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="2272" y1="1600" y2="1600" x1="1968" />
            <wire x2="2272" y1="1312" y2="1600" x1="2272" />
            <wire x2="2560" y1="1312" y2="1312" x1="2272" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="2560" y1="1904" y2="1904" x1="1968" />
            <wire x2="2560" y1="1376" y2="1904" x1="2560" />
        </branch>
        <iomarker fontsize="28" x="1344" y="752" name="A" orien="R180" />
        <iomarker fontsize="28" x="1312" y="816" name="B" orien="R180" />
        <iomarker fontsize="28" x="1200" y="1104" name="C" orien="R180" />
        <iomarker fontsize="28" x="976" y="1376" name="D" orien="R180" />
        <iomarker fontsize="28" x="768" y="1632" name="E" orien="R180" />
        <branch name="O">
            <wire x2="2848" y1="1248" y2="1248" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1248" name="O" orien="R0" />
    </sheet>
</drawing>