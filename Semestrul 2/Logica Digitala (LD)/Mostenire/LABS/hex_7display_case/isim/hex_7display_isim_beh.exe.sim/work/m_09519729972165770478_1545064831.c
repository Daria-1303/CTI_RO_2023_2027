/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/stan/Desktop/Xilinx/hex_7display_case/hex_7display_case.v";
static unsigned int ng1[] = {127U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {63U, 0U};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {6U, 0U};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {91U, 0U};
static unsigned int ng8[] = {3U, 0U};
static unsigned int ng9[] = {79U, 0U};
static unsigned int ng10[] = {4U, 0U};
static unsigned int ng11[] = {102U, 0U};
static unsigned int ng12[] = {5U, 0U};
static unsigned int ng13[] = {109U, 0U};
static unsigned int ng14[] = {125U, 0U};
static unsigned int ng15[] = {7U, 0U};
static unsigned int ng16[] = {8U, 0U};
static unsigned int ng17[] = {9U, 0U};
static unsigned int ng18[] = {111U, 0U};
static unsigned int ng19[] = {10U, 0U};
static unsigned int ng20[] = {95U, 0U};
static unsigned int ng21[] = {11U, 0U};
static unsigned int ng22[] = {124U, 0U};
static unsigned int ng23[] = {12U, 0U};
static unsigned int ng24[] = {57U, 0U};
static unsigned int ng25[] = {13U, 0U};
static unsigned int ng26[] = {94U, 0U};
static unsigned int ng27[] = {14U, 0U};
static unsigned int ng28[] = {121U, 0U};
static unsigned int ng29[] = {15U, 0U};
static unsigned int ng30[] = {113U, 0U};



static void Always_4_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;

LAB0:    t1 = (t0 + 2360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(5, ng0);
    t2 = (t0 + 2680);
    *((int *)t2) = 1;
    t3 = (t0 + 2392);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(6, ng0);

LAB5:    xsi_set_current_line(7, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    xsi_set_current_line(8, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);

LAB6:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng17)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng19)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng21)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng23)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng25)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng27)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng29)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB37;

LAB38:
LAB39:    goto LAB2;

LAB7:    xsi_set_current_line(9, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB9:    xsi_set_current_line(10, ng0);
    t4 = ((char*)((ng5)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB11:    xsi_set_current_line(11, ng0);
    t4 = ((char*)((ng7)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB13:    xsi_set_current_line(12, ng0);
    t4 = ((char*)((ng9)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB15:    xsi_set_current_line(13, ng0);
    t4 = ((char*)((ng11)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB17:    xsi_set_current_line(14, ng0);
    t4 = ((char*)((ng13)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB19:    xsi_set_current_line(15, ng0);
    t4 = ((char*)((ng14)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB21:    xsi_set_current_line(16, ng0);
    t4 = ((char*)((ng15)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB23:    xsi_set_current_line(17, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB25:    xsi_set_current_line(18, ng0);
    t4 = ((char*)((ng18)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB27:    xsi_set_current_line(19, ng0);
    t4 = ((char*)((ng20)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB29:    xsi_set_current_line(20, ng0);
    t4 = ((char*)((ng22)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB31:    xsi_set_current_line(21, ng0);
    t4 = ((char*)((ng24)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB33:    xsi_set_current_line(22, ng0);
    t4 = ((char*)((ng26)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB35:    xsi_set_current_line(23, ng0);
    t4 = ((char*)((ng28)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

LAB37:    xsi_set_current_line(24, ng0);
    t4 = ((char*)((ng30)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 7);
    goto LAB39;

}


extern void work_m_09519729972165770478_1545064831_init()
{
	static char *pe[] = {(void *)Always_4_0};
	xsi_register_didat("work_m_09519729972165770478_1545064831", "isim/hex_7display_isim_beh.exe.sim/work/m_09519729972165770478_1545064831.didat");
	xsi_register_executes(pe);
}
