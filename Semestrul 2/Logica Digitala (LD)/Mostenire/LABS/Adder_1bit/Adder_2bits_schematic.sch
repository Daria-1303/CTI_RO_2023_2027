<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="a0" />
        <signal name="b0" />
        <signal name="XLXN_6" />
        <signal name="c_in" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="a1" />
        <signal name="b1" />
        <signal name="c_out" />
        <signal name="s1" />
        <signal name="s0" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <port polarity="Input" name="a0" />
        <port polarity="Input" name="b0" />
        <port polarity="Input" name="c_in" />
        <port polarity="Input" name="a1" />
        <port polarity="Input" name="b1" />
        <port polarity="Output" name="c_out" />
        <port polarity="Output" name="s1" />
        <port polarity="Output" name="s0" />
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <block symbolname="or3" name="XLXI_1">
            <blockpin signalname="XLXN_9" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin signalname="XLXN_11" name="I2" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="b0" name="I0" />
            <blockpin signalname="a0" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="b0" name="I0" />
            <blockpin signalname="c_in" name="I1" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="c_in" name="I0" />
            <blockpin signalname="a0" name="I1" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_9">
            <blockpin signalname="b0" name="I0" />
            <blockpin signalname="a0" name="I1" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_10">
            <blockpin signalname="c_in" name="I0" />
            <blockpin signalname="XLXN_6" name="I1" />
            <blockpin signalname="s0" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_11">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="XLXN_17" name="I1" />
            <blockpin signalname="s1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_14">
            <blockpin signalname="b1" name="I0" />
            <blockpin signalname="a1" name="I1" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_15">
            <blockpin signalname="b1" name="I0" />
            <blockpin signalname="XLXN_16" name="I1" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_16">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="a1" name="I1" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_17">
            <blockpin signalname="XLXN_18" name="I0" />
            <blockpin signalname="XLXN_19" name="I1" />
            <blockpin signalname="XLXN_20" name="I2" />
            <blockpin signalname="c_out" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_12">
            <blockpin signalname="b1" name="I0" />
            <blockpin signalname="a1" name="I1" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1360" y="1184" name="XLXI_3" orien="R180" />
        <instance x="1888" y="1328" name="XLXI_9" orien="R90" />
        <instance x="1760" y="1712" name="XLXI_10" orien="R90" />
        <branch name="a0">
            <wire x2="1136" y1="1040" y2="1200" x1="1136" />
            <wire x2="1440" y1="1200" y2="1200" x1="1136" />
            <wire x2="1440" y1="1200" y2="1312" x1="1440" />
            <wire x2="1488" y1="1312" y2="1312" x1="1440" />
            <wire x2="1488" y1="1312" y2="1920" x1="1488" />
            <wire x2="1552" y1="1200" y2="1200" x1="1440" />
            <wire x2="1552" y1="1200" y2="1216" x1="1552" />
            <wire x2="2016" y1="1216" y2="1216" x1="1552" />
            <wire x2="2016" y1="1216" y2="1328" x1="2016" />
            <wire x2="1440" y1="1312" y2="1312" x1="1360" />
            <wire x2="1488" y1="1920" y2="1920" x1="1472" />
        </branch>
        <branch name="b0">
            <wire x2="1552" y1="1248" y2="1248" x1="1360" />
            <wire x2="1952" y1="1248" y2="1248" x1="1552" />
            <wire x2="1952" y1="1248" y2="1328" x1="1952" />
            <wire x2="1552" y1="1248" y2="1536" x1="1552" />
            <wire x2="1552" y1="1536" y2="1536" x1="1472" />
            <wire x2="1552" y1="1232" y2="1248" x1="1552" />
            <wire x2="1696" y1="1232" y2="1232" x1="1552" />
            <wire x2="1696" y1="992" y2="1232" x1="1696" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1888" y1="1648" y2="1712" x1="1888" />
            <wire x2="1984" y1="1648" y2="1648" x1="1888" />
            <wire x2="1984" y1="1584" y2="1648" x1="1984" />
        </branch>
        <branch name="c_in">
            <wire x2="1824" y1="1600" y2="1600" x1="1472" />
            <wire x2="1824" y1="1600" y2="1696" x1="1824" />
            <wire x2="1824" y1="1696" y2="1712" x1="1824" />
            <wire x2="2048" y1="1696" y2="1696" x1="1824" />
            <wire x2="2048" y1="1696" y2="1712" x1="2048" />
            <wire x2="1648" y1="1856" y2="1856" x1="1472" />
            <wire x2="1648" y1="1696" y2="1856" x1="1648" />
            <wire x2="1824" y1="1696" y2="1696" x1="1648" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1104" y1="1280" y2="1280" x1="1088" />
            <wire x2="1088" y1="1280" y2="1456" x1="1088" />
            <wire x2="1168" y1="1456" y2="1456" x1="1088" />
            <wire x2="1168" y1="1456" y2="1632" x1="1168" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1200" y1="1760" y2="1760" x1="1168" />
            <wire x2="1200" y1="1760" y2="1888" x1="1200" />
            <wire x2="1216" y1="1888" y2="1888" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="2048" y="1712" name="c_in" orien="R90" />
        <iomarker fontsize="28" x="1136" y="1040" name="a0" orien="R270" />
        <iomarker fontsize="28" x="1696" y="992" name="b0" orien="R270" />
        <instance x="1472" y="1792" name="XLXI_5" orien="R180" />
        <instance x="1472" y="1472" name="XLXI_4" orien="R180" />
        <branch name="XLXN_10">
            <wire x2="1200" y1="1696" y2="1696" x1="1168" />
            <wire x2="1216" y1="1568" y2="1568" x1="1200" />
            <wire x2="1200" y1="1568" y2="1696" x1="1200" />
        </branch>
        <instance x="1168" y="1568" name="XLXI_1" orien="R180" />
        <instance x="608" y="1696" name="XLXI_16" orien="R180" />
        <instance x="672" y="1472" name="XLXI_15" orien="R180" />
        <instance x="704" y="1216" name="XLXI_14" orien="R180" />
        <branch name="XLXN_16">
            <wire x2="640" y1="1760" y2="1760" x1="608" />
            <wire x2="640" y1="1696" y2="1760" x1="640" />
            <wire x2="720" y1="1696" y2="1696" x1="640" />
            <wire x2="784" y1="1696" y2="1696" x1="720" />
            <wire x2="912" y1="1696" y2="1696" x1="784" />
            <wire x2="784" y1="1696" y2="1712" x1="784" />
            <wire x2="816" y1="1712" y2="1712" x1="784" />
            <wire x2="816" y1="1712" y2="1728" x1="816" />
            <wire x2="720" y1="1600" y2="1600" x1="672" />
            <wire x2="720" y1="1600" y2="1696" x1="720" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="928" y1="1520" y2="1520" x1="880" />
            <wire x2="880" y1="1520" y2="1728" x1="880" />
            <wire x2="928" y1="1504" y2="1520" x1="928" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="160" y1="960" y2="1312" x1="160" />
            <wire x2="448" y1="1312" y2="1312" x1="160" />
            <wire x2="448" y1="960" y2="960" x1="160" />
            <wire x2="448" y1="960" y2="1024" x1="448" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="400" y1="1440" y2="1568" x1="400" />
            <wire x2="416" y1="1568" y2="1568" x1="400" />
            <wire x2="800" y1="1440" y2="1440" x1="400" />
            <wire x2="800" y1="1088" y2="1088" x1="448" />
            <wire x2="800" y1="1088" y2="1440" x1="800" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="336" y1="1184" y2="1792" x1="336" />
            <wire x2="352" y1="1792" y2="1792" x1="336" />
            <wire x2="448" y1="1184" y2="1184" x1="336" />
            <wire x2="448" y1="1152" y2="1184" x1="448" />
        </branch>
        <branch name="a1">
            <wire x2="656" y1="1824" y2="1824" x1="608" />
            <wire x2="656" y1="1824" y2="1904" x1="656" />
            <wire x2="736" y1="1840" y2="1840" x1="608" />
            <wire x2="608" y1="1840" y2="1904" x1="608" />
            <wire x2="656" y1="1904" y2="1904" x1="608" />
            <wire x2="720" y1="1344" y2="1344" x1="704" />
            <wire x2="720" y1="1344" y2="1360" x1="720" />
            <wire x2="736" y1="1360" y2="1360" x1="720" />
            <wire x2="736" y1="1360" y2="1840" x1="736" />
            <wire x2="736" y1="1056" y2="1136" x1="736" />
            <wire x2="736" y1="1136" y2="1360" x1="736" />
            <wire x2="960" y1="1136" y2="1136" x1="736" />
            <wire x2="960" y1="1136" y2="1248" x1="960" />
        </branch>
        <branch name="b1">
            <wire x2="752" y1="1536" y2="1536" x1="672" />
            <wire x2="720" y1="1280" y2="1280" x1="704" />
            <wire x2="720" y1="1248" y2="1280" x1="720" />
            <wire x2="752" y1="1248" y2="1248" x1="720" />
            <wire x2="768" y1="1248" y2="1248" x1="752" />
            <wire x2="752" y1="1248" y2="1536" x1="752" />
            <wire x2="832" y1="1056" y2="1056" x1="752" />
            <wire x2="752" y1="1056" y2="1248" x1="752" />
            <wire x2="768" y1="1168" y2="1248" x1="768" />
            <wire x2="896" y1="1168" y2="1168" x1="768" />
            <wire x2="896" y1="1168" y2="1248" x1="896" />
        </branch>
        <iomarker fontsize="28" x="736" y="1056" name="a1" orien="R270" />
        <iomarker fontsize="28" x="832" y="1056" name="b1" orien="R0" />
        <branch name="c_out">
            <wire x2="16" y1="1120" y2="1120" x1="0" />
            <wire x2="192" y1="1088" y2="1088" x1="16" />
            <wire x2="16" y1="1088" y2="1120" x1="16" />
        </branch>
        <iomarker fontsize="28" x="0" y="1120" name="c_out" orien="R180" />
        <branch name="s1">
            <wire x2="816" y1="2016" y2="2032" x1="816" />
            <wire x2="848" y1="2016" y2="2016" x1="816" />
            <wire x2="848" y1="1984" y2="2016" x1="848" />
        </branch>
        <iomarker fontsize="28" x="816" y="2032" name="s1" orien="R90" />
        <branch name="s0">
            <wire x2="1856" y1="1968" y2="2000" x1="1856" />
        </branch>
        <iomarker fontsize="28" x="1856" y="2000" name="s0" orien="R90" />
        <instance x="448" y="960" name="XLXI_17" orien="R180" />
        <instance x="832" y="1248" name="XLXI_12" orien="R90" />
        <instance x="752" y="1728" name="XLXI_11" orien="R90" />
    </sheet>
</drawing>