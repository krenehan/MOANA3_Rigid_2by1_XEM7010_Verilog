////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// TSMC Library/IP Product
/// Filename: tcb013bcdlvt.v
/// Technology: CM013ML,CM013MP,CV013NH,CV013NI
/// Product Type: Standard Cell
/// Product Name: tcb013bcdlvt
/// Version: 110a
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
///  STATEMENT OF USE
///
///  This information contains confidential and proprietary information of TSMC.
///  No part of this information may be reproduced, transmitted, transcribed,
///  stored in a retrieval system, or translated into any human or computer
///  language, in any form or by any means, electronic, mechanical, magnetic,
///  optical, chemical, manual, or otherwise, without the prior written permission
///  of TSMC.  This information was prepared for informational purpose and is for
///  use by TSMC's customers only.  TSMC reserves the right to make changes in the
///  information at any time and without notice.
///

`timescale 1ns/10ps

`default_nettype wire

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`celldefine
module CKAN2LVTD0 (A1, A2, Z);
    input wire A1, A2;
    output wire Z;
    and (Z, A1, A2);

  specify
    (A1 => Z) = (0, 0);
    (A2 => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD0 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD1 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD12 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD16 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD2 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD20 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD24 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD3 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD4 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD6 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module CKNLVTD8 (CLK, CN);
    input wire CLK;
    output wire CN;
    not (CN, CLK);

  specify
    (CLK => CN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module AN2LVTD0 (A1, A2, Z);
    input A1, A2;
    output Z;
    and (Z, A1, A2);

  specify
    (A1 => Z) = (0, 0);
    (A2 => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module OR2LVTD0 (A1, A2, Z);
    input A1, A2;
    output Z;
    or (Z, A1, A2);

  specify
    (A1 => Z) = (0, 0);
    (A2 => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module BUFFLVTD8 (I, Z);
    input wire I;
    output wire Z;
    buf (Z, I);

  specify
    (I => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

//`celldefine
//module DELLVT1 (I, Z);
//    input wire I;
//    output wire Z;
//    buf (Z, I);
//
//  specify
//    (I => Z) = (0, 0);
//  endspecify
//endmodule
//`endcelldefine

`celldefine
module BUFFLVTD3 (I, Z);
    input wire I;
    output wire Z;
    buf (Z, I);

  specify
    (I => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine


`celldefine
module DFSNQLVTD1 (D, CP, SDN, Q);
    input wire D, CP, SDN;
    output wire Q;
    reg notifier;
    `ifdef NTC
        `ifdef RECREM
            wire SDN_d;
            buf (SDN_i, SDN_d);
        `else 
            buf (SDN_i, SDN);
        `endif 
        wire D_d, CP_d;
        pullup (CDN);
        tsmc_dff (Q_buf, D_d, CP_d, CDN, SDN_i, notifier);
        buf (Q, Q_buf);
    `else 
        buf (SDN_i, SDN);
        pullup (CDN);
        tsmc_dff (Q_buf, D, CP, CDN, SDN_i, notifier);
        buf (Q, Q_buf);
    `endif 

  `ifdef TETRAMAX
  `else
    tsmc_xbuf (SDN_SDFCHK, SDN, 1'b1);
    tsmc_xbuf (nD_SDFCHK, nD, 1'b1);
    tsmc_xbuf (D_SDN_SDFCHK, D_SDN, 1'b1);
    tsmc_xbuf (nD_SDN_SDFCHK, nD_SDN, 1'b1);
    tsmc_xbuf (CP_D_SDFCHK, CP_D, 1'b1);
    tsmc_xbuf (CP_nD_SDFCHK, CP_nD, 1'b1);
    tsmc_xbuf (nCP_D_SDFCHK, nCP_D, 1'b1);
    tsmc_xbuf (nCP_nD_SDFCHK, nCP_nD, 1'b1);
  `endif

    not (nD, D);
    not (nCP, CP);
    and (D_SDN, D, SDN);
    and (nD_SDN, nD, SDN);
    and (CP_D, CP, D);
    and (CP_nD, CP, nD);
    and (nCP_D, nCP, D);
    and (nCP_nD, nCP, nD);

  // Timing logics defined for default constraint check
  buf  (CP_check, SDN_i);
  buf  (D_check, SDN_i);
  `ifdef TETRAMAX
  `else
    tsmc_xbuf (CP_DEFCHK, CP_check, 1'b1);
    tsmc_xbuf (D_DEFCHK, D_check, 1'b1);
  `endif

  `ifdef TETRAMAX
  `else
  specify
    (posedge CP => (Q+:D)) = (0, 0);
    if (CP == 1'b1 && D == 1'b1)
    (negedge SDN => (Q+:1'b1)) = (0, 0);
    if (CP == 1'b1 && D == 1'b0)
    (negedge SDN => (Q+:1'b1)) = (0, 0);
    if (CP == 1'b0 && D == 1'b1)
    (negedge SDN => (Q+:1'b1)) = (0, 0);
    if (CP == 1'b0 && D == 1'b0)
    (negedge SDN => (Q+:1'b1)) = (0, 0);
    $width (posedge CP &&& D_SDN_SDFCHK, 0, 0, notifier);
    $width (negedge CP &&& D_SDN_SDFCHK, 0, 0, notifier);
    $width (posedge CP &&& nD_SDN_SDFCHK, 0, 0, notifier);
    $width (negedge CP &&& nD_SDN_SDFCHK, 0, 0, notifier);
    $width (negedge SDN &&& CP_D_SDFCHK, 0, 0, notifier);
    $width (negedge SDN &&& CP_nD_SDFCHK, 0, 0, notifier);
    $width (negedge SDN &&& nCP_D_SDFCHK, 0, 0, notifier);
    $width (negedge SDN &&& nCP_nD_SDFCHK, 0, 0, notifier);
  `ifdef NTC
    `ifdef RECREM
      $setuphold (posedge CP &&& SDN_SDFCHK, posedge D , 0, 0, notifier,,, CP_d, D_d);
      $setuphold (posedge CP &&& SDN_SDFCHK, negedge D , 0, 0, notifier,,, CP_d, D_d);
      $recrem (posedge SDN &&& nD_SDFCHK, posedge CP &&& nD_SDFCHK, 0,0, notifier, , , SDN_d, CP_d);
    `else
      $setuphold (posedge CP &&& SDN_SDFCHK, posedge D , 0, 0, notifier,,, CP_d, D_d);
      $setuphold (posedge CP &&& SDN_SDFCHK, negedge D , 0, 0, notifier,,, CP_d, D_d);
      $recovery (posedge SDN &&& nD_SDFCHK, posedge CP &&& nD_SDFCHK, 0, notifier);
      $hold (posedge CP &&& nD_SDFCHK, posedge SDN , 0, notifier);
    `endif
  `else
    $setuphold (posedge CP &&& SDN_SDFCHK, posedge D , 0, 0, notifier);
    $setuphold (posedge CP &&& SDN_SDFCHK, negedge D , 0, 0, notifier);
    $recovery (posedge SDN &&& nD_SDFCHK, posedge CP &&& nD_SDFCHK, 0, notifier);
    $hold (posedge CP &&& nD_SDFCHK, posedge SDN , 0, notifier);
  `endif
  endspecify
  `endif
endmodule
`endcelldefine


`celldefine
module DFCNQLVTD1 (D, CP, CDN, Q);
    input wire D, CP, CDN;
    output wire Q;
    reg notifier;
    `ifdef NTC
        `ifdef RECREM
            wire CDN_d;
            buf (CDN_i, CDN_d);
        `else 
            buf (CDN_i, CDN);
        `endif 
        wire D_d, CP_d;
        pullup (SDN);
        tsmc_dff (Q_buf, D_d, CP_d, CDN_i, SDN, notifier);
        buf (Q, Q_buf);
    `else 
        buf (CDN_i, CDN);
        pullup (SDN);
        tsmc_dff (Q_buf, D, CP, CDN_i, SDN, notifier);
        buf (Q, Q_buf);
    `endif 

  `ifdef TETRAMAX
  `else
    tsmc_xbuf (CDN_SDFCHK, CDN, 1'b1);
    tsmc_xbuf (D_SDFCHK, D, 1'b1);
    tsmc_xbuf (CP_D_SDFCHK, CP_D, 1'b1);
    tsmc_xbuf (CP_nD_SDFCHK, CP_nD, 1'b1);
    tsmc_xbuf (nCP_D_SDFCHK, nCP_D, 1'b1);
    tsmc_xbuf (nCP_nD_SDFCHK, nCP_nD, 1'b1);
    tsmc_xbuf (CDN_D_SDFCHK, CDN_D, 1'b1);
    tsmc_xbuf (CDN_nD_SDFCHK, CDN_nD, 1'b1);
  `endif

    not (nD, D);
    not (nCP, CP);
    and (CP_D, CP, D);
    and (CP_nD, CP, nD);
    and (nCP_D, nCP, D);
    and (nCP_nD, nCP, nD);
    and (CDN_D, CDN, D);
    and (CDN_nD, CDN, nD);

  // Timing logics defined for default constraint check
  buf  (CP_check, CDN_i);
  buf  (D_check, CDN_i);
  `ifdef TETRAMAX
  `else
    tsmc_xbuf (CP_DEFCHK, CP_check, 1'b1);
    tsmc_xbuf (D_DEFCHK, D_check, 1'b1);
  `endif

  `ifdef TETRAMAX
  `else
  specify
    if (CP == 1'b1 && D == 1'b1)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    if (CP == 1'b1 && D == 1'b0)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    if (CP == 1'b0 && D == 1'b1)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    if (CP == 1'b0 && D == 1'b0)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    (posedge CP => (Q+:D)) = (0, 0);
    $width (negedge CDN &&& CP_D_SDFCHK, 0, 0, notifier);
    $width (negedge CDN &&& CP_nD_SDFCHK, 0, 0, notifier);
    $width (negedge CDN &&& nCP_D_SDFCHK, 0, 0, notifier);
    $width (negedge CDN &&& nCP_nD_SDFCHK, 0, 0, notifier);
    $width (posedge CP &&& CDN_D_SDFCHK, 0, 0, notifier);
    $width (negedge CP &&& CDN_D_SDFCHK, 0, 0, notifier);
    $width (posedge CP &&& CDN_nD_SDFCHK, 0, 0, notifier);
    $width (negedge CP &&& CDN_nD_SDFCHK, 0, 0, notifier);
  `ifdef NTC
    `ifdef RECREM
      $setuphold (posedge CP &&& CDN_SDFCHK, posedge D , 0, 0, notifier,,, CP_d, D_d);
      $setuphold (posedge CP &&& CDN_SDFCHK, negedge D , 0, 0, notifier,,, CP_d, D_d);
      $recrem (posedge CDN &&& D_SDFCHK, posedge CP &&& D_SDFCHK, 0,0, notifier, , , CDN_d, CP_d);
    `else
      $setuphold (posedge CP &&& CDN_SDFCHK, posedge D , 0, 0, notifier,,, CP_d, D_d);
      $setuphold (posedge CP &&& CDN_SDFCHK, negedge D , 0, 0, notifier,,, CP_d, D_d);
      $recovery (posedge CDN &&& D_SDFCHK, posedge CP &&& D_SDFCHK, 0, notifier);
      $hold (posedge CP &&& D_SDFCHK, posedge CDN , 0, notifier);
    `endif
  `else
    $setuphold (posedge CP &&& CDN_SDFCHK, posedge D , 0, 0, notifier);
    $setuphold (posedge CP &&& CDN_SDFCHK, negedge D , 0, 0, notifier);
    $recovery (posedge CDN &&& D_SDFCHK, posedge CP &&& D_SDFCHK, 0, notifier);
    $hold (posedge CP &&& D_SDFCHK, posedge CDN , 0, notifier);
  `endif
  endspecify
  `endif
endmodule
`endcelldefine

`celldefine
module NR2LVTD4 (A1, A2, ZN);
    input wire A1, A2;
    output wire ZN;
    or (I0_out, A1, A2);
    not (ZN, I0_out);

  specify
    (A1 => ZN) = (0, 0);
    (A2 => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

//`celldefine
//module DELLVT015 (I, Z);
//    input wire I;
//    output wire Z;
//    buf (Z, I);
//
//  specify
//    (I => Z) = (0, 0);
//  endspecify
//endmodule
//`endcelldefine

`celldefine
module DELLVT0 (I, Z);
    input wire I;
    output wire Z;
    buf (Z, I);

  specify
    (I => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module AN2LVTD4 (A1, A2, Z);
    input wire A1, A2;
    output wire Z;
    and (Z, A1, A2);

  specify
    (A1 => Z) = (0, 0);
    (A2 => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module IND2LVTD4 (A1, B1, ZN);
    input wire A1, B1;
    output wire ZN;
    not (I0_out, A1);
    and (I1_out, I0_out, B1);
    not (ZN, I1_out);

  specify
    (A1 => ZN) = (0, 0);
    (B1 => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module AN2LVTD2 (A1, A2, Z);
    input wire A1, A2;
    output wire Z;
    and (Z, A1, A2);

  specify
    (A1 => Z) = (0, 0);
    (A2 => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module BUFFLVTD1 (I, Z);
    input wire I;
    output wire Z;
    buf (Z, I);

  specify
    (I => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module AN2LVTD1 (A1, A2, Z);
    input wire A1, A2;
    output wire Z;
    and (Z, A1, A2);

  specify
    (A1 => Z) = (0, 0);
    (A2 => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module INVLVTD0 (I, ZN);
    input wire I;
    output wire ZN;
    not (ZN, I);

  specify
    (I => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module INVLVTD1 (I, ZN);
    input wire I;
    output wire ZN;
    not (ZN, I);

  specify
    (I => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module INVLVTD2 (I, ZN);
    input wire I;
    output wire ZN;
    not (ZN, I);

  specify
    (I => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module INVLVTD3 (I, ZN);
    input wire I;
    output wire ZN;
    not (ZN, I);

  specify
    (I => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module INVLVTD4 (I, ZN);
    input wire I;
    output wire ZN;
    not (ZN, I);

  specify
    (I => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module INVLVTD8 (I, ZN);
    input wire I;
    output wire ZN;
    not (ZN, I);

  specify
    (I => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module INVLVTD16 (I, ZN);
    input wire I;
    output wire ZN;
    not (ZN, I);

  specify
    (I => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module INVLVTD24 (I, ZN);
    input wire I;
    output wire ZN;
    not (ZN, I);

  specify
    (I => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module IND2LVTD2 (A1, B1, ZN);
    input wire A1, B1;
    output wire ZN;
    not (I0_out, A1);
    and (I1_out, I0_out, B1);
    not (ZN, I1_out);

  specify
    (A1 => ZN) = (0, 0);
    (B1 => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

//`celldefine
//module DELLVT2 (I, Z);
//    input wire I;
//    output wire Z;
//    buf (Z, I);
//
//  specify
//    (I => Z) = (0, 0);
//  endspecify
//endmodule
//`endcelldefine


`celldefine
module NR2LVTD2 (A1, A2, ZN);
    input wire A1, A2;
    output wire ZN;
    or (I0_out, A1, A2);
    not (ZN, I0_out);

  specify
    (A1 => ZN) = (0, 0);
    (A2 => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module BUFFLVTD4 (I, Z);
    input wire I;
    output wire Z;
    buf (Z, I);

  specify
    (I => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine



`celldefine
module DFNCNLVTD1 (D, CPN, CDN, Q, QN);
    input wire D, CPN, CDN;
    output wire Q, QN;
    reg notifier;

    `ifdef NTC
        `ifdef RECREM
            wire CDN_d;
            buf (CDN_i, CDN_d);
        `else 
            buf (CDN_i, CDN);
        `endif 
        wire D_d, CPN_d;
        pullup (SDN);
        not (CP, CPN_d);
        tsmc_dff (Q_buf, D_d, CP, CDN_i, SDN, notifier);
        buf (Q, Q_buf);
        not (QN, Q_buf);
    `else 
        buf (CDN_i, CDN);
        pullup (SDN);
        not (CP, CPN);
        tsmc_dff (Q_buf, D, CP, CDN_i, SDN, notifier);
        buf (Q, Q_buf);
        not (QN, Q_buf);
    `endif 

  `ifdef TETRAMAX
  `else
    tsmc_xbuf (CDN_SDFCHK, CDN, 1'b1);
    tsmc_xbuf (D_SDFCHK, D, 1'b1);
    tsmc_xbuf (CPN_D_SDFCHK, CPN_D, 1'b1);
    tsmc_xbuf (CPN_nD_SDFCHK, CPN_nD, 1'b1);
    tsmc_xbuf (nCPN_D_SDFCHK, nCPN_D, 1'b1);
    tsmc_xbuf (nCPN_nD_SDFCHK, nCPN_nD, 1'b1);
    tsmc_xbuf (CDN_D_SDFCHK, CDN_D, 1'b1);
    tsmc_xbuf (CDN_nD_SDFCHK, CDN_nD, 1'b1);
  `endif

    not (nD, D);
    not (nCPN, CPN);
    and (CPN_D, CPN, D);
    and (CPN_nD, CPN, nD);
    and (nCPN_D, nCPN, D);
    and (nCPN_nD, nCPN, nD);
    and (CDN_D, CDN, D);
    and (CDN_nD, CDN, nD);

  // Timing logics defined for default constraint check
  buf  (CPN_check, CDN_i);
  buf  (D_check, CDN_i);
  `ifdef TETRAMAX
  `else
    tsmc_xbuf (CPN_DEFCHK, CPN_check, 1'b1);
    tsmc_xbuf (D_DEFCHK, D_check, 1'b1);
  `endif

  `ifdef TETRAMAX
  `else
  specify
    if (CPN == 1'b1 && D == 1'b1)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    if (CPN == 1'b1 && D == 1'b0)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    if (CPN == 1'b0 && D == 1'b1)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    if (CPN == 1'b0 && D == 1'b0)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    (negedge CPN => (Q+:D)) = (0, 0);
    if (CPN == 1'b1 && D == 1'b1)
    (negedge CDN => (QN-:1'b0)) = (0, 0);
    if (CPN == 1'b1 && D == 1'b0)
    (negedge CDN => (QN-:1'b0)) = (0, 0);
    if (CPN == 1'b0 && D == 1'b1)
    (negedge CDN => (QN-:1'b0)) = (0, 0);
    if (CPN == 1'b0 && D == 1'b0)
    (negedge CDN => (QN-:1'b0)) = (0, 0);
    (negedge CPN => (QN-:D)) = (0, 0);
    $width (negedge CDN &&& CPN_D_SDFCHK, 0, 0, notifier);
    $width (negedge CDN &&& CPN_nD_SDFCHK, 0, 0, notifier);
    $width (negedge CDN &&& nCPN_D_SDFCHK, 0, 0, notifier);
    $width (negedge CDN &&& nCPN_nD_SDFCHK, 0, 0, notifier);
    $width (posedge CPN &&& CDN_D_SDFCHK, 0, 0, notifier);
    $width (negedge CPN &&& CDN_D_SDFCHK, 0, 0, notifier);
    $width (posedge CPN &&& CDN_nD_SDFCHK, 0, 0, notifier);
    $width (negedge CPN &&& CDN_nD_SDFCHK, 0, 0, notifier);
  `ifdef NTC
    `ifdef RECREM
      $setuphold (negedge CPN &&& CDN_SDFCHK, posedge D , 0, 0, notifier,,, CPN_d, D_d);
      $setuphold (negedge CPN &&& CDN_SDFCHK, negedge D , 0, 0, notifier,,, CPN_d, D_d);
      $recrem (posedge CDN &&& D_SDFCHK, negedge CPN &&& D_SDFCHK, 0,0, notifier, , , CDN_d, CPN_d);
    `else
      $setuphold (negedge CPN &&& CDN_SDFCHK, posedge D , 0, 0, notifier,,, CPN_d, D_d);
      $setuphold (negedge CPN &&& CDN_SDFCHK, negedge D , 0, 0, notifier,,, CPN_d, D_d);
      $recovery (posedge CDN &&& D_SDFCHK, negedge CPN &&& D_SDFCHK, 0, notifier);
      $hold (negedge CPN &&& D_SDFCHK, posedge CDN , 0, notifier);
    `endif
  `else
    $setuphold (negedge CPN &&& CDN_SDFCHK, posedge D , 0, 0, notifier);
    $setuphold (negedge CPN &&& CDN_SDFCHK, negedge D , 0, 0, notifier);
    $recovery (posedge CDN &&& D_SDFCHK, negedge CPN &&& D_SDFCHK, 0, notifier);
    $hold (negedge CPN &&& D_SDFCHK, posedge CDN , 0, notifier);
  `endif
  endspecify
  `endif
endmodule
`endcelldefine


`celldefine
module BUFFLVTD2 (I, Z);
    input wire I;
    output wire Z;
    buf (Z, I);

  specify
    (I => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine


`celldefine
module DFCNLVTD1 (D, CP, CDN, Q, QN);
    input wire D, CP, CDN;
    output wire Q, QN;
    reg notifier;
    `ifdef NTC
        `ifdef RECREM
            wire CDN_d;
            buf (CDN_i, CDN_d);
        `else 
            buf (CDN_i, CDN);
        `endif 
        wire D_d, CP_d;
        pullup (SDN);
        tsmc_dff (Q_buf, D_d, CP_d, CDN_i, SDN, notifier);
        buf (Q, Q_buf);
        not (QN, Q_buf);
    `else 
        buf (CDN_i, CDN);
        pullup (SDN);
        tsmc_dff (Q_buf, D, CP, CDN_i, SDN, notifier);
        buf (Q, Q_buf);
        not (QN, Q_buf);
    `endif 

  `ifdef TETRAMAX
  `else
    tsmc_xbuf (CDN_SDFCHK, CDN, 1'b1);
    tsmc_xbuf (D_SDFCHK, D, 1'b1);
    tsmc_xbuf (CP_D_SDFCHK, CP_D, 1'b1);
    tsmc_xbuf (CP_nD_SDFCHK, CP_nD, 1'b1);
    tsmc_xbuf (nCP_D_SDFCHK, nCP_D, 1'b1);
    tsmc_xbuf (nCP_nD_SDFCHK, nCP_nD, 1'b1);
    tsmc_xbuf (CDN_D_SDFCHK, CDN_D, 1'b1);
    tsmc_xbuf (CDN_nD_SDFCHK, CDN_nD, 1'b1);
  `endif

    not (nD, D);
    not (nCP, CP);
    and (CP_D, CP, D);
    and (CP_nD, CP, nD);
    and (nCP_D, nCP, D);
    and (nCP_nD, nCP, nD);
    and (CDN_D, CDN, D);
    and (CDN_nD, CDN, nD);

  // Timing logics defined for default constraint check
  buf  (CP_check, CDN_i);
  buf  (D_check, CDN_i);
  `ifdef TETRAMAX
  `else
    tsmc_xbuf (CP_DEFCHK, CP_check, 1'b1);
    tsmc_xbuf (D_DEFCHK, D_check, 1'b1);
  `endif

  `ifdef TETRAMAX
  `else
  specify
    if (CP == 1'b1 && D == 1'b1)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    if (CP == 1'b1 && D == 1'b0)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    if (CP == 1'b0 && D == 1'b1)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    if (CP == 1'b0 && D == 1'b0)
    (negedge CDN => (Q+:1'b0)) = (0, 0);
    (posedge CP => (Q+:D)) = (0, 0);
    if (CP == 1'b1 && D == 1'b1)
    (negedge CDN => (QN-:1'b0)) = (0, 0);
    if (CP == 1'b1 && D == 1'b0)
    (negedge CDN => (QN-:1'b0)) = (0, 0);
    if (CP == 1'b0 && D == 1'b1)
    (negedge CDN => (QN-:1'b0)) = (0, 0);
    if (CP == 1'b0 && D == 1'b0)
    (negedge CDN => (QN-:1'b0)) = (0, 0);
    (posedge CP => (QN-:D)) = (0, 0);
    $width (negedge CDN &&& CP_D_SDFCHK, 0, 0, notifier);
    $width (negedge CDN &&& CP_nD_SDFCHK, 0, 0, notifier);
    $width (negedge CDN &&& nCP_D_SDFCHK, 0, 0, notifier);
    $width (negedge CDN &&& nCP_nD_SDFCHK, 0, 0, notifier);
    $width (posedge CP &&& CDN_D_SDFCHK, 0, 0, notifier);
    $width (negedge CP &&& CDN_D_SDFCHK, 0, 0, notifier);
    $width (posedge CP &&& CDN_nD_SDFCHK, 0, 0, notifier);
    $width (negedge CP &&& CDN_nD_SDFCHK, 0, 0, notifier);
  `ifdef NTC
    `ifdef RECREM
      $setuphold (posedge CP &&& CDN_SDFCHK, posedge D , 0, 0, notifier,,, CP_d, D_d);
      $setuphold (posedge CP &&& CDN_SDFCHK, negedge D , 0, 0, notifier,,, CP_d, D_d);
      $recrem (posedge CDN &&& D_SDFCHK, posedge CP &&& D_SDFCHK, 0,0, notifier, , , CDN_d, CP_d);
    `else
      $setuphold (posedge CP &&& CDN_SDFCHK, posedge D , 0, 0, notifier,,, CP_d, D_d);
      $setuphold (posedge CP &&& CDN_SDFCHK, negedge D , 0, 0, notifier,,, CP_d, D_d);
      $recovery (posedge CDN &&& D_SDFCHK, posedge CP &&& D_SDFCHK, 0, notifier);
      $hold (posedge CP &&& D_SDFCHK, posedge CDN , 0, notifier);
    `endif
  `else
    $setuphold (posedge CP &&& CDN_SDFCHK, posedge D , 0, 0, notifier);
    $setuphold (posedge CP &&& CDN_SDFCHK, negedge D , 0, 0, notifier);
    $recovery (posedge CDN &&& D_SDFCHK, posedge CP &&& D_SDFCHK, 0, notifier);
    $hold (posedge CP &&& D_SDFCHK, posedge CDN , 0, notifier);
  `endif
  endspecify
  `endif
endmodule
`endcelldefine



`celldefine
module MUX2LVTD2 (I0, I1, S, Z);
    input wire I0, I1, S;
    output wire Z;
    tsmc_mux (Z, I0, I1, S);

  specify
    if (I1 == 1'b1 && S == 1'b0)
    (I0 => Z) = (0, 0);
    if (I1 == 1'b0 && S == 1'b0)
    (I0 => Z) = (0, 0);
    if (I0 == 1'b1 && S == 1'b1)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b0 && S == 1'b1)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1)
    (S => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0)
    (S => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine


`celldefine
module MUX4LVTD1 (I0, I1, I2, I3, S0, S1, Z);
    input wire I0, I1, I2, I3, S0, S1;
    output wire Z;
    tsmc_mux (I0_out, I0, I1, S0);
    tsmc_mux (I1_out, I2, I3, S0);
    tsmc_mux (Z, I0_out, I1_out, S1);

  specify
    if (I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b1 && S0 == 1'b0 && S1 == 1'b0)
    (I0 => Z) = (0, 0);
    if (I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b0 && S0 == 1'b0 && S1 == 1'b0)
    (I0 => Z) = (0, 0);
    if (I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b1 && S0 == 1'b0 && S1 == 1'b0)
    (I0 => Z) = (0, 0);
    if (I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b0 && S0 == 1'b0 && S1 == 1'b0)
    (I0 => Z) = (0, 0);
    if (I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b1 && S0 == 1'b0 && S1 == 1'b0)
    (I0 => Z) = (0, 0);
    if (I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b0 && S0 == 1'b0 && S1 == 1'b0)
    (I0 => Z) = (0, 0);
    if (I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b1 && S0 == 1'b0 && S1 == 1'b0)
    (I0 => Z) = (0, 0);
    if (I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b0 && S0 == 1'b0 && S1 == 1'b0)
    (I0 => Z) = (0, 0);
    if (I0 == 1'b1 && I2 == 1'b1 && I3 == 1'b1 && S0 == 1'b1 && S1 == 1'b0)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b1 && I2 == 1'b1 && I3 == 1'b0 && S0 == 1'b1 && S1 == 1'b0)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b1 && I2 == 1'b0 && I3 == 1'b1 && S0 == 1'b1 && S1 == 1'b0)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b1 && I2 == 1'b0 && I3 == 1'b0 && S0 == 1'b1 && S1 == 1'b0)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b0 && I2 == 1'b1 && I3 == 1'b1 && S0 == 1'b1 && S1 == 1'b0)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b0 && I2 == 1'b1 && I3 == 1'b0 && S0 == 1'b1 && S1 == 1'b0)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b0 && I2 == 1'b0 && I3 == 1'b1 && S0 == 1'b1 && S1 == 1'b0)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b0 && I2 == 1'b0 && I3 == 1'b0 && S0 == 1'b1 && S1 == 1'b0)
    (I1 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I3 == 1'b1 && S0 == 1'b0 && S1 == 1'b1)
    (I2 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I3 == 1'b0 && S0 == 1'b0 && S1 == 1'b1)
    (I2 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I3 == 1'b1 && S0 == 1'b0 && S1 == 1'b1)
    (I2 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I3 == 1'b0 && S0 == 1'b0 && S1 == 1'b1)
    (I2 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I3 == 1'b1 && S0 == 1'b0 && S1 == 1'b1)
    (I2 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I3 == 1'b0 && S0 == 1'b0 && S1 == 1'b1)
    (I2 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I3 == 1'b1 && S0 == 1'b0 && S1 == 1'b1)
    (I2 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I3 == 1'b0 && S0 == 1'b0 && S1 == 1'b1)
    (I2 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I2 == 1'b1 && S0 == 1'b1 && S1 == 1'b1)
    (I3 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I2 == 1'b0 && S0 == 1'b1 && S1 == 1'b1)
    (I3 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b1 && S0 == 1'b1 && S1 == 1'b1)
    (I3 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b0 && S0 == 1'b1 && S1 == 1'b1)
    (I3 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b1 && S0 == 1'b1 && S1 == 1'b1)
    (I3 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b0 && S0 == 1'b1 && S1 == 1'b1)
    (I3 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I2 == 1'b1 && S0 == 1'b1 && S1 == 1'b1)
    (I3 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I2 == 1'b0 && S0 == 1'b1 && S1 == 1'b1)
    (I3 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b1 && S1 == 1'b1)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b1 && S1 == 1'b1)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b1 && S1 == 1'b1)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b1 && S1 == 1'b0)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b0 && S1 == 1'b0)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b0 && S1 == 1'b0)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b1 && S1 == 1'b1)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b1 && S1 == 1'b0)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b0 && S1 == 1'b1)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b0 && S1 == 1'b1)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b1 && S1 == 1'b0)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b0 && S1 == 1'b0)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b0 && S1 == 1'b1)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b0 && S1 == 1'b0)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b1 && S1 == 1'b0)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b0 && S1 == 1'b1)
    (S0 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b1 && S0 == 1'b1)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b1 && S0 == 1'b1)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b1 && S0 == 1'b1)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b1 && S0 == 1'b1)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b1 && S0 == 1'b0)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b0 && S0 == 1'b0)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b1 && S0 == 1'b0)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b0 && I2 == 1'b1 && I3 == 1'b0 && S0 == 1'b0)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b0 && S0 == 1'b1)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b0 && S0 == 1'b1)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b1 && I3 == 1'b0 && S0 == 1'b1)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b0 && I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b0 && S0 == 1'b1)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b1 && S0 == 1'b0)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b1 && I2 == 1'b0 && I3 == 1'b0 && S0 == 1'b0)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b1 && S0 == 1'b0)
    (S1 => Z) = (0, 0);
    if (I0 == 1'b1 && I1 == 1'b0 && I2 == 1'b0 && I3 == 1'b0 && S0 == 1'b0)
    (S1 => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


primitive tsmc_mux (q, d0, d1, s);
   output q;
   input s, d0, d1;

   table
   // d0  d1  s   : q 
      0   ?   0   : 0 ;
      1   ?   0   : 1 ;
      ?   0   1   : 0 ;
      ?   1   1   : 1 ;
      0   0   x   : 0 ;
      1   1   x   : 1 ;
   endtable
endprimitive

primitive tsmc_dla (q, d, e, cdn, sdn, notifier);
   output q;
   reg q;
   input d, e, cdn, sdn, notifier;
   table
   1  1   1   ?   ?   : ?  :  1  ; // Latch 1
   0  1   ?   1   ?   : ?  :  0  ; // Latch 0
   0 (10) 1   1   ?   : ?  :  0  ; // Latch 0 after falling edge
   1 (10) 1   1   ?   : ?  :  1  ; // Latch 1 after falling edge
   *  0   ?   ?   ?   : ?  :  -  ; // no changes
   ?  ?   ?   0   ?   : ?  :  1  ; // preset to 1
   ?  0   1   *   ?   : 1  :  1  ;
   1  ?   1   *   ?   : 1  :  1  ;
   1  *   1   ?   ?   : 1  :  1  ;
   ?  ?   0   1   ?   : ?  :  0  ; // reset to 0
   ?  0   *   1   ?   : 0  :  0  ;
   0  ?   *   1   ?   : 0  :  0  ;
   0  *   ?   1   ?   : 0  :  0  ;
   ?  ?   ?   ?   *   : ?  :  x  ; // toggle notifier
   endtable
endprimitive

primitive tsmc_xbuf (o, i, dummy);
   output o;     
   input i, dummy;
   table         
   // i dummy : o
      0   1   : 0 ;
      1   1   : 1 ;
      x   1   : 1 ;
   endtable      
endprimitive 
primitive tsmc_dff (q, d, cp, cdn, sdn, notifier);
   output q;
   input d, cp, cdn, sdn, notifier;
   reg q;
   table
      ?   ?   0   ?   ? : ? : 0 ; // CDN dominate SDN
      ?   ?   1   0   ? : ? : 1 ; // SDN is set   
      ?   ?   1   x   ? : 0 : x ; // SDN affect Q
      ?   ?   1   x   ? : 1 : 1 ; // Q=1,preset=X
      ?   ?   x   1   ? : 0 : 0 ; // Q=0,clear=X
      0 (01)  ?   1   ? : ? : 0 ; // Latch 0
      0 (0x)  1   1   ? : ? : x ; // Weak clock
      0   0   ?   1   ? : 0 : 0 ; // Keep 0 (D==Q)
      1 (01)  1   ?   ? : ? : 1 ; // Latch 1   
      1 (0x)  1   ?   ? : ? : x ; // Weak clock
      1   0   1   ?   ? : 1 : 1 ; // Keep 1 (D==Q)
      ? (1?)  1   1   ? : ? : - ; // ignore negative edge of clock
      ?   0   1   1   ? : ? : - ; // ignore low-level clock
      ?   ? (?1)  1   ? : ? : - ; // ignore positive edge of CDN
      ?   ?   1 (?1)  ? : ? : - ; // ignore posative edge of SDN
      *   ?   1   1   ? : ? : - ; // ignore data change on steady clock
      ?   ?   ?   ?   * : ? : x ; // timing check violation
   endtable
endprimitive

`celldefine
module NR2LVTD0 (A1, A2, ZN);
    input wire A1, A2;
    output wire ZN;
    or (I0_out, A1, A2);
    not (ZN, I0_out);

  specify
    (A1 => ZN) = (0, 0);
    (A2 => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module OAI221LVTD0 (A1, A2, B1, B2, C, ZN);
    input wire A1, A2, B1, B2, C;
    output wire ZN;
    or (I0_out, A1, A2);
    or (I1_out, B1, B2);
    and (I2_out, I0_out, I1_out, C);
    not (ZN, I2_out);

  specify
    if (A2 == 1'b0 && B1 == 1'b1 && B2 == 1'b1 && C == 1'b1)
    (A1 => ZN) = (0, 0);
    if (A2 == 1'b0 && B1 == 1'b1 && B2 == 1'b0 && C == 1'b1)
    (A1 => ZN) = (0, 0);
    if (A2 == 1'b0 && B1 == 1'b0 && B2 == 1'b1 && C == 1'b1)
    (A1 => ZN) = (0, 0);
    if (A1 == 1'b0 && B1 == 1'b1 && B2 == 1'b1 && C == 1'b1)
    (A2 => ZN) = (0, 0);
    if (A1 == 1'b0 && B1 == 1'b1 && B2 == 1'b0 && C == 1'b1)
    (A2 => ZN) = (0, 0);
    if (A1 == 1'b0 && B1 == 1'b0 && B2 == 1'b1 && C == 1'b1)
    (A2 => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b1 && B2 == 1'b0 && C == 1'b1)
    (B1 => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0 && B2 == 1'b0 && C == 1'b1)
    (B1 => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1 && B2 == 1'b0 && C == 1'b1)
    (B1 => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b1 && B1 == 1'b0 && C == 1'b1)
    (B2 => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0 && B1 == 1'b0 && C == 1'b1)
    (B2 => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1 && B1 == 1'b0 && C == 1'b1)
    (B2 => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b1 && B1 == 1'b1 && B2 == 1'b1)
    (C => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b1 && B1 == 1'b1 && B2 == 1'b0)
    (C => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b1 && B1 == 1'b0 && B2 == 1'b1)
    (C => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0 && B1 == 1'b1 && B2 == 1'b1)
    (C => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0 && B1 == 1'b1 && B2 == 1'b0)
    (C => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0 && B1 == 1'b0 && B2 == 1'b1)
    (C => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1 && B1 == 1'b1 && B2 == 1'b1)
    (C => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1 && B1 == 1'b1 && B2 == 1'b0)
    (C => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1 && B1 == 1'b0 && B2 == 1'b1)
    (C => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module AOI22LVTD0 (A1, A2, B1, B2, ZN);
    input wire A1, A2, B1, B2;
    output wire ZN;
    and (I0_out, A1, A2);
    and (I1_out, B1, B2);
    or (I2_out, I0_out, I1_out);
    not (ZN, I2_out);

  specify
    if (A2 == 1'b1 && B1 == 1'b1 && B2 == 1'b0)
    (A1 => ZN) = (0, 0);
    if (A2 == 1'b1 && B1 == 1'b0 && B2 == 1'b1)
    (A1 => ZN) = (0, 0);
    if (A2 == 1'b1 && B1 == 1'b0 && B2 == 1'b0)
    (A1 => ZN) = (0, 0);
    if (A1 == 1'b1 && B1 == 1'b1 && B2 == 1'b0)
    (A2 => ZN) = (0, 0);
    if (A1 == 1'b1 && B1 == 1'b0 && B2 == 1'b1)
    (A2 => ZN) = (0, 0);
    if (A1 == 1'b1 && B1 == 1'b0 && B2 == 1'b0)
    (A2 => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0 && B2 == 1'b1)
    (B1 => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1 && B2 == 1'b1)
    (B1 => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b0 && B2 == 1'b1)
    (B1 => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0 && B1 == 1'b1)
    (B2 => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1 && B1 == 1'b1)
    (B2 => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b0 && B1 == 1'b1)
    (B2 => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module OA21LVTD0 (A1, A2, B, Z);
    input wire A1, A2, B;
    output wire Z;
    or (I0_out, A1, A2);
    and (Z, I0_out, B);

  specify
    (A1 => Z) = (0, 0);
    (A2 => Z) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b1)
    (B => Z) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0)
    (B => Z) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1)
    (B => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module AO22LVTD0 (A1, A2, B1, B2, Z);
    input wire A1, A2, B1, B2;
    output wire Z;
    and (I0_out, A1, A2);
    and (I1_out, B1, B2);
    or (Z, I0_out, I1_out);

  specify
    if (A2 == 1'b1 && B1 == 1'b1 && B2 == 1'b0)
    (A1 => Z) = (0, 0);
    if (A2 == 1'b1 && B1 == 1'b0 && B2 == 1'b1)
    (A1 => Z) = (0, 0);
    if (A2 == 1'b1 && B1 == 1'b0 && B2 == 1'b0)
    (A1 => Z) = (0, 0);
    if (A1 == 1'b1 && B1 == 1'b1 && B2 == 1'b0)
    (A2 => Z) = (0, 0);
    if (A1 == 1'b1 && B1 == 1'b0 && B2 == 1'b1)
    (A2 => Z) = (0, 0);
    if (A1 == 1'b1 && B1 == 1'b0 && B2 == 1'b0)
    (A2 => Z) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0 && B2 == 1'b1)
    (B1 => Z) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1 && B2 == 1'b1)
    (B1 => Z) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b0 && B2 == 1'b1)
    (B1 => Z) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0 && B1 == 1'b1)
    (B2 => Z) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1 && B1 == 1'b1)
    (B2 => Z) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b0 && B1 == 1'b1)
    (B2 => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module IAO21LVTD0 (A1, A2, B, ZN);
    input A1, A2, B;
    output ZN;
    not (I0_out, A1);
    not (I1_out, A2);
    and (I2_out, I1_out, I0_out);
    or (Z, I2_out, B);
    not (ZN, Z);

  specify
    (A1 => ZN) = (0, 0);
    (A2 => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b1)
    (B => ZN) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0)
    (B => ZN) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1)
    (B => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module AO21LVTD0 (A1, A2, B, Z);
    input A1, A2, B;
    output Z;
    and (I0_out, A1, A2);
    or (Z, I0_out, B);

  specify
    (A1 => Z) = (0, 0);
    (A2 => Z) = (0, 0);
    if (A1 == 1'b1 && A2 == 1'b0)
    (B => Z) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b1)
    (B => Z) = (0, 0);
    if (A1 == 1'b0 && A2 == 1'b0)
    (B => Z) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module NR4LVTD0 (A1, A2, A3, A4, ZN);
    input A1, A2, A3, A4;
    output ZN;
    or (I0_out, A1, A2, A3, A4);
    not (ZN, I0_out);

  specify
    (A1 => ZN) = (0, 0);
    (A2 => ZN) = (0, 0);
    (A3 => ZN) = (0, 0);
    (A4 => ZN) = (0, 0);
  endspecify
endmodule
`endcelldefine

`celldefine
module TIEHLVT (Z);
    output Z;
    buf (Z, 1'b1);

endmodule
`endcelldefine

`celldefine
module TIELLVT (ZN);
    output ZN;
    buf (ZN, 1'b0);

endmodule
`endcelldefine
