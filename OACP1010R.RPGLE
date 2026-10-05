1.0	60926	      *  <?xml version="1.0" encoding="ISO-8859-1" ?>
2.0	60926	      * - <header>
3.0	60926	      * <Title>Coupon Data, Contracts and Coupon Items</Title>
4.0	60926	      * <Description>This program allows Maintenance of coupon data, items that will be
5.0	60926	      *              associated to coupon and contracts that will be associated to coupon.
6.0	60926	      * </Description>
7.0	60926	      * - <object>
8.0	60926	      * <Serial_Number>000001</Serial_Number>
9.0	250127	      * <Name>OACP1010R</Name>
10.0	250128	      * <Type>SQLRPGLE Module</Type>
11.0	60926	      * <Application>OA</Application>
12.0	60926	      * - <version>
13.0	60926	      * <Release>1</Release>
14.0	250205	      * <Service_Pack>1</Service_Pack>
15.0	60926	      * <Fix_Pack>0</Fix_Pack>
16.0	60926	      * <Build>0001</Build>
17.0	60926	      * </version>
18.0	60926	      * </object>
19.0	60926	      *- <Source>
20.0	60926	      *- <creation>
21.0	60926	      *<Author>Bernie Leonardo</Author>
22.0	60926	      *<Date>05162005</Date>
23.0	60926	      *</creation>
24.0	60926	      *- <change>
25.0	60926	      *   <Author>Bernie Leonardo</Author>
26.0	60926	      *   <Date>09262006</Date>
27.0	60926	      *   <Comment>      </Comment>
28.0	60926	      *  </change>
29.0	80528	      *- <change>
30.0	80528	      *   <Author>UST</Author>
31.0	80528	      *   <Date>05282008</Date>
32.0	80528	      *   <Comment>Fixed DCR Fix for OAR_P00003179 - Coupon Group Item </Comment>
33.0	80528	      *  </change>
34.0	81118	      *- <change>
35.0	81118	      *   <Author>PMYERS</Author>
36.0	81118	      *   <Date>11182008</Date>
37.0	81118	      *   <Comment>DCR 3934</Comment>
38.0	81118	      *  </change>
39.0	60926	      *  </Source>
40.0	60926	      *  </header>
41.0	0	      //*********************************************************************
42.0	250127	      //  Program Name   - OACP1010R
43.0	50608	      //  Foreign Display-
44.0	60926	      //  Program Title  - Coupon Maintenance - Coupon Data, Contracts and Coupon Items
45.0	50608	      //  Project #      - PJ010010
46.0	50608	      //  Author         - Bernie Leonardo
47.0	50608	      //  Date Created   - 05/16/2005
48.0	50819	      //  Based On Shell - SLR038 (20041001)
49.0	0	      //*********************************************************************
50.0	50608	      //  Purpose of Program: This program will allow maintenance of coupons
51.0	0	      //*********************************************************************
52.0	0	      //  Other Programs/Systems to Consider:
53.0	0	      //
54.0	0	      //*********************************************************************
55.0	0	      //  Program Narrative:
56.0	0	      //
57.0	0	      //*********************************************************************
58.0	0	      //  Special Testing Notes:
59.0	0	      //
60.0	0	      //*********************************************************************
61.0	50608	      //  Restart Instructions:
62.0	0	      //*********************************************************************
63.0	0	      //  Revisions:
64.0	0	      //
65.0	0	      //     Date      Pgmr    Description of Change               Project #
66.0	60711	      // ----------  --------  ---------------------------------  -----------
67.0	60707	      //07/07/2006  UST       PJ030034    Fixed the below DCRs:
68.0	61108	      //    1. OAR_P00002289: Modified the code to uncomment the procedure
69.0	60707	      //       processScreen6() to enable warning message for funding
70.0	60707	      //       percentage of coupon contracts.
71.0	61108	      //    2. OAR_P00002195: Modified the code to validate the group minimum
72.0	60707	      //       purchase quantity fields to prevent negative entries.
73.0	70503	      //
74.0	70503	      // 05/03/2007  BRAVIND     PJ030005    Fixed the below DCR:
75.0	70503	      // 1. OAR_P00002991: Modified the code to the group minimum purchase
76.0	70503	      //                   quantity validation.
77.0	70503	      //
78.0	80528	      // 05/28/2008  UST         PJ030055    Fixed the below DCR:
79.0	80528	      // 1. OAR_P00003179: Coupon Group Item issue.
80.0	80528	
81.0	80826	      // 08/26/2008  MMUNOZ      PJ030012    Adjusted array dimension to
82.0	80826	      //                                     accomodate tire items
83.0	80918	      // 09/16/2008  KMOORE      PJ030012    Fixed option 5 to display the
84.0	80918	      //                                     Coupon Contract.
85.0	80918	      // 09/18/2008  MMUNOZ      PJ030012    Changed Coupon Tax Code to
86.0	80918	      //                                     Item Tax Code.
87.0	80918	      //                                     Changed Tax Code Prompt.
88.0	90204	      // 01/28/2008  MMUNOZ      PJ030012    Added codes to:
89.0	90204	      //                                      1. Display Rain check UPC number
90.0	90204	      //                                      2. Default Coupon Tax code to
91.0	90204	      //                                         Merch. Item Tax code.
92.0	90313	      // 03/13/2009  BERNIE      PJ030011    Changed Coupon Tax Code to
93.0	90313	      //                                     New Coupon Tax code.
94.0	90313	      //                                     Changed Tax Code Prompt.
95.0	90622	      //
96.0	90622	      // 06/22/2009  MMUNOZ      PJ030012    Changed Coupon-Items screen to be
97.0	90622	      //                                     able to display a max. of 12
98.0	90622	      //                                     items per page.
99.0	90622	      // 
100.0	90622	      //                                     Changed Display Coupon to have
101.0	90622	      //                                     separate display for:
102.0	90622	      //                                       Coupon contract list.
103.0	90622	      //                                       Coupon Items list.
104.0	90622	      //
105.0	90622	      //                                     Changed confirmation display for
106.0	90622	      //                                     Delete Coupon tohave separate
107.0	90622	      //                                     display for:
108.0	90622	      //                                       Coupon contract list.
109.0	90622	      //                                       Coupon Items list.
110.0	91214	      // 12/14/2009  Bernie      PJ030011    Added RecOption as parameter
111.0	91214	      //                                     to procedure SetCouponMaster
112.0	91216	      // 12/16/2009  Bernie      PJ030011    Modify program to be able to
113.0	91216	      //                                     load default Tax code value
114.0	91216	      //                                     based on whether coupon is
115.0	91216	      //                                     Vendor Funded or not.
116.0	100309	      // 03/02/2010  Bernie      PJ030011    Modify program to
117.0	100309	      //                                     1) Set default value of second
118.0	100309	      //                                        description based on contract description
119.0	100309	      //                                     2) Set default value of Margin Distribution
120.0	100309	      //                                        code to CPN
121.0	100309	      //                                     3) Set default value of Tax code based
122.0	100309	      //                                        item(s) linked to contract
123.0	100409	      //                                     4) Set default Qty Limit to 99
124.0	100309	      //                                        when coupontype on contract is IRC
125.0	100409	      //                                     5) Set default Qty Limit to 01
126.0	100309	      //                                        when coupontype on contract is PAPER
127.0	100309	      //                                     6) Automatically load items from
128.0	100309	      //                                        contract to coupon - (Add mode)
129.0	100309	      //                                     7) Added following function keys
130.0	100309	      //                                        F17=Top, F18=Bottom, F24=More keys
131.0	100309	      //                                        and F19=Add Item from Contract (CHANGE Mode)
132.0	100421	      // 04/20/2010  Bernie      PJ030011    Modify program to
133.0	100421	      //                                     1) Get defult tax code in Add, Change
134.0	100421	      //                                        or Copy mode.
135.0	100421	      //                                     2) Monitor validation rule for Free Item
136.0	100421	      //                                        coupon type.
137.0	100506	      // 05/06/2010  Bernie      PJ030011    Modify program to
138.0	100506	      //                                     1) Add error handling for Free Item type
139.0	100506	      //                                        of coupon
140.0	100506	      //                                     2) Fixed F16 (View Coupon location) handling
141.0	100514	      // 05/14/2010  Bernie      PJ030011    Corrected value being passed to fill03YN
142.0	100514	      //                                     after pressing F19 key.
143.0	100525	      // 05/25/2010  Bernie      PJ030011    Modify to be able to handle default tax code
144.0	100525	      // Task 150                            assignment for Costco Funded contracts
145.0	100920	      // 09/20/2010  Bernie      PJ030011    Added call to the following programs
146.0	100920	      //                                      OACP1070R - display overlapping coupons
147.0	100920	      //                                                  between OAR and Legacy
148.0	100920	      //                                      OAR0410 - display list of items on an IRC
149.0	100920	      //                                                coupon and have 2 item link charges.
150.0	110131	      //
151.0	110131	      //  01/31/2011  kpalm       PJ030052    added Rollback logic to testUserAction2
152.0	110131	      //                                      for F_Cancel
153.0	110131	      //
154.0	110719	       //  07/19/2011  LENG        INCW00NF01  getUPCCheckDigit from INS003R006
155.0	110719	       //  -  Add INS003PR copybook.
156.0	110719	       //     - /define type Defintions_INS003
157.0	110719	       //     - /define getUPCCheckDigit_INS003
158.0	110719	       //     - /copy *LIBL/QRPGLESRC, INS003PR
159.0	110719	       //  - Remove getChkDgt prototype definition for ExtPgm INR2811.
160.0	110719	       //  - Change call to getChkDgt to call to getUPCCheckDigit.
161.0	110719	       //    - Parameter field formats and sequence will be unchanged.
162.0	110829	      //
163.0	110829	      //   08/29/2011  TMESSUR     INCW00NF02  Remove reference to INR2811
164.0	160321	      //
165.0	160321	      //   03/21/2016  RSENGOD     USTS0798    Increase Tax Code len in OACPNTAXP.
166.0	160321	      //                                       Increased the work variable
167.0	160321	      //                                       lengths to accommodate the
168.0	160321	      //                                       OACPNTAXP tax field size
169.0	160321	      //                                       increase
170.0	160330	      //
171.0	160421	      //   04/21/2016  UST Global  USTS0803    Split Funded Coupon Project
172.0	160421	      //   - Use Item Tax code for Split funded coupons.
173.0	160421	      //   - Before change: Split funded coupons use the Coupon Tax Code
174.0	160421	      //   - After change: Split funded coupons will use Item Tax code
175.0	161228	      //
176.0	161228	      //  12/28/2016  UST Global  MODP0006   Coupon Sign Disclaimer Project
177.0	161228	      //              - Added new field in the screen - 'Sign Disclaimer'
178.0	161228	      //              - Added logic to validate, populate, create, update and
179.0	161228	      //                and delete the Sign Disclaimer information for IRC
180.0	161228	      //                Coupons.
181.0	161228	      //
182.0	170125	      //
183.0	170127	      //  01/27/2017  UST Global  MODP0006   Coupon Sign Disclaimer Project - CR
184.0	170127	      //              - Changed accepted values for Coupon Disclaimer Flag to
185.0	170127	      //                'Y' or 'N' only.
186.0	170127	      //              - Updated code to create Disclaimer flag record even if
187.0	170127	      //                the flag value is 'N'.
188.0	170127	      //
189.0	170516	      //  05/16/2017  UST Global  MODP0006   Coupon Sign TPD Project
190.0	170516	      //              - Added new field in the screen - 'Show Math'
191.0	170516	      //              - Added logic to validate, populate, create, update and
192.0	170516	      //                and delete the TPD information for IRC
193.0	170516	      //                Coupons.
194.0	170516	      //              - Made changes to display the Sign Disclaimer Field
195.0	170516	      //              - when it is in add mode.
196.0	170516	      //              - Coupons without contract will be decided based on the
197.0	170516	      //              - coupontype id field in coupon location association file OACPNLOCP
198.0	170516	      //              - whether it is an IRC coupon.
199.0	170516	
200.0	200212	      //  02/12/2020  UST Global  MODP0006   STRY0157626 - Change Prompt for Price Field
201.0	200212	      //              - C3PPFLG field is made display only in display file,so removed
202.0	200212	      //              - the corresponding error handling code.
203.0	250303	
204.0	250303	      //  03/03/2025  UST         MODP0006   STRY04353610 -Enhancemnt to add  items
205.0	250303	      //              - to coupon based on category codes
206.0	250331	      //
207.0	250331	      //  03/03/2025  UST         MODP0006   INC6622611 - Fix deleted orphan transactions
208.0	250331	
209.0	260511	      //  04/23/2026  UST         MODP0006   STRY0453745
210.0	260511	      //                                     ENHC0030177-Added the process to ability to
211.0	260511	      //                                     copy/paste locations on the COUPM screen similar to
212.0	260511	      //                                     the process in CONTM option.This process is only for
213.0	260511	      //                                     costco funded coupons.
214.0	250331	      //
215.0	260623	      //  06/23/2026  ASUDHEE     STRY0517437 Canada TPD Migration to OAR
216.0	260623	      //              (UST)
217.0	260623	      //                          - Added a new field in the display - 'Exec Cpn'
218.0	260623	      //                          - Added logic to validate, populate, write and
219.0	260623	      //                            update executive coupon flag information.
220.0	260623	      //
221.0	260623	      //  06/23/2026  APAYYAK     STRY0513241 Canada TPD Migration to OAR
222.0	260623	      //              (UST)
223.0	260623	      //                          - Added new logic for Canada Paper Coupon creation
224.0	260623	      //                          - Added a new field in the display - 'Exception Sign'
225.0	260623	      //                          - Added logic to validate, populate, write and
226.0	260623	      //                            update exception sign flag information.
227.0	260623	      //
228.0	260623	      //  06/23/2026  VIRKAR      STRY0022955 Canada TPD Migration to OAR
229.0	260623	      //              (UST)
230.0	260623	      //                          - Implemented New logic for processing the
231.0	260623	      //                            TAX code field for Canada.
232.0	260623	      //
233.0	260623	      // 06/23/2026  ABADUSH     STRY0513241 Canada TPD Migration to OAR
234.0	260623	      //              (UST)
235.0	260623	      //                          - added logic for Company Number protection as
236.0	260623	      //                            once a Company Number is entered, the Company Number
237.0	260623	      //                            field is protected from editing.
238.0	260623	      //
239.0	260806	      //  08/06/2026  VIRKAR      STRY0022955 Canada TPD Migration to OAR
240.0	260806	      //              (UST)
241.0	260806	      //                          - Vendor-Funded Coupon Creation Rule: Coupons
242.0	260806	      //                            creation allowed with the Contract's Company
243.0	260806	      //                            Regardless of User's Logged-In Session
244.0	260806	      //                            comapny.
245.0	260806	      //
246.0	260924	      //  09/24/2026  ASARAVA     STRY0513241 Canada TPD Migration to OAR
247.0	260924	      //              (UST)
248.0	260924	      //                          - Bug fix INC7728539 - To generate the couponid only
249.0	260924	      //                            when the entered coupon type is valid
250.0	0	      //*********************************************************************
251.0	0	
252.0	0	      // ----------------------------------------------------------------------*
253.0	0	      // Definition Section                                                    *
254.0	0	      // ----------------------------------------------------------------------*
255.0	0	     H DATFMT(*ISO)
256.0	0	     H OPTION(*NODEBUGIO : *SRCSTMT)
257.0	0	     H DFTACTGRP(*NO)
258.0	0	     H ACTGRP(*CALLER)
259.0	50603	     H BNDDIR('PRDBNDDIR')
260.0	0	
261.0	0	      //------------------------------------------------------------------------*
262.0	0	      // Files                                                                  *
263.0	0	      //------------------------------------------------------------------------*
264.0	50608	     FOACP1010D CF   E             WORKSTN USROPN
265.0	0	     F                                     EXTFILE(DSPNAME)
266.0	0	     F                                     INDDS(DispInds)
267.0	0	     F                                     INFDS(DispFlds)
268.0	0	     F                                     SFILE(S02:RrnS02)
269.0	50524	     F                                     SFILE(S03:RrnS03)
270.0	50526	     F                                     SFILE(WS04:RrnS04)
271.0	60426	     F                                     SFILE(WS06:RrnWS06)
272.0	250204	     F                                     SFILE(S05:RrnS05)
273.0	50608	     F                                     ignore(R04)
274.0	0	
275.0	0	      // Files used for validation
276.0	0	
277.0	0	      // ----------------------------------------------------------------------*
278.0	0	      // - External Data Structure Definitions -                               *
279.0	0	      // ----------------------------------------------------------------------*
280.0	0	      // ----------------------------------------------------------------------*
281.0	0	      //  Data Buffers / Used to compare changes for file updates              *
282.0	0	      // ----------------------------------------------------------------------*
283.0	0	
284.0	0	
285.0	0	      // ----------------------------------------------------------------------*
286.0	0	      // - Prototypes -                                                        *
287.0	0	      // ----------------------------------------------------------------------*
288.0	0	      // ----------------------------------------------------------------------*
289.0	0	      // - External Procedures - Define and copy in all external prototypes    *
290.0	0	      // ----------------------------------------------------------------------*
291.0	50921	      /COPY *LIBL/QRPGLECPY,APIERR
292.0	50921	      /COPY *LIBL/QRPGLECPY,QCAPCMD_PR
293.0	50921	      /COPY QGPL/QRPGLECPY,QCMDEXC_P
294.0	60426	
295.0	60426	      /COPY QRPGLECPY,QMHRTVM
296.0	60426	      /DEFINE RTVM0200
297.0	60426	      /COPY QRPGLECPY,QMHRTVMDS
298.0	0	
299.0	0	      /Define GetJobLocT_AIS001
300.0	0	      /Define GetJobLocn_AIS001
301.0	0	      /Define GetJobRegn_AIS001
302.0	0	      /Define GetJobCmpy_AIS001
303.0	0	      /Define GetJobLang_AIS001
304.0	0	      /COPY *libl/QRPGLESRC,AIS001PR
305.0	0	
306.0	110719	      /define typeDefinitions_INS003
307.0	260623	      /define getItemUPCWithoutCheckDigit_INS003
308.0	260623	      /define getUPCCheckDigit_INS003
309.0	110719	      /copy *libl/QRPGLESRC,INS003PR
310.0	110719	
311.0	0	      /Define PutErrMsg_UTS001
312.0	0	      /Define RmvMsgFromQ_UTS001
313.0	0	      /COPY *libl/QRPGLESRC,UTS001PR
314.0	50830	
315.0	50830	      /Define ErrorMessageDS_OAS0000PR
316.0	50831	      /COPY *LIBL/QRPGLESRC,OAS0000PR
317.0	50831	
318.0	50831	      /define CompanyDescDS_OAS0001PR
319.0	50831	      /define CompanyDescDSUI_OAS0001PR
320.0	50831	      /define DeptDescDS_OAS0001PR
321.0	50831	      /define DeptDescDSUI_OAS0001PR
322.0	51011	      /define CouponTaxCodeDescDS_OAS0001PR
323.0	51011	      /define CouponTaxCodeDescDSUI_OAS0001PR
324.0	50916	      /Define BuyerNameDS_OAS0001PR
325.0	50916	      /Define BuyerNameDSUI_OAS0001PR
326.0	50919	      /Define BBAVendNameDS_OAS0001PR
327.0	50919	      /Define BBAVendNameDSUI_OAS0001PR
328.0	51104	      /Define ItemDescriptionDS_OAS0001PR
329.0	51104	      /Define ItemDescriptionDSUI_OAS0001PR
330.0	80919	      /Define GetTaxCodeDS_OAS0001PR
331.0	80919	      /define GetTaxCodeDSUI_OAS0001PR
332.0	161228	      /define CpnDisclaimerDS_OAS0001PR
333.0	161228	      /define CpnDisclaimerDSUI_OAS0001PR
334.0	170516	      /define CpnTPDds_OAS0001PR
335.0	170516	      /define CpnTPDdsUI_OAS0001PR
336.0	50916	      /COPY *libl/QRPGLESRC,OAS0001PR
337.0	50831	
338.0	50920	      /COPY *LIBL/QRPGLECPY,QRCVDTQ_PR
339.0	50920	
340.0	50831	      /define StandardTableDS_OAS0002PR
341.0	50831	      /define StandardTableDSUI_OAS0002PR
342.0	50831	      /copy *libl/QRPGLESRC,OAS0002PR
343.0	80916	
344.0	80916	      /Define GetContractHeaderRsp_OAS0003PR
345.0	80916	      /define FilterConstants_OAS0003PR
346.0	80916	      /COPY *libl/QRPGLESRC,OAS0003PR
347.0	50831	
348.0	50602	      /Define CouponMWInterface_OAS0004PR
349.0	50808	      /define CouponMasterDS_OAS0004PR
350.0	50808	      /define CouponMasterDSUI_OAS0004PR
351.0	51006	      /define CouponContractDS_OAS0004PR
352.0	50809	      /define CouponContractDSUI_OAS0004PR
353.0	50813	      /define CouponContracAsscDS_OAS0004PR
354.0	51014	      /define CouponContractAsscDSUI_OAS0004PR
355.0	50811	      /define CouponItmAscDS_OAS0004PR
356.0	50811	      /define CouponItmAscDSUI_OAS0004PR
357.0	50819	      /define CouponLocAscDS_OAS0004PR
358.0	50819	      /define CouponLocAscDSUI_OAS0004PR
359.0	50901	      /Define CouponLocItmDS_OAS0004PR
360.0	50901	      /Define CouponLocItmDSUI_OAS0004PR
361.0	50907	      /define CouponGroupDS_OAS0004PR
362.0	50907	      /define CouponGroupDSUI_OAS0004PR
363.0	51103	      /define CouponPOSReqDS_OAS0004PR
364.0	51103	      /define CouponPOSReqDSUI_OAS0004PR
365.0	51209	      /define GetNextFamilyCode_OAS0004
366.0	50812	      /COPY *LIBL/QRPGLESRC,OAS0004PR
367.0	80916	
368.0	100309	      /Define generateCouponUPC_OAS0014
369.0	100309	      /COPY *libl/QRPGLESRC,OAS0014PR
370.0	250204	
371.0	250204	      /define getModeDescription_UTS005
372.0	250204	      /define setCursorToCurrent_UTS005
373.0	250204	      /define setCursorToDefault_UTS005
374.0	250204	      /define setCursorToField_UTS005
375.0	250204	      /define setSubfileToLine_UTS005
376.0	250204	      /copy *libl/QRPGLESRC,UTS005PR
377.0	260623	
378.0	260623	      /Define GetTPDExceptionSign_OAS0001PR
379.0	260623	      /Define IfCNPaperRainCheck_OAS0001PR
380.0	260623	      /Define getCNPaperRainCheck_OAS0001PR
381.0	260623	      /Define getContractCpnType_OAS0001PR
382.0	260623	      /Define getCouponTypebyId_OAS0001PR
383.0	260623	      /Define typeDefinitions_OAS0001PR
384.0	260623	      /COPY *libl/QRPGLESRC,OAS0001PR
385.0	80916	      // =======================================================================
386.0	80916	      // - Data structure definition for mw interface
387.0	80916	      // =======================================================================
388.0	80916	      /define GeneralRequestXMLDS_OAS0024PR
389.0	80916	      /define GeneralResponseXMLDS_OAS0024PR
390.0	80916	      /define GetContractInterface_OAS0024PR
391.0	80916	      /define CLIOperatorConstants_OAS0024PR
392.0	80916	      /define CLIControlConstants_OAS0024PR
393.0	80916	      /define UC29FunctionValues_OAS0024PR
394.0	80916	      /define GetOperatorConstants_OAS0024PR
395.0	80916	      /copy *libl/QRPGLESRC,OAS0024PR
396.0	60217	
397.0	50606	      /Define CvtisotodT6_UTS003
398.0	50606	      /COPY *libl/QRPGLESRC,UTS003PR
399.0	250204	      // ---- UTS006: SQL processing procedures
400.0	250204	      /Define putSQLDiagnostics_UTS006
401.0	250204	      /COPY *libl/QRPGLESRC,UTS006PR
402.0	50824	
403.0	50824	      // Copy Member UTRCPY004:  Global Enterprise-Level Type Definitions
404.0	50824	      /copy *libl/QRPGLESRC,UTRCPY004
405.0	250303	
406.0	250303	     D typeParent      S             10A   based(@)
407.0	250127	
408.0	250128	      // Copy Member UTRCPY007:  Constants for Common SQLCODE Values
409.0	250128	      /copy *libl/QRPGLESRC,UTRCPY007
410.0	250130	      // Copy Member UTRCPY003:  Constants for Display Programs
411.0	250130	      /copy *libl/QRPGLESRC,UTRCPY003
412.0	250130	      // Copy Member UTRCPY005:  Variables for Display Programs
413.0	250130	      /copy *libl/QRPGLESRC,UTRCPY005
414.0	260623	      // Copy Member UTRCPY001:  Variables for Global Constants
415.0	260623	      /copy *libl/QRPGLESRC,UTRCPY001
416.0	250204	
417.0	0	      // ----------------------------------------------------------------------*
418.0	0	      // - Called Programs Prototypes                                          *
419.0	0	      // ----------------------------------------------------------------------*
420.0	0	
421.0	0	      // Help Prototype
422.0	0	     D SeeHelp         PR                  EXTPGM('UTR067')
423.0	0	     D  EprmPgm                      10A   CONST
424.0	0	     D  EprmFld                      10A   CONST OPTIONS(*NOPASS)
425.0	0	     D  EprmLang                      1A   CONST OPTIONS(*NOPASS)
426.0	50801	
427.0	50801	      // Maintain Coupon-Location
428.0	50801	     D MaintainCpnLoc  PR                  EXTPGM('OACP1020R')
429.0	50801	     D  EnOpt                         1A
430.0	50808	     D  EnCpnId                            Like(wkCpnId) const
431.0	51118	     D  EnCpnIdCopy                        Like(wkCpnId) const
432.0	51118	     D                                     Options(*NoPass)
433.0	50801	     D  EnFn                          1A   Options(*NoPass)
434.0	81118	      * ChkFlg's only purpose now is to signal whether to call CHKLOCDATS, so an N
435.0	81118	      * would suffice. But made it 1A in case future use calls for other values.
436.0	81118	     D  ChkFlg                        1A   Options(*NoPass)
437.0	260423	     D  EnContID                           Like(s2ContID) Options(*NoPass)
438.0	260623	      * Added a new parameter Coupon Type for OACP1020R
439.0	260623	     D  P_CpnTyp                      5A   Options(*NoPass)
440.0	80916	     D DspCpnContract  PR                  extpgm('OACT1003R')
441.0	80916	     D   RtKeyPressed                      like(keyPressed)
442.0	80916	     D  EPrmOpt                      10A   Const
443.0	80916	     D   EPrContID                   10I 0
444.0	80916	     D   EPrDesc                     40
445.0	80916	     D   EPrType                      5A
446.0	80916	     D   EPrStDt                       d
447.0	80916	     D   EPrEnDt                       d
448.0	80916	     D   EPrCmpy                           like(typeCompany)
449.0	50921	
450.0	50921	      // Check object
451.0	50921	     D CheckObject     PR             7                                         Check object
452.0	61108	     D  Object                       20    CONST                                   QualIFied file
453.0	0	
454.0	50921	      //Process command
455.0	50921	     D ProcessCmd      PR             7                                         Process command
456.0	50921	     D  Command                     100    CONST                                   Command string
457.0	0	
458.0	0	      // ----------------------------------------------------------------------*
459.0	50825	      // - Prototype Definitions - Internal Procedures
460.0	0	      // ----------------------------------------------------------------------*
461.0	0	
462.0	50825	     D beginProgram    PR
463.0	50825	
464.0	50825	     D clearScreen2    PR
465.0	50825	     D clearScreen3    PR
466.0	50825	     D clearScreen4    PR
467.0	60426	     D clearScreen6    PR
468.0	250211	     D clearScreen8    PR
469.0	50825	
470.0	50825	     D displayPrompt   PR
471.0	50825	     D  dspfRecord                         like(typeObjectName)  const
472.0	50825	     D  dspfField                          like(typeObjectName)  const
473.0	50825	
474.0	50825	     D displayScreen2  PR
475.0	50825	     D displayScreen3  PR
476.0	50825	     D displayScreen4  PR
477.0	60426	     D displayScreen6  PR
478.0	250123	     D displayScreen7  PR
479.0	50825	
480.0	50825	     D endProgram      PR
481.0	50825	
482.0	50825	     D loadScreen2     PR
483.0	50825	     D loadScreen3     PR
484.0	50825	     D loadScreen4     PR
485.0	60426	     D loadScreen6     PR
486.0	50825	
487.0	50825	     D loopSubfile2    PR
488.0	50825	     D loopSubfile3    PR
489.0	61101	     D loopSubfile3a   PR
490.0	51027	     D moveS03fields   PR
491.0	61101	     D moveS03fieldsa  PR
492.0	50825	     D loopSubfile4    PR
493.0	61108	     D loopSubfile4a   PR
494.0	60109	
495.0	60109	     D updateSubfile3  PR
496.0	50825	
497.0	50825	     D loadScreenFields2...
498.0	50825	     D                 PR
499.0	50825	     D loadScreenFields3...
500.0	50825	     D                 PR
501.0	50825	     D loadScreenFields4...
502.0	50825	     D                 PR
503.0	50825	
504.0	50825	     D processScreen2  PR
505.0	50825	     D processScreen3  PR
506.0	50825	     D processScreen4  PR
507.0	60426	     D processScreen5  PR
508.0	60426	     D processScreen6  PR
509.0	50825	
510.0	50825	     D resetErrors     PR
511.0	50825	
512.0	50825	     D testUserAction2...
513.0	50825	     D                 PR
514.0	50825	     D testUserAction3...
515.0	50825	     D                 PR
516.0	50825	     D testUserAction4...
517.0	50825	     D                 PR
518.0	60426	     D testUserAction6...
519.0	60426	     D                 PR
520.0	50825	
521.0	250123	     D testUserAction7...
522.0	250123	     D                 PR
523.0	50825	     D validateControlFields3...
524.0	50825	     D                 PR
525.0	50825	     D validateInput2  PR
526.0	50825	     D validateInput3  PR
527.0	50825	     D validateInput4  PR
528.0	0	
529.0	0	      //  CALLP   SetCsrPos('50')
530.0	0	      //  CALLP   SetCsrPos('Y')
531.0	0	      //  CALLP   SetCsrPos
532.0	0	     D SetCsrPos       PR
533.0	0	     D  SetCsr                        2A   VALUE OPTIONS(*NOPASS)
534.0	50804	
535.0	50804	      // Commit Table Changes
536.0	50804	     D CommitChanges   PR             1n
537.0	50810	
538.0	50810	      // Get Coupon
539.0	50810	     D GetCoupon       PR                  like(WkAct#ofrows)
540.0	50810	     D  PrOperator                         like(operator)  const
541.0	50810	     D  PrCpnId                            like(wkCpnID) const
542.0	50804	
543.0	50606	      // Write coupon record with minimum data
544.0	51020	     D PutCouponMaster...
545.0	51020	     D                 PR             1n
546.0	50606	     D  PrOperator                         like(Operator)
547.0	50606	     D                                     const
548.0	50808	     D  prCouponMasterDS...
549.0	50808	     D                                     likeds(CouponMasterDS)
550.0	50808	     D                                     const
551.0	91214	     D  PrRecOption                        like(RecOption)
552.0	91214	     D                                     const
553.0	50606	      //
554.0	50602	     D LoadDftCpnData  PR
555.0	50602	
556.0	50602	      //
557.0	50602	     D PrepCpnData     PR
558.0	50920	
559.0	50920	      //
560.0	50921	     D GetDtaqData     PR
561.0	51013	     D GetContractDtaqData...
562.0	51013	     D                 PR
563.0	50606	
564.0	50606	      // Write Coupon-Coupon Contract Association
565.0	50804	     D PutCouponContractAssoc...
566.0	50804	     D                 PR             1n
567.0	50606	     D  PrOperator                         like(Operator)
568.0	50606	     D                                     const
569.0	51025	     D  PrRecOption                        like(RecOption)
570.0	51025	     D                                     const
571.0	50813	     D  prCpnCntAscDS                      likeds(CouponContracAsscDS)
572.0	50813	     D                                     const
573.0	50606	
574.0	50914	      // Check Coupon-Coupon Contract Association Business Rules
575.0	50914	     D CheckCouponContractAssoc...
576.0	50914	     D                 PR             1n
577.0	50914	     D  PrOperator                         like(Operator)
578.0	50914	     D                                     const
579.0	50914	     D  prCpnCntAscDS                      likeds(CouponContracAsscDS)
580.0	50914	     D                                     const
581.0	50914	
582.0	50606	      // Write Coupon-Item Association
583.0	50803	     D PutCouponItemAssoc...
584.0	50803	     D                 PR             1n
585.0	50606	     D  PrOperator                         like(Operator)
586.0	50606	     D                                     const
587.0	50811	     D  prCouponItmAscDS...
588.0	50811	     D                                     likeds(CouponItmAscDS)
589.0	50811	     D                                     const
590.0	100309	
591.0	100309	      // Write Auto Coupon-Item Association
592.0	100309	     D PutCouponItemAssocAuto...
593.0	100309	     D                 PR
594.0	50811	
595.0	51103	      // Write POS maintenance data
596.0	51103	     D PutPOSMaintenance...
597.0	51103	     D                 PR             1n
598.0	51103	     D  PrOperator                         like(Operator)
599.0	51103	     D                                     const
600.0	51103	     D  prCouponPOSReqDS...
601.0	51103	     D                                     likeds(CouponPOSReqDS)
602.0	51103	     D                                     const
603.0	80916	
604.0	80916	     D DisplayContract...
605.0	80916	     D                 PR
606.0	80916	     D  pContractID                  10I 0
607.0	80916	     D  pOpt                         10a   value
608.0	80916	
609.0	80916	     D GetContract     PR            10I 0
610.0	80916	     D  pFunction                    20a   value
611.0	80916	     D  pOperator                    20a   value
612.0	80916	     D  NumberRequested...
613.0	80916	     D                               10I 0 value
614.0	80916	     D  RecOption                    20a   Options(*nopass:*omit)
615.0	80916	     D  pSQLFilter                         LikeDS(SQLFilter)
616.0	80916	     D                                     Options(*nopass:*omit)
617.0	80916	     D  pSQLSort                           LikeDS(SQLSort)
618.0	80916	     D                                     Options(*nopass:*omit)
619.0	80916	     D
620.0	51103	
621.0	50701	      // Get Coupon-Coupon Contract Association
622.0	51014	     D GetCouponContract...
623.0	50701	     D                 PR                  like(wkAct#ofrows)
624.0	50808	     D  PrCpnId                            like(wkCpnId) const
625.0	50811	     D  PrOperator                         like(Operator) const
626.0	50811	
627.0	50811	      // Get Coupon Item Association
628.0	50811	     D GetCouponItemAssoc...
629.0	50811	     D                 PR                  like(wkAct#ofrows)
630.0	50811	     D  PrCpnId                            like(wkCpnId) const
631.0	50811	     D  PrOperator                         like(Operator) const
632.0	50606	
633.0	50701	      // Get Coupon Contract Item Association
634.0	50803	     D GetContractItemAssoc...
635.0	50701	     D                 PR                  like(wkAct#ofrows)
636.0	50808	     D  PrCpnId                            like(wkCpnId) const
637.0	50819	
638.0	50819	     D GetCouponLocAsc...
639.0	50819	     D                 PR                  like(wkAct#ofrows)
640.0	50819	     D prOperator                           like(Operator) const
641.0	50819	     D prCpnId                              like(wkCpnId)  const
642.0	51026	
643.0	51026	     D LoadCouponGroup...
644.0	51026	     D                 PR
645.0	50701	
646.0	50907	     D GetCouponGroup...
647.0	50907	     D                 PR                   like(wkAct#ofrows)
648.0	51026	     D prCouponID...
649.0	51026	     D                                      like(typeCouponId) const
650.0	50907	     D prOperator                           like(Operator) const
651.0	50907	
652.0	50907	     D PutCouponGroup...
653.0	50907	     D                 PR              n
654.0	50907	     D prOperator                           like(Operator) const
655.0	50907	     D prCouponGroupDS...
656.0	50907	     D                                      likeds(CouponGroupDS) const
657.0	50901	
658.0	50807	     D UpdContractS02Flds...
659.0	50701	     D                 PR
660.0	50810	
661.0	50819	     D DeleteCoupon...
662.0	50819	     D                 PR
663.0	50928	
664.0	50928	     D ReactivateCoupon...
665.0	50928	     D                 PR
666.0	51103	
667.0	51103	     D SendPOSMaintenance...
668.0	51103	     D                 PR
669.0	50831	
670.0	50831	     D GetCompanyDescription...
671.0	50831	     D                 PR                  like(wkAct#ofrows)
672.0	50831	     D prCompany#                          like(typeCompany) const
673.0	50831	
674.0	50831	     D GetDepartmentDescription...
675.0	50831	     D                 PR                  like(wkAct#ofrows)
676.0	51107	     D prDepartment#                       like(c3POSDept) const
677.0	51011	
678.0	51011	     D GetTaxCodeDescription...
679.0	51011	     D                 PR                  like(wkAct#ofrows)
680.0	51011	     D prTaxCode                           like(C3CPNTAXC) const
681.0	50916	
682.0	50916	     D GetBuyerName    PR                  like(wkAct#ofrows)
683.0	50919	     D prBuyerNumber                       like(TypeBuyerNumber) const
684.0	50919	     D prCompany#                          like(TypeCompany) const
685.0	50919	
686.0	50919	     D GetBBAVendorName...
687.0	50919	     D                 PR                  like(wkAct#ofrows)
688.0	50919	     D prBBAVendor#                        like(TypeVendor#) const
689.0	50919	     D prBBAVendorSuffix...
690.0	50919	     D                                     like(TypeVendorSuffix) const
691.0	50812	
692.0	50831	     D getCodeDescription...
693.0	50831	     D                 PR              N
694.0	50831	     D  PrCode                             like(TableDS.Code) const
695.0	50831	     D  PrTableName                  10a   const
696.0	51104	
697.0	51104	     D GetItemDescription...
698.0	51104	     D                 PR                  like(wkAct#ofrows)
699.0	51104	     D prCompanyNumber...
700.0	51104	     D                                     like(C3CmyNbr) const
701.0	51104	     D prItemNumber                        like(S3ItmNbr) const
702.0	161228	
703.0	161228	     D getCouponDisclaimerFlag...
704.0	161228	     D                 PR                  like(wkAct#ofrows)
705.0	161228	     D prCouponId                          like(typeCouponId) const
706.0	161228	
707.0	161228	     D CallPutCouponDisclaimer...
708.0	161228	     D                 PR             1n
709.0	161228	
710.0	161228	     D PutCouponDisclaimer...
711.0	161228	     D                 PR             1n
712.0	161228	     D  PrOperator                         like(Operator)
713.0	161228	     D                                     const
714.0	161228	     D  prCpnDisclaimerDS...
715.0	161228	     D                                     likeds(CpnDisclaimerDS)
716.0	161228	     D                                     const
717.0	161228	     D  PrRecOption                        like(RecOption)
718.0	161228	     D                                     const
719.0	170516	
720.0	170516	     D getCouponTPDFlag...
721.0	170516	     D                 PR                  like(wkAct#ofrows)
722.0	170516	     D prCouponId                          like(typeCouponId) const
723.0	170516	
724.0	170516	     D CallPutCouponTPD...
725.0	170516	     D                 PR             1n
726.0	170516	
727.0	170516	     D PutCouponTPD...
728.0	170516	     D                 PR             1n
729.0	170516	     D  PrOperator                         like(Operator)
730.0	170516	     D                                     const
731.0	170516	     D  prCpnTPDds...
732.0	170516	     D                                     likeds(CpnTPDds)
733.0	170516	     D                                     const
734.0	170516	     D  PrRecOption                        like(RecOption)
735.0	170516	     D                                     const
736.0	170516	     D IsCostcoFundedIRCCoupon...
737.0	170516	     D                 PR             1n   extproc('IsCostcoFundedIRCCoupon-
738.0	170516	     D                                     _OAS0001PR')
739.0	170516	     D prCouponID                          like(typeCouponId) const
740.0	60221	
741.0	60221	     D CheckCouponContract...
742.0	60221	     D                 PR
743.0	50919	
744.0	50914	     D CheckContractMsgs...
745.0	50914	     D                 PR
746.0	50919	
747.0	50914	     D CheckCouponMsgs...
748.0	50914	     D                 PR
749.0	50919	
750.0	50914	     D CheckItemAssocMsgs...
751.0	50914	     D                 PR
752.0	60223	
753.0	60223	     D ResetContracts  PR
754.0	60223	     D   PrMode                            Like(s2Mode) const
755.0	50831	
756.0	50916	      // Set/RollBack Environment
757.0	50916	     D SetEnvironment  PR             1n
758.0	50916	     D  PrFunction                         like(Function)
759.0	50916	     D                                     const
760.0	91215	
761.0	91215	     D getDefaultTaxCode...
762.0	91215	     D                 PR
763.0	50916	
764.0	100920	     D checkOverlap    PR
765.0	0	      // ----------------------------------------------------------------------*
766.0	0	      // System Data Structures                                                *
767.0	0	      //-----------------------------------------------------------------------*
768.0	0	
769.0	0	      // Program Status DS
770.0	0	     D                SDS
771.0	0	     D  SDPgm            *PROC
772.0	0	     D SDExcp                 91    170
773.0	0	
774.0	0	      //------------------------------------------------------------------------*
775.0	0	      // - Internal Data Structure Definitions -                                *
776.0	0	      // -----------------------------------------------------------------------*
777.0	260623	
778.0	50808	     D CpnMasterDS     DS                  LikeDS(CouponMasterDS)
779.0	50811	
780.0	50811	     D CpnMasterDS2    DS                  LikeDS(CouponMasterDS)
781.0	50811	
782.0	50811	     D CpnItmAscDS     DS                  LikeDS(CouponItmAscDS)
783.0	50813	
784.0	50813	     D CpnCntAscDS     DS                  LikeDS(CouponContracAsscDS)
785.0	50607	
786.0	50908	     D CpnLocAscDS     DS                  LikeDS(CouponLocAscDS)
787.0	50908	
788.0	50908	     D CpnGroupDS      DS                  LikeDS(CouponGroupDS)
789.0	51025	
790.0	51103	     D CpnPOSReqDS     DS                  LikeDS(CouponPOSReqDS)
791.0	51103	
792.0	51108	     D wkErrorMsgDS    DS                  LikeDS(ErrorMsgDS) occurs(9999)
793.0	60511	
794.0	60511	     D s3Err           DS
795.0	60511	     D  s3OptError                     N
796.0	60511	     D  s3FreeItemError...
797.0	60511	     D                                 N
798.0	60511	     D  s3GroupNumberError...
799.0	60511	     D                                 N
800.0	60426	
801.0	60426	     D warningMessagesDS...
802.0	60426	     D                 DS                  occurs(40)
803.0	60426	     D  wkMessage                          like(s6Message)
804.0	60426	     D  wkMsgId                            like(s6MsgId)
805.0	50819	
806.0	80826	     D   w3ITMNBR      S                   Like(s3ITMNBR) Dim(9999)
807.0	80826	     D   w3GRP#        S                   Like(s4GRP#)   Dim(9999) Inz(*hival)
808.0	50607	
809.0	50909	     D  w4GRP#         S                   Like(s4GRP#)  Dim(99) Inz(*Hival)
810.0	51026	     D  w4POSGRP#      S                   Like(CouponGroupDS.CouponGroupNumber)
811.0	51026	     D                                     Dim(99) Inz(*Hival)
812.0	61108	     D  w4gmpq         S                   Like(s4GMPQ)  Dim(99)
813.0	61108	     D  w4gmpq2        S                   Like(s4GMPQ)  Dim(99)
814.0	50913	     D  w4GrpId        S                   Like(s4GrpId) Dim(99) Inz(*Hival)
815.0	50912	     D  w4Mode         S                   Like(s4Mode) Dim(99)
816.0	61108	     D  w4OldRcd       S               N   Dim(99) Inz(False)
817.0	61109	     D  w4Stat         S                   Like(s3Stat) Dim(99) Inz(*Hival)
818.0	50810	
819.0	50810	     D  w2Contid       S                   Like(s2ContID) Dim(99) Inz(*Hival)
820.0	50810	     D  w2mode         S                   Like(s2mode) Dim(99)
821.0	51003	
822.0	51003	     D  ReloadS02      S                   Like(s2ContID) Dim(99) Inz(*Hival)
823.0	60221	     D  ReloadS02Mode  S                   Like(s2Mode) Dim(99) Inz
824.0	51110	     D  DuplicateS02   S                   Like(s2ContID) Dim(99) Inz(*Hival)
825.0	51017	     D  ErrContract#   S                   Like(s2ContID) Dim(99) Inz(*Hival)
826.0	60223	     D  RollbackCnt#   S                   Like(s2CpnCntID) Dim(99) Inz(*Hival)
827.0	60223	     D  RollbackMode   S                   Like(s2Mode) Dim(99) Inz
828.0	260623	
829.0	260623	     D wkupcnbr        S                   Like(C3UPCNBR)
830.0	260623	     D wkrckupc        S                   Like(C3rckupc)
831.0	260623	     D EnCpnTyp        S              5A
832.0	260623	     D TempID          S             10I 0
833.0	260623	     D wkCpnTyp        S              5A
834.0	260623	     D S2wkCpntyp      S                   like(C2CPNTYP)
835.0	260623	     D chkChar         S              1A
836.0	260924	     D CostcoFunded    S              1A
837.0	51003	     D CpnLocItmDS     DS                  likeDS(CouponLocItmDS)
838.0	0	
839.0	91215	     D cntItemTaxCdeDS...
840.0	91215	     D                 DS                  occurs(27)
841.0	91216	     D  xCouponId                    10I 0
842.0	91216	     D  xItemNumber                   9P 0
843.0	91216	     D  xItemTaxCode                 15A
844.0	100309	     D  xCouponTaxCode...
845.0	100309	     D                               15A
846.0	250131	      // Number of Records per Subfile Page (SFLPAG * #lines per subfile entry)
847.0	250131	      // { Change this to match the number of lines on your subfile page.      }
848.0	250131	      // { This value coincides with the blocking factor for block SQL FETCH.  }
849.0	250131	     D S05_RECORDS_PER_PAGE...
850.0	250225	     D                 C                   17
851.0	250204	     D CURSOR_ITEM_CATEGORY_CURSOR...
852.0	250204	     D                 C                   1
853.0	250204	     D TOTAL_CURSORS   C                   1
854.0	250130	      // =======================================================================
855.0	250130	      // This dimensionalized data structure allows for blocked SQL fetches from
856.0	250130	      // the database.
857.0	250130	      // =======================================================================
858.0	250130	     D itemCategoryBlock...
859.0	250131	     D                 DS                  dim(S05_RECORDS_PER_PAGE)
860.0	250130	     D                                     qualified
861.0	250130	     D  c1ItemNbr                     9  0
862.0	250131	     D  c1Code                        3A
863.0	250130	     D  c1ItmDesc                    40A
864.0	250303	
865.0	250130	     D itemCategoryBlockNulls...
866.0	250130	     D                 DS                  dim(S05_RECORDS_PER_PAGE) qualified
867.0	250204	     D  nulls                         4B 0 dim(3) inz(NOT_NULL)
868.0	250130	
869.0	250130	     D itemCategoryBlockNullsDS...
870.0	250130	     D                 DS                  based(itemCategoryBlockNullsDS__)
871.0	250130	     D                                     qualified
872.0	250204	     D  c1ItemNbr                     4B 0
873.0	250204	     D  c1Code                        4B 0
874.0	250204	     D  c1ItmDesc                     4B 0
875.0	250204	      // Copy Member UTRCPY006:  Boolean Array - Rename Indicators 01..99
876.0	250204	      /copy *libl/QRPGLESRC,UTRCPY006
877.0	250204	      // {Place program-specific indicator renames immediately after the      }
878.0	250204	      // {/COPY.                                                              }
879.0	250204	      // {Indicators 01-24 are reserved for function keys (enabled/disabled)  }
880.0	250204	      // {Indicator  25    is reserved for SFLNXTCHG keyword                  }
881.0	250204	      // {Indicators 27-30 are reserved for subfile control keywords          }
882.0	250204	      // {Indicators 31-49 should be used for control-record indicators       }
883.0	250204	      // {Indicators 50-89 are reserved for error-indicators (position cursor)}
884.0	250204	      // {Indicator  99    is  reserved for CHANGE keyword                    }
885.0	250218	     D ProtOpt                         N   overlay(dspfIndDS:91)
886.0	250218	     D OptError                        N   overlay(dspfIndDS:92)
887.0	250204	
888.0	250203	      // { Select the appropriate Target Relational Database, and delete the   }
889.0	250203	      // { other lines.                                                        }
890.0	250203	     D systemName      DS                  dtaara(INSYSNAM) qualified           INA400
891.0	250203	     D  systemName                    8A                                        INA400
892.0	0	      // -----------------------------------------------------------------------*
893.0	0	      // Constants                                                              *
894.0	0	      //------------------------------------------------------------------------*
895.0	61108	      // Constants that may need to be modIFied
896.0	0	      // # of records on subfile page
897.0	50525	     D cRecPageS02     C                   02
898.0	90622	     D cRecPageS03     C                   12
899.0	60426	     D cRecPageWS06    C                   02
900.0	0	      // number of required parms passed
901.0	50812	     D cReqParms       C                   4
902.0	50812	     D cMaxParms       C                   4
903.0	0	
904.0	0	      // Error Message File
905.0	0	
906.0	61108	      // {determine IF not using INUSRMSG file which of the two replacements below to use.}
907.0	0	      // ================================ -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
908.0	0	      // Error Message File  replacement for above INUSRMGS with ACUSRMSG
909.0	50804	     D MsgF            C                   'OAUSRMSG  '
910.0	50525	      // Error messages used in Program  / Use a descriptive name
911.0	50804	     D  NoPromptMsg    C                   'UOA0003'
912.0	50804	     D  PromptParmMsg  C                   'UOA0004'
913.0	50804	     D  NoSflRecs      C                   'XXXXXXX'
914.0	50525	
915.0	50804	     D  Err_BadOpt     C                   'UOA0001'
916.0	50907	     D  Is_Required    C                   'UOA0009'
917.0	50804	     D  RcdNotFound    C                   'UOA0010'
918.0	51011	     D  InvldPOSCpnDeptdBasedOnCpnCntDept...
919.0	51011	     D                 C                   'UOA0046'
920.0	51125	     D  cInvMinPurchCnt...
921.0	50915	     D                 C                   'UOA0047'
922.0	51125	     D  cInvMinPurchCnt2...
923.0	50915	     D                 C                   'UOA0048'
924.0	51125	     D  cInvGetFreeCnt...
925.0	50915	     D                 C                   'UOA0049'
926.0	50915	     D  cNotCouponType...
927.0	50915	     D                 C                   'UOA0060'
928.0	50915	     D  cCouponNotAct...
929.0	51024	     D                 C                   'UOA0062'
930.0	50915	     D  cNotCmpyEqual...
931.0	51024	     D                 C                   'UOA0061'
932.0	50915	     D  cNotValidToDelete...
933.0	50915	     D                 C                   'UOA0063'
934.0	50915	     D  cNotValidToChange...
935.0	50915	     D                 C                   'UOA0064'
936.0	60109	     D  cItemLinkedToCoupon...
937.0	60109	     D                 C                   'UOA0065'
938.0	51013	     D  cInvalidFlag...
939.0	51013	     D                 C                   'UOA0228'
940.0	51013	     D  cInvFamilyCode...
941.0	51013	     D                 C                   'UOA0236'
942.0	51013	     D  cItemNotActive...
943.0	51013	     D                 C                   'UOA0300'
944.0	51024	     D  cCpnCntCpmyNotEqual...
945.0	51024	     D                 C                   'UOA0331'
946.0	51107	     D  cItemNotExistInContract...
947.0	51107	     D                 C                   'UOA0340'
948.0	51107	     D  cDuplicateItem...
949.0	51107	     D                 C                   'UOA0342'
950.0	51107	     D  cContractIsExpired...
951.0	51107	     D                 C                   'UOA0343'
952.0	51110	     D  cDuplicateContract...
953.0	51110	     D                 C                   'UOA0344'
954.0	60426	     D  cHighFundingPct...
955.0	60426	     D                 C                   'UOA0417'
956.0	60426	     D  cLowFundingPct...
957.0	60426	     D                 C                   'UOAxxxx'
958.0	60707	     D  cNegativeNotAllowed...
959.0	60707	     D                 C                   'UOA0011'
960.0	60919	     D  cContractNotValid...
961.0	60919	     D                 C                   'UOA0001'
962.0	70108	     D cCouponTypenottheSame...
963.0	70108	     D                 C                   'UOA0443'
964.0	70312	     D cCouponAmountnottheSame...
965.0	70312	     D                 C                   'UOA0503'
966.0	51018	     D  couponContractConstraintErr...
967.0	51019	     D                 C                   'CONTRACTCOUPONASSOC_CONTRACTMASTER-
968.0	51018	     D                                     _FK'
969.0	80916	     D  ContractInUse  C                   'UOA0324'
970.0	80916	     D  PrcsError      C                   'UOA0018'
971.0	100421	     D cItemsCount...
972.0	100421	     D                 C                   'UOA0625'
973.0	170516	     D cTPDQtyAndDscSet...
974.0	170516	     D                 C                   'UOA0717'
975.0	50804	
976.0	250203	     D EMID_MAXIMUM_SUBFILE_RECORDS_EXCEEDED...
977.0	250203	     D                 C                   'UIN1688'
978.0	260623	
979.0	260623	      // New Err Msg added
980.0	260623	     D cBlankMsg       C                   'UOA0691'
981.0	50607	      // Error messages used in Program  / Use a descriptive name
982.0	50812	     D  cConfirmDelete...
983.0	50812	     D                 C                   'Press ENTER to confirm your choice-
984.0	50812	     D                                      for Delete'
985.0	50812	     D  cConfirmPOSMaint...
986.0	50812	     D                 C                   'Press ENTER to confirm your choice-
987.0	50812	     D                                      for sending Coupon Data to POS'
988.0	50812	     D  cConfirmReActivate...
989.0	50812	     D                 C                   'Press ENTER to confirm your choice-
990.0	50812	     D                                      for Re-Activation'
991.0	50907	     D  cNotEnoughGroups...
992.0	50907	     D                 C                   'Two or more group numbers must be-
993.0	50908	     D                                      entered to maintain groups'
994.0	50907	     D  cNoGroupsToMaintain...
995.0	50908	     D                 C                   'No groups entered to maintain'
996.0	60822	     D  cNoItemsEntered...
997.0	60822	     D                 C                   'No Items have been entered for-
998.0	60822	     D                                      Coupon.'
999.0	250218	     D  cNoItemsFound  C                   'No Items Found'
1000.0	250305	     D  cErrinItmFtch  C                   'Error in retrieving item'
1001.0	0	
1002.0	0	      //  Indicators used to PC/RI selected screen fields
1003.0	0	      //     Field and indictors must match Display file
1004.0	0	      //     Indicator from 50-89 reserved for errors
1005.0	0	      //      Indicators from 70-89 reserved for subfile error)
1006.0	0	      //      (uses ErrIndStrt field to offset in procedure)
1007.0	0	      //      Indicators are reset between screens, so can be reused.
1008.0	50525	
1009.0	0	      // Postion on screen 2
1010.0	50607	     D  Poss2Opt       C                   '70'
1011.0	50607	     D  Poss2Last      C                   '71'
1012.0	50808	     D  Poss2ContId    C                   '72'
1013.0	260623	     D  PosC2CPNTYP    C                   '87'
1014.0	50525	
1015.0	0	      // Postion on screen 3
1016.0	50525	     D  PosS3Opt       C                   '73'
1017.0	50525	     D  PosS3Last      C                   '74'
1018.0	50907	     D  PosS3ItmNbr    C                   '75'
1019.0	50929	     D  PosS3fitf      C                   '76'
1020.0	50907	     D  PosS3grp#      C                   '77'
1021.0	50921	     D  PosS3ItmPmt    C                   '78'
1022.0	50525	
1023.0	50802	     D  PosC3CmyNbr    C                   '50'
1024.0	50802	     D  PosCRCmyNbr    C                   '51'
1025.0	50802	     D  PosC3CpnDes1   C                   '52'
1026.0	50802	     D  PosC3CpnDes2   C                   '53'
1027.0	50802	     D  PosC3RDesc     C                   '54'
1028.0	50802	     D  PosC3POSDept   C                   '55'
1029.0	50802	     D  PosC3MinCnt    C                   '56'
1030.0	50802	     D  PosC3POSFmCd   C                   '57'
1031.0	50802	     D  PosC3FreeCnt   C                   '58'
1032.0	50802	     D  PosC3MrgnDstCde...
1033.0	50802	     D                 C                   '60'
1034.0	50802	     D  PosC3MaxCnt    C                   '61'
1035.0	50802	     D  PosC3SoftWeekInd...
1036.0	50802	     D                 C                   '62'
1037.0	50802	     D  Posc3RdmpTnTyp...
1038.0	50802	     D                 C                   '63'
1039.0	50802	     D  PosC3UPCNbr    C                   '64'
1040.0	50802	     D  PosC3CpnTaxC   C                   '65'
1041.0	0	
1042.0	60707	      // Postion on screen 4
1043.0	60707	     D  PosS4GrpQty    C                   '79'
1044.0	60707	
1045.0	161228	      // Position on Disclaimer Flag
1046.0	161228	     D  PosC3SDSCFLG   C                   '80'
1047.0	170516	
1048.0	170516	      // Position on Disclaimer Flag
1049.0	170516	     D  PosC3TPDFLG    C                   '81'
1050.0	260623	     D  PosC3EXECCPN   C                   '88'
1051.0	260623	     D  PosC3EXCPSGN   C                   '89'
1052.0	250218	     D  PosR7CAT1FLG   C                   '84'
1053.0	250218	     D  PosR7CAT2FLG   C                   '85'
1054.0	250218	     D  PosR7CAT3AFLG  C                   '86'
1055.0	250220	     D  PosS5OPTFLG    C                   '83'
1056.0	161228	
1057.0	61108	      // Constants that should not need to be modIFied
1058.0	0	      // Protection against subfile overflow
1059.0	0	     D cMaxRRN         C                   9999
1060.0	0	
1061.0	0	      // Add/Chg/Delete/Inq modes
1062.0	0	     D AddMode         C                   'ADD'
1063.0	50601	     D ChgMode         C                   'CHG'
1064.0	50601	     D CpyMode         C                   'CPY'
1065.0	50810	     D DltMode         C                   'DLT'
1066.0	50601	     D InqMode         C                   'INQ'
1067.0	51013	     D ChgGrp          C                   'CGP'
1068.0	51025	     D ReActivateMode  C                   'REACTIVATE'
1069.0	0	
1070.0	0	      // Valid Options for subfile
1071.0	50530	     D OptChg          C                   '2'
1072.0	50530	     D OptCpy          C                   '3'
1073.0	50601	     D OptDlt          C                   '4'
1074.0	50527	     D OptDSP          C                   '5'
1075.0	50701	     D OptAdd          C                   'A'
1076.0	50630	     D OptPOSMaint     C                   '7'
1077.0	50802	     D OptReActivate   C                   '8'
1078.0	0	
1079.0	0	      // File Status
1080.0	0	     D  FileStsOK      C                   0
1081.0	0	     D  FileStsNoKey   C                   12
1082.0	0	     D  FileRecLocked  C                   1218
1083.0	0	
1084.0	260623	      //D TRUE            C                   '1'
1085.0	260623	      //D FALSE           C                   '0'
1086.0	260623	      // D YES             C                   'Y'
1087.0	260623	      //D NO              C                   'N'
1088.0	260623	      //D English         C                   ' E'                                 English Language
1089.0	0	      // ErrIndStrt is used by SetCsrPos - 1 less than pos of ErrMsgInds in DS
1090.0	0	     D ErrIndStrt      C                   49
1091.0	0	     D Enter_F12       C                   '1'
1092.0	50602	
1093.0	51102	     D cItem           C                   'Item Number'
1094.0	50607	     D cOption         C                   'Option'
1095.0	50607	     D cContract       C                   'Coupon Contract'
1096.0	50701	     D cReqRowsCpnCntCpnAsc...
1097.0	50810	     D                 C                   02
1098.0	50701	     D cReqRowsCntItmAsc...
1099.0	90622	     D                 C                   12
1100.0	51026	     D cReqRows...
1101.0	51026	     D                 C                   20
1102.0	51027	     D cCancelled...
1103.0	51027	     D                 C                   'CNCL'
1104.0	51027	     D cActive...
1105.0	51027	     D                 C                   'ACT'
1106.0	50608	
1107.0	50608	      // MiddleWare Functions and Operations
1108.0	50608	     D cCPNMaster      C                   'CPNMASTER'
1109.0	50608	     D cCPNItem        C                   'CPNITEM'
1110.0	50608	     D cCntHdr         C                   'HEADER    '
1111.0	50608	     D cCpnCnt         C                   'COUPON    '
1112.0	50701	     D cCpnCntAsc      C                   'CPNCONTASC'
1113.0	50701	     D cCntItmAsc      C                   'UCNTITMASC'
1114.0	50701	     D cCpnItmAscW     C                   'CPNITMASC '
1115.0	50809	     D*cCpnCntCpnAsc   C                   'CPNCONTASC2'
1116.0	51017	     D cCouponContractAssoc...
1117.0	51017	     D                 C                   'CPNASSOC'
1118.0	51103	     D cPOSMaint       C                   'CPNPOSREQ'
1119.0	50608	
1120.0	50608	     D cClrEnv         C                   'CLEARENV'
1121.0	80916	     D COMMIT          C                   'COMMIT'
1122.0	80916	     D ROLLBACK        C                   'ROLLBACK'
1123.0	50914	     D cApplyBR        C                   'APPLYBR   '
1124.0	80916	     D CHANGE          C                   'CHANGE    '
1125.0	80916	     D DELETE          C                   'DELETE    '
1126.0	80916	     D EQUAL           C                   'EQUAL     '
1127.0	80916	     D EQUALG          C                   'EQUALG    '
1128.0	80916	     D NEXT            C                   'NEXT      '
1129.0	80916	     D DISPLAY         C                   'DISPLAY   '
1130.0	50915	
1131.0	50915	     D ERROR           C                   '0'
1132.0	50915	     D SUCCESS         C                   '1'
1133.0	50921	     D  ObjNotFound    C                   'CPF9801'
1134.0	100309	
1135.0	100326	     D PAPER           C                    'PAPER'
1136.0	50831	
1137.0	50831	     D titleRedemptionTypeCodes...
1138.0	50831	     D                 C                   'Redemption Type Codes'
1139.0	50831	     D tableRedemptionTypeCodes...
1140.0	50831	     D                 C                   'OARDMPTP'
1141.0	50831	     D titleDistributionCodes...
1142.0	50831	     D                 C                   'Margin Distribution Codes'
1143.0	50831	     D tableDistributionCodes...
1144.0	50901	     D                 C                   'OACPNMDSTP'
1145.0	260623	               // Added code to be used for Coupon Type Prompt
1146.0	260623	     D titleCouponTypeCodes...
1147.0	260623	     D                 C                   'Coupon Type Codes'
1148.0	50916	     D tableCouponTypeCodes...
1149.0	50916	     D                 C                   'OACPNTP'
1150.0	0	
1151.0	0	      //-----------------------------------------------------------------------*
1152.0	0	      // Display File Information DS                                           *
1153.0	0	      //-----------------------------------------------------------------------*
1154.0	0	     D DispFlds        DS
1155.0	0	     D  KeyPressed           369    369
1156.0	0	     D  Min_rrn              378    379I 0
1157.0	0	
1158.0	0	      // ----------------------------------------------------------------------*
1159.0	0	      // Function Key AID Byte Translations
1160.0	0	      // ----------------------------------------------------------------------*
1161.0	0	     D  F_Help         C                   X'31'                                F1
1162.0	0	     D  F_Exit         C                   X'33'                                F3
1163.0	0	     D  F_Prompt       C                   X'34'                                F4
1164.0	0	     D  F_Refresh      C                   X'35'                                F5
1165.0	0	     D  F_Add          C                   X'36'                                F6
1166.0	0	     D  F_NextRec      C                   X'37'                                F7
1167.0	0	     D  F_Accept       C                   X'38'                                F8
1168.0	50526	     D  F_ModGrp       C                   X'39'                                F9
1169.0	0	     D  F_Fold         C                   X'3B'                                F11
1170.0	0	     D  F_Cancel       C                   X'3C'                                F12
1171.0	0	     D  F_Restart      C                   X'B1'                                F13
1172.0	51207	     D  F_GenFamCode   C                   X'B3'                                F15
1173.0	50818	     D  F_ViewCpnLoc   C                   X'B4'                                F16
1174.0	90622	     D  F_ViewCpnItm   C                   X'B5'                                F17
1175.0	100309	     D  F_Top          C                   X'B5'                                F17
1176.0	100309	     D  F_Bottom       C                   X'B6'                                F18
1177.0	100309	     D  F_SyncItem     C                   X'B7'                                F19
1178.0	241226	     D  F_CatMaint     C                   X'B8'                                F20
1179.0	0	     D  F_Print        C                   X'B9'                                F21
1180.0	0	     D  F_Delete       C                   X'BB'                                F23
1181.0	100309	     D  F_MoreKeys     C                   X'BC'                                F24
1182.0	0	     D  F_Enter        C                   X'F1'                                Enter Key
1183.0	0	     D  F_HelpKey      C                   X'F3'                                Help Key
1184.0	0	     D  F_PageUp       C                   X'F4'                                Page Up
1185.0	0	     D  F_PageDown     C                   X'F5'                                Page Down
1186.0	0	     D  F_PrintKey     C                   X'F6'                                Print Key
1187.0	0	     D  F_AutoEnter    C                   X'3F'                                Auto Enter-Light Pen
1188.0	0	
1189.0	0	      //------------------------------------------------------------------------*
1190.0	0	      // Indicators                                                             *
1191.0	0	      //------------------------------------------------------------------------*
1192.0	0	      //    01-24 = Available
1193.0	50524	      //    25-34 = Subfile controls
1194.0	0	      //    50-89 = Error highlighting
1195.0	0	
1196.0	0	      // Indicator array to boolean variable data structure mapping:
1197.0	0	     D DispInds        DS            99                                         Ind-Boolean map
1198.0	0	
1199.0	250303	      // D  SflFold                       1N   OVERLAY(DispInds:11) INZ(*OFF)
1200.0	50524	     D  SflNxtChg1                    1N   OVERLAY(DispInds:25) INZ(*OFF)
1201.0	50524	     D  SflDsp1                       1N   OVERLAY(DispInds:27) INZ(*OFF)
1202.0	50524	     D  SflDspCtl1                    1N   OVERLAY(DispInds:28) INZ(*ON)
1203.0	50524	     D  SflEnd1                       1N   OVERLAY(DispInds:29) INZ(*OFF)
1204.0	250303	      // D  MsgSflEnd                     1N   OVERLAY(DispInds:30)
1205.0	50524	
1206.0	50524	     D  SflNxtChg2                    1N   OVERLAY(DispInds:31) INZ(*OFF)
1207.0	50524	     D  SflDsp2                       1N   OVERLAY(DispInds:32) INZ(*OFF)
1208.0	50524	     D  SflDspCtl2                    1N   OVERLAY(DispInds:33) INZ(*ON)
1209.0	50524	     D  SflEnd2                       1N   OVERLAY(DispInds:34) INZ(*OFF)
1210.0	50525	
1211.0	50527	     D  SflNxtChg3                    1N   OVERLAY(DispInds:35) INZ(*OFF)
1212.0	50527	     D  SflDsp3                       1N   OVERLAY(DispInds:36) INZ(*OFF)
1213.0	50527	     D  SflDspCtl3                    1N   OVERLAY(DispInds:37) INZ(*ON)
1214.0	50527	     D  SflEnd3                       1N   OVERLAY(DispInds:38) INZ(*OFF)
1215.0	60426	
1216.0	60426	     D  SflDsp6                       1N   OVERLAY(DispInds:40) INZ(*OFF)
1217.0	60426	     D  SflDspCtl6                    1N   OVERLAY(DispInds:41) INZ(*ON)
1218.0	60426	     D  SflEnd6                       1N   OVERLAY(DispInds:42) INZ(*OFF)
1219.0	60426	
1220.0	250205	     D  SflNxtChg5                    1N   OVERLAY(DispInds:43) INZ(*OFF)
1221.0	250205	     D  SflDsp5                       1N   OVERLAY(DispInds:44) INZ(*OFF)
1222.0	250205	     D  SflDspCtl5                    1N   OVERLAY(DispInds:45) INZ(*ON)
1223.0	250205	     D  SflEnd5                       1N   OVERLAY(DispInds:46) INZ(*OFF)
1224.0	0	      // reserve 50-89 for display error indicators
1225.0	0	      //     (use 70-89 for subfile errors)
1226.0	0	     D  ErrMsgInds                   40A   OVERLAY(DispInds:50)
1227.0	0	     D  ErrMsgIndsSf                 20A   OVERLAY(DispInds:70)
1228.0	0	
1229.0	50808	     D  ProtContId                    1N   OVERLAY(DispInds:90)
1230.0	50530	     D  ProtInpFlds                   1N   OVERLAY(DispInds:91)
1231.0	50810	     D  NDCpnNbrFld                   1N   OVERLAY(DispInds:92)
1232.0	50809	     D  ProtItmNbr                    1N   OVERLAY(DispInds:93)
1233.0	51027	     D  ProtS03Flds                   1N   OVERLAY(DispInds:94)
1234.0	51108	     D  HighlightFlds                 1N   OVERLAY(DispInds:95)
1235.0	90622	     D  ViewCouponItm                 1N   OVERLAY(DispInds:96)
1236.0	161228	     D  ViewSignDesc                  1N   OVERLAY(DispInds:97)
1237.0	170516	     D  ViewSignTPD                   1N   OVERLAY(DispInds:39)
1238.0	0	     D  PCFirstFld                    1N   OVERLAY(DispInds:98)                 PC to first fld
1239.0	0	     D  ScrnChg                       1N   OVERLAY(DispInds:99)                 Chg on Screen
1240.0	170516	     D  EnableDisTPD                  1N   OVERLAY(DispInds:43)
1241.0	260623	     D  ProtCmynbr                    1N   OVERLAY(DispInds:59)
1242.0	260623	     D  ProtCpnTyp                    1N   OVERLAY(DispInds:49)
1243.0	0	      //------------------------------------------------------------------------*
1244.0	0	      // Variables                                                              *
1245.0	0	      //------------------------------------------------------------------------*
1246.0	0	      // Arrays
1247.0	0	     D NumRecAdd       S              5I 0 Inz
1248.0	0	
1249.0	0	      // Message Subfile Global Variables
1250.0	50830	     D MsgDtaPtr       S               *
1251.0	50602	     D SwCallStatus    S              1n
1252.0	250130	     D SetCatStat      S              1n   inz(FALSE)
1253.0	250211	     D wkExitScrn      S              1n   inz(FALSE)
1254.0	0	
1255.0	250211	     D EndPgm          S              1N   INZ(FALSE)                           Main loop control
1256.0	50608	     D DspName         S             10    Inz('OACP1010D')
1257.0	0	      // Screen loop control variables
1258.0	250202	      //D Screen          S              3  0 INZ(0)
1259.0	250204	     D Valid           S              1N   INZ(TRUE)                            Screen Error flag
1260.0	250218	     D PItmDownOkay    S              1N   INZ(True)
1261.0	250218	     D PrevValid       S              1N   INZ(False)
1262.0	250218	     D PrevEnter       S              1N   INZ(False)
1263.0	250218	     D SaveDept        S              3S 0 Inz(0)
1264.0	250218	     D NotPOSTO        S              1N   INZ(True)
1265.0	250202	      //D ErrorFound      S              1N   INZ(FALSE)                           Error flag
1266.0	50915	     D ErrorFoundContract...
1267.0	50915	     D                 S              1N   INZ(FALSE)                           Error flag
1268.0	51013	     D ErrorFoundItem...
1269.0	51013	     D                 S              1N   INZ(FALSE)                           Error flag
1270.0	260623	     D ErrorExecCpn...
1271.0	260623	     D                 S              1N   INZ(FALSE)                           Error flag
1272.0	260623	     D ErrorExcpSgn...
1273.0	260623	     D                 S              1N   INZ(FALSE)                           Error flag
1274.0	51018	     D CheckContractErrors...
1275.0	51018	     D                 S              1N   INZ(FALSE)                           Error flag
1276.0	60426	     D WarningsFound   S              1N   INZ(FALSE)                           Warning flag
1277.0	60427	     D cancelWarnings  S              1N   INZ(FALSE)                           Warning flag
1278.0	60822	     D noItemsEntered  S              1N   INZ(FALSE)                           Flag
1279.0	60822	     D returnToItems   S              1N   INZ(FALSE)                           Flag
1280.0	161228	     D couponDisclaimerExists...
1281.0	161228	     D                 S              1N   INZ(FALSE)                           Flag
1282.0	170516	     D couponTPDExists...
1283.0	170516	     D                 S              1N   INZ(FALSE)                           Flag
1284.0	60221	     D X               S                   like(typeIndex) Inz
1285.0	60221	     D A1              S                   like(typeIndex) Inz
1286.0	60221	     D wkINDEX         S                   like(typeIndex) Inz
1287.0	60221	     D w2Index         S                   like(typeIndex) Inz
1288.0	60221	     D w3ITEMIndex     S                   like(typeIndex) Inz
1289.0	60221	     D w4GrpIndex      S                   like(typeIndex) Inz
1290.0	60221	     D wkErrIndex      S                   like(typeIndex) Inz
1291.0	60221	     D wkContIndex     S                   like(typeIndex) Inz
1292.0	90130	     D wkMItemTax      S                   like(C3CPNTAXC) Inz
1293.0	60221	     D Indx            S                   like(typeIndex) Inz
1294.0	60221	     D IndxHld         S                   like(typeIndex) Inz
1295.0	60223	     D rbkindx         S                   like(typeIndex) Inz(1)
1296.0	60426	     D wkWarningIndex  S                   like(typeIndex) Inz
1297.0	50810	     D Firstpass       S               N   Inz(True)
1298.0	50811	     D Firstpass2      S               N   Inz(True)
1299.0	50926	     D ContractExists  S               N   Inz(False)
1300.0	60426	     D AllContractsInError...
1301.0	60426	     D                 S               N   Inz(False)
1302.0	60426	     D UserAccepted    S               N   inz(False)
1303.0	60109	     D ItemInError     S                   like(typeItem) Inz
1304.0	50801	     D Operator        S             10a   Inz
1305.0	51025	     D RecOption       S             10a   Inz
1306.0	50801	     D wkReq#ofrows    S              4B 0 Inz(*Hival)
1307.0	50801	     D wkAct#ofrows    S              4B 0 Inz
1308.0	50801	     D wkAct#ofrows2   S              4B 0 Inz
1309.0	51011	     D wkAct#ofrows3c  S              4B 0 Inz
1310.0	51006	     D wkAct#ofRows4   S                   like(wkAct#ofRows) Inz
1311.0	50801	     D wkErrorMsg      S             71a
1312.0	160321	     D wkItemTax       S             15a   Inz
1313.0	160321	     D wkNewTax        S             15a   Inz
1314.0	50807	     D oar_ptra        S               *
1315.0	50807	     D function        S             10a
1316.0	50914	     D PrRecOption     S             10A
1317.0	50809	     D wkCpnId         S                   like(CouponMasterDS.CouponId) Inz
1318.0	50812	     D wkDate          S               D   DatFmt(*ISO)
1319.0	50812	     D wkTime          S               T
1320.0	50812	     D UpdFailedFlag   S               n   Inz(False)
1321.0	50801	     D wkMsgDta        S             78a   Inz
1322.0	50825	     D wkParms         S              5s 0 Inz
1323.0	50912	     D retrievalRrnS03...
1324.0	50912	     D                 S                   Like(C3DSPR)  INZ(1)
1325.0	51028	     D wkContract#     S                   like(s2ContId) inz
1326.0	50801	
1327.0	50824	     D typeCompanyCode...
1328.0	50824	     D                 S              2A
1329.0	50831	     D TypeDepartment20...
1330.0	50831	     D                 S              2P 0 Inz
1331.0	50802	     D TypeDepartment30...
1332.0	50831	     D                 S              3P 0 Inz
1333.0	50831	     D TypeMarginDistr...
1334.0	50831	     D                 S              5A   Inz
1335.0	50831	     D TypeCode        S              5A   Inz
1336.0	50801	     D TypeCodeDesc    S             30A   Inz
1337.0	50831	     D TypeRedempType  S              5A   Inz
1338.0	50919	     D TypeBuyerNumber...
1339.0	50919	     D                 S              3P 0 Inz
1340.0	50919	     D TypeVendor#     S              5P 0 Inz
1341.0	50801	     D TypeOTIO        S              1A   Inz
1342.0	50801	     D TypeSuffix      S              2P 0 Inz
1343.0	50907	     D typeCouponLocationId...
1344.0	50907	     D                 S              9B 0
1345.0	51026	     D TypeCouponId...
1346.0	50907	     D                 S              9B 0
1347.0	51104	     D wkDftCompanyNumber...
1348.0	51104	     D                 S                   like(s2cpyc)
1349.0	51104	     D wkDftDepartmentNumber...
1350.0	51104	     D                 S                   like(s2dept)
1351.0	91216	     D wkDftTaxCode...
1352.0	91216	     D                 S             15A   inz
1353.0	100309	     D wkDftCpnDescription...
1354.0	100309	     D                 S             40A   inz
1355.0	100309	     D wkDftCouponLimit...
1356.0	100309	     D                 S              3S 0 inz
1357.0	60426	     D numberLinesWS06...
1358.0	60426	     D                 S              5I 0 inz
1359.0	81118	     D  ChkFlg         S              1A   Inz(True)
1360.0	260423	     D EnContID        S              9  0 Inz(*ZERO)
1361.0	90127	     D wkRckAllowed    S              1a   Inz
1362.0	91214	     D vendorFunded...
1363.0	91214	     D                 S               N   inz(FALSE)
1364.0	91214	     D contractLinked...
1365.0	91214	     D                 S               N   inz(FALSE)
1366.0	100309	     D switch_F_Key    S               N   inz(FALSE)
1367.0	100309	     D getItemFromContract...
1368.0	100309	     D                 S               N   inz(FALSE)
1369.0	241230	     D RtKeyPressed    S                   like(KeyPressed)
1370.0	241230	     D PrCmpy          S                   like(typeCompany)
1371.0	241230	     D ValidDepartment...
1372.0	241230	     D                 S              1N   INZ(TRUE)
1373.0	241230	     D LimitValid      S              1N   INZ(TRUE)                            Field Error flag
1374.0	241230	     D PrContID        S              9  0
1375.0	241231	     D EPrContID       S                   like(PrContID)
1376.0	241231	     D EPrCmpy         S                   like(PrCmpy)
1377.0	250127	     D Category3s      S             10a
1378.0	250210	     D Category3b      S              1a
1379.0	250209	     D SetItemsWithCategories...
1380.0	250209	     D                 S           2000a
1381.0	250209	     D WhereClause     S           1000A   inz(' ')
1382.0	250209	     D SQLStatement    S           2000A
1383.0	51006	
1384.0	51006	      // Data Queue fields for returning data from multiple selection item prompt
1385.0	51006	     D dqName          S                   like(typeObjectName)
1386.0	51006	     D dqLibrary       S                   like(typeObjectName)
1387.0	51006	     D                                     inz('QTEMP')
1388.0	51006	     D dqData          S             51
1389.0	51006	     D dqKeyData       S              9a
1390.0	51006	     D dqRcvLen        S              5  0
1391.0	51006	     D dqSndrInfoLen   S              3  0
1392.0	51006	     D dqSenderInfo    S              8
1393.0	0	
1394.0	0	      // Fill Screen subroutine control
1395.0	0	     D Fill01YN        S              1N   INZ(FALSE)                           Fill Screen 1
1396.0	0	     D Fill02YN        S              1N   INZ(FALSE)                           Fill Screen 2
1397.0	0	     D Fill03YN        S              1N   INZ(FALSE)                           Fill Screen 3
1398.0	61108	     D Fill04YN        S              1N   INZ(FALSE)                           Fill Screen 3
1399.0	0	
1400.0	0	      // Subfile Processing Variables
1401.0	0	     D RrnS02          S                   LIKE(C2DSPR)  INZ                    Sfl Relative Rcd #
1402.0	0	     D SvRrnS02        S                   Like(C2DSPR)  INZ                    Saved Sfl Rel Rcd #
1403.0	0	     D WkRrnS02        S                   Like(C2DSPR)  INZ                    Saved Sfl Rel Rcd #
1404.0	0	     D CntLnesS02      S                   Like(C2DSPR)  INZ
1405.0	0	     D CsrStart        S                   Like(C2DSPR)  INZ
1406.0	0	     D ErrorPage       S                   Like(C2DSPR)  INZ
1407.0	0	     D EndS02          S              1N   INZ(*OFF)                            no more recs
1408.0	50525	
1409.0	50525	     D RrnS03          S                   LIKE(C3DSPR)  INZ                    Sfl Relative Rcd #
1410.0	50525	     D SvRrnS03        S                   Like(C3DSPR)  INZ                    Saved Sfl Rel Rcd #
1411.0	50525	     D WkRrnS03        S                   Like(C3DSPR)  INZ                    Saved Sfl Rel Rcd #
1412.0	50525	     D CntLnesS03      S                   Like(C3DSPR)  INZ
1413.0	50525	     D EndS03          S              1N   INZ(*OFF)                            no more recs
1414.0	51027	     D ErrorPage3      S                   Like(C2DSPR)  INZ
1415.0	50525	
1416.0	60426	     D RrnS04          S                   LIKE(C4DSPR)  INZ                    Sfl Relative Rcd #
1417.0	60426	     D SvRrnS04        S                   Like(C4DSPR)  INZ                    Saved Sfl Rel Rcd #
1418.0	60426	     D WkRrnS04        S                   Like(C4DSPR)  INZ                    Saved Sfl Rel Rcd #
1419.0	60426	     D CntLnesS04      S                   Like(C4DSPR)  INZ
1420.0	50525	     D EndS04          S              1N   INZ(*OFF)                            no more recs
1421.0	60707	     D ErrorPage4      S                   Like(C4DSPR)  INZ                       more recs
1422.0	60426	
1423.0	60426	     D RrnWS06         S                   LIKE(C6DSPR)  INZ                    Sfl Relative Rcd #
1424.0	60426	     D SvRrnWS06       S                   Like(C6DSPR)  INZ                    Saved Sfl Rel Rcd #
1425.0	60426	     D WkRrnWS06       S                   Like(C6DSPR)  INZ                    Saved Sfl Rel Rcd #
1426.0	60426	     D CntLnesWS06     S                   Like(C6DSPR)  INZ
1427.0	60426	     D EndWS06         S              1N   INZ(*OFF)                            no more recs
1428.0	0	
1429.0	250204	     D RrnS05          S                   LIKE(C5DSPR)  INZ                    Sfl Relative Rcd #
1430.0	250204	     D SvRrnS05        S                   Like(C5DSPR)  INZ                    Saved Sfl Rel Rcd #
1431.0	250204	     D WkRrnS05        S                   Like(C5DSPR)  INZ                    Saved Sfl Rel Rcd #
1432.0	250204	     D CntLnesS05      S                   Like(C5DSPR)  INZ
1433.0	250204	     D EndS05          S              1N   INZ(*OFF)                            no more recs
1434.0	250204	     D ErrorPage5      S                   Like(C5DSPR)  INZ                       more recs
1435.0	250204	
1436.0	250204	
1437.0	250204	      // Local Variables for SQL Connection processing:
1438.0	250204	     D currentRDB      S                   like(typeRelationalDatabase) inz
1439.0	250204	     D initialRDB      S                   like(typeRelationalDatabase) inz
1440.0	250204	     D relationalDatabase...
1441.0	250204	     D                 S                   like(typeRelationalDatabase) inz
1442.0	250204	     D endOfProgram    S               N   inz(FALSE)
1443.0	250204	     D jobLanguage     S                   like(typeLanguage) inz
1444.0	250204	     D keyIndex        S                   like(typeIndex) inz
1445.0	250204	     D numberLinesS05  S                   like(typeRelativeRecordNumber) inz
1446.0	250204	     D numberRecordsAdded...
1447.0	250204	     D                 S              5I 0 inz
1448.0	250204	     D optionFound     S               N   inz(FALSE)
1449.0	250204	     D svCsrRRN        S              5S 0
1450.0	0	      // Work Fields
1451.0	0	     D WkFn            S                   Like(EnFn)
1452.0	0	     D WkLang          S              1    Inz (*LOVAL)
1453.0	50801	     D WkFn2           S                   Like(EnFn)
1454.0	250227	     D wkdeptdesc      S             30A   inz
1455.0	0	
1456.0	250131	      // Structure to hold status values of each cursor used in the application
1457.0	250131	     D cursorControl   DS                  occurs(TOTAL_CURSORS) inz
1458.0	250131	     D  currentRow                         like(typeIndex)
1459.0	250131	     D  cursorOpen                     N   inz(FALSE)
1460.0	250131	     D  rowsFetched                        like(typeIndex)
1461.0	250131	     D  fetchFactor                        like(typeIndex)
1462.0	0	      // Job level info - retrieved from service program
1463.0	0	     D JobWhse         S              5  0
1464.0	0	     D JobRegn         S              2
1465.0	0	     D JobLocT         S              1
1466.0	0	     D JobCmpy         S              3  0
1467.0	0	     D JobLang         S              1
1468.0	0	
1469.0	0	      // Key fields - define like file fields
1470.0	0	
1471.0	0	      // Prototype for Entry Parms
1472.0	250127	     D MaintainCoupon  PR                  EXTPGM('OACP1010R')
1473.0	50801	     D  EnOpt                         1A
1474.0	50809	     D  EnCpnId                       9P 0
1475.0	50812	     D  EnUpdFailedFlag...
1476.0	50812	     D                                 N
1477.0	50809	     D  EnFn                          1A   Options(*NoPass)
1478.0	0	
1479.0	0	      // Entry Parms
1480.0	50524	     D MaintainCoupon  PI
1481.0	50801	     D  EnOpt                         1A
1482.0	50809	     D  EnCpnId                       9P 0
1483.0	50812	     D  EnUpdFailedFlag...
1484.0	50812	     D                                 N
1485.0	50801	     D  EnFn                          1A   Options(*NoPass)
1486.0	0	
1487.0	241225	     D MaintainCategory...
1488.0	250123	     D                 PR
1489.0	241225	
1490.0	250127	     D validateInput7  PR
1491.0	250218	     D validateInput8  PR
1492.0	250218	     D loopS05         PR
1493.0	250130	     D LoadCategory    PR                  like(SwCallStatus)
1494.0	250129	     D declareC1csr    PR
1495.0	250203	     D closeC1Cursor...
1496.0	250131	     D                 PR              N
1497.0	250131	     D  outMessageId                       like(typeMessageId)
1498.0	250131	
1499.0	250131	     D getFirstC1      PR              N
1500.0	250131	     D  inParent                           like(typeParent) const
1501.0	250131	     D  outMessageId                       like(typeMessageId)
1502.0	250131	
1503.0	250131	     D fetchNextC1     PR              N
1504.0	250131	     D  outMessageId                       like(typeMessageId)
1505.0	250131	
1506.0	250203	     D resetRDBConnection...
1507.0	250203	     D                 PR
1508.0	250203	     D setRDBConnection...
1509.0	250203	     D                 PR
1510.0	250204	      /free
1511.0	250204	       // ======================================================================
1512.0	250204	       // - SQL Compiler Options -
1513.0	250204	       // This statement is not an executable statement.  Instead, it provides
1514.0	250204	       // instruction to the SQL Precompiler only.
1515.0	250204	       // ======================================================================
1516.0	250204	       exec sql set option closqlcsr = *endactgrp,
1517.0	250209	                           commit    = *chg,
1518.0	250204	                           alwblk    = *allread,
1519.0	250204	                           dlyprp    = *yes,
1520.0	250204	                           alwcpydta = *optimize,
1521.0	250204	                           rdbcnnmth = *duw,
1522.0	250204	                           naming    = *sys,
1523.0	250204	                           datfmt    = *iso,
1524.0	250204	                           timfmt    = *hms;
1525.0	250128	
1526.0	250204	      /end-free
1527.0	0	      //------------------------------------------------------------------------*
1528.0	0	      //  Key Lists                                                             *
1529.0	0	      //------------------------------------------------------------------------*
1530.0	0	
1531.0	0	      // Do Start of Program Processing
1532.0	0	      /FREE
1533.0	50825	       wkParms = %Parms;
1534.0	50825	       beginProgram ();
1535.0	0	
1536.0	0	       //************************************************************************
1537.0	0	       //                  MAINLINE SECTION                                     *
1538.0	0	       //************************************************************************
1539.0	0	       // Loop until end of program requested
1540.0	0	       DOW NOT Endpgm;
1541.0	0	         WkFn = *Blank;
1542.0	0	
1543.0	0	         SELECT;
1544.0	0	           // Process Screen 2
1545.0	0	         WHEN Screen = 2;
1546.0	50825	           processScreen2 ();
1547.0	50524	
1548.0	50524	           // Process Screen 3
1549.0	50524	         WHEN Screen = 3;
1550.0	50825	           processScreen3 ();
1551.0	50801	
1552.0	50801	           // Enter Group Minimum Purchase Quantity
1553.0	50801	         WHEN Screen = 4;
1554.0	50825	           processScreen4 ();
1555.0	50728	
1556.0	50728	           // Call Coupon-Location Maintenance
1557.0	50801	         WHEN Screen = 5;
1558.0	60426	           processScreen5 ();
1559.0	0	
1560.0	0	         OTHER;
1561.0	0	           EndPgm = True;
1562.0	0	           WkFn = *Blank;
1563.0	0	
1564.0	0	         ENDSL;
1565.0	0	
1566.0	0	       ENDDO;
1567.0	0	
1568.0	0	       // End Program Processing
1569.0	50825	       endProgram ();
1570.0	0	
1571.0	50824	       return;
1572.0	50825	      /end-free
1573.0	0	
1574.0	0	
1575.0	50825	      // ----------------------------------------------------------------------*
1576.0	50825	      // - Internal Procedures                                                 *
1577.0	50825	      // ----------------------------------------------------------------------*
1578.0	50825	      // =======================================================================
1579.0	50825	      // This procedure is used to control processing for format C02/S02.
1580.0	50825	      // =======================================================================
1581.0	50825	     P processScreen2  B
1582.0	50825	     D processScreen2  PI
1583.0	50825	      /free
1584.0	61108	         // Fill screen IF needed, display and process user action
1585.0	61108	         IF Fill02YN;
1586.0	50825	           loadScreenFields2 ();
1587.0	61108	         ENDIF;
1588.0	50825	         displayScreen2 ();
1589.0	50825	         testUserAction2 ();
1590.0	50825	
1591.0	50825	       return;
1592.0	50825	      /end-free
1593.0	50825	     P processScreen2  E
1594.0	50825	
1595.0	50825	       //=========================================================================
1596.0	50825	       //   Display I/O for Screen C02                                           *
1597.0	50825	       //=========================================================================
1598.0	50825	     P displayScreen2  B
1599.0	50825	     D displayScreen2  PI
1600.0	50825	      /free
1601.0	260623	          if enOpt <> OptAdd ;
1602.0	260623	             ProtCpnTyp = True;
1603.0	260623	          endif;
1604.0	50825	         // Display current screen and wait for input
1605.0	50825	         WRITE R02;
1606.0	50825	         WRITE MC01;
1607.0	50825	         EXFMT C02;
1608.0	260623	         ProtCpnTyp = False;
1609.0	50825	
1610.0	50825	       return;
1611.0	50825	      /end-free
1612.0	50825	     P displayScreen2  E
1613.0	0	
1614.0	50825	       //=========================================================================
1615.0	50825	       //   Load screen fileds for Screen C02                                    *
1616.0	50825	       //=========================================================================
1617.0	50825	     P loadScreenFields2...
1618.0	50825	     P                 B
1619.0	50825	     D loadScreenFields2...
1620.0	50825	     D                 PI
1621.0	50825	      /free
1622.0	50825	         // Use to transfer fields from one screen to another / or file to screen
1623.0	50825	         c2CpnId = wkCpnId;
1624.0	61108	         IF EnOpt <> OptAdd and EnOpt <> OptCpy;
1625.0	50825	           %occur(CouponMasterDS) = 1;
1626.0	50825	           CouponMasterDS = CpnMasterDS2;
1627.0	50825	           c2ChgUser = CouponMasterDS.ChangeUser;
1628.0	50825	           wkDate    = %Date(CouponMasterDS.ChangeStamp);
1629.0	50825	           c2ChgDate = CvtISOtoDT6(wkDate:'*MDY');
1630.0	50825	           wkTime    = %Time(CouponMasterDS.ChangeStamp);
1631.0	50825	           c2ChgTime = %dec(%char(wkTime:*hms0):6:0);
1632.0	61108	         ENDIF;
1633.0	260616	         C2CPNTYP = getCouponTypebyId(wkCpnId);
1634.0	50825	
1635.0	50825	         // Clear the subfile
1636.0	50825	         clearScreen2 ();
1637.0	50825	
1638.0	50825	         // Load subfile
1639.0	50825	         loadScreen2 ();
1640.0	50825	
1641.0	50825	         Fill02YN = FALSE;
1642.0	50825	
1643.0	50825	       return;
1644.0	50825	      /end-free
1645.0	50825	     P loadScreenFields2...
1646.0	50825	     P                 E
1647.0	50825	
1648.0	50825	       //=========================================================================
1649.0	50825	       //   Clear Screen fields for Screen C02                                   *
1650.0	50825	       //=========================================================================
1651.0	50825	     P clearScreen2    B
1652.0	50825	     D clearScreen2    PI
1653.0	50825	      /free
1654.0	50825	         // Clear subfile.                                                         *
1655.0	50825	         SflDsp1    = False;
1656.0	50825	         SflDspcTL1 = False;
1657.0	50825	         SflEnd1    = False;
1658.0	50825	         WRITE C02;
1659.0	50825	
1660.0	50825	         SflDspcTL1 = True;
1661.0	50825	         SflNxtChg1 = False;
1662.0	50825	
1663.0	50825	         RrnS02     = 0;
1664.0	50825	         SVRrnS02   = 0;
1665.0	50825	         C2DSPR     = 1;
1666.0	50825	         NumRecAdd  = 0;
1667.0	50825	         EndS02     = False;
1668.0	50825	
1669.0	50825	         // Default to display the subfile as a single line, turn on SFLDROP
1670.0	50825	         SflFold = True;
1671.0	50825	
1672.0	50825	         firstpass = true;
1673.0	51025	
1674.0	50825	       return;
1675.0	50825	      /end-free
1676.0	50825	     P clearScreen2    E
1677.0	50825	
1678.0	50825	       //=========================================================================
1679.0	50825	       //   Process Screen C02 Input                                             *
1680.0	50825	       //=========================================================================
1681.0	50825	     P testUserAction2...
1682.0	50825	     P                 B
1683.0	50825	     D testUserAction2...
1684.0	50825	     D                 PI
1685.0	50825	      /free
1686.0	50825	         // clear all errors before doing anything else
1687.0	50825	         resetErrors ();
1688.0	51021	         reset UpdFailedFlag;
1689.0	50825	
1690.0	50825	         // Track the current state of the subfile and set to the
1691.0	50825	         // appropriate mode (MODE=0 FOLD, MODE=1 DROP)
1692.0	50825	         SflFold = C2MODE;
1693.0	50825	
1694.0	50825	         SELECT;
1695.0	50825	         WHEN KeyPressed = F_Exit;
1696.0	50825	           EnFn = KeyPressed;
1697.0	50825	           EndPgm = True;
1698.0	50825	
1699.0	50825	         WHEN KeyPressed = F_Prompt;
1700.0	50825	           // Prompt for valid values / return to same position on screen
1701.0	50825	           DisplayPrompt(CSRREC: CSRFLD);
1702.0	50825	
1703.0	50825	         WHEN KeyPressed = F_Cancel;
1704.0	50825	           EnFn = KeyPressed;
1705.0	50825	           EndPgm = True;
1706.0	110131	           SetEnvironment(ROLLBACK);
1707.0	110131	           // Check if any contracts should be deleted after rollback
1708.0	110131	           resetContracts(DltMode);
1709.0	50825	
1710.0	50825	         WHEN KeyPressed = F_Help
1711.0	50825	               Or KeyPressed = F_HelpKey;
1712.0	50825	           // go out to the help window / return to same position on screen
1713.0	50825	           SeeHelp (SDPgm: CSRFLD: JobLang);
1714.0	50825	           SetCsrPos('Y');
1715.0	61108	           IF CSRRRN > 0;
1716.0	50825	             C2Dspr = CSRRRN;
1717.0	61108	             ELSEIF Min_Rrn > 0;
1718.0	50825	               C2Dspr = Min_Rrn;
1719.0	61108	           ENDIF;
1720.0	50825	
1721.0	50825	         WHEN KeyPressed = F_PageDown;
1722.0	50825	           loadScreen2 ();
1723.0	50825	
1724.0	50825	         WHEN KeyPressed = F_Refresh;
1725.0	50825	             clearScreen2 ();
1726.0	50825	             loadScreen2 ();
1727.0	50825	             SetCsrPos();
1728.0	50825	
1729.0	90622	         WHEN KeyPressed = F_Enter and
1730.0	90622	             (EnOpt<> OptDlt and EnOpt<> OptDsp and EnOpt<> OptReactivate);
1731.0	50825	           // Enter
1732.0	61108	           // Change in subfile / Validate is OK / IF OK go to next screen
1733.0	81119	           ChkFlg = True; // re-init for C02 screen - any better place?
1734.0	50825	           IF Valid;
1735.0	50825	             validateInput2 ();
1736.0	80916	
1737.0	80916	             SELECT;
1738.0	80916	             WHEN KeyPressed = F_Exit;
1739.0	80916	               EnFn = KeyPressed;
1740.0	80916	               EndPgm = True;
1741.0	80916	
1742.0	80916	             WHEN KeyPressed = F_Refresh;
1743.0	80916	               clearScreen2 ();
1744.0	80916	               loadScreen2 ();
1745.0	80916	               SetCsrPos();
1746.0	80916	
1747.0	80916	             WHEN KeyPressed = F_Enter;
1748.0	51006	             IF Valid;
1749.0	50825	               // create coupon record
1750.0	61108	               IF EnOpt = OptAdd or EnOpt = OptCpy;
1751.0	60221	                 LoadDftCpnData();
1752.0	91214	                 IF not PutCouponMaster(AddMode :CpnMasterDS :' ');
1753.0	50915	                   CheckCouponMsgs ();
1754.0	50825	                   UpdFailedFlag = True;
1755.0	161228	                 Else;
1756.0	170516	                   if ViewSignDesc  ;
1757.0	170127	                      CallPutCouponDisclaimer();
1758.0	170127	                   endif;
1759.0	61108	                 ENDIF;
1760.0	61108	                 IF not ErrorFound;
1761.0	50915	                   %occur(CouponMasterDS) = 1;
1762.0	50915	                   c2CpnId = CouponMasterDS.CouponID;
1763.0	61108	                 ENDIF;
1764.0	61108	               ENDIF;
1765.0	51003	
1766.0	61108	               IF not errorFound;
1767.0	50915	                 loopSubfile2 ();
1768.0	260924	                 IF not errorFoundContract and not cancelWarnings;
1769.0	50915	                   Fill03YN = True;
1770.0	50915	                   Screen = 3;
1771.0	61108	                 ENDIF;
1772.0	61108	               ENDIF;
1773.0	51003	
1774.0	61108	             ENDIF;
1775.0	80916	            endsl;
1776.0	80916	           ENDIF;
1777.0	50825	
1778.0	90622	         WHEN KeyPressed = F_ViewCpnItm or
1779.0	90622	             (KeyPressed = F_Enter and
1780.0	90622	             (EnOpt= OptDlt or EnOpt = OptDsp or EnOpt = OptReactivate));
1781.0	90622	           Screen = 3;
1782.0	90622	           loadScreenFields3 ();
1783.0	90622	           clearScreen3 ();
1784.0	90622	           loadScreen3 ();
1785.0	50825	         ENDSL;
1786.0	50825	
1787.0	50825	       return;
1788.0	50825	      /end-free
1789.0	50825	     P testUserAction2...
1790.0	50825	     P                 E
1791.0	50825	
1792.0	50825	       //========================================================================
1793.0	50825	       //   Validate the subfile records                                        *
1794.0	50825	       //========================================================================
1795.0	50825	     P validateInput2...
1796.0	50825	     P                 B
1797.0	50825	     D validateInput2...
1798.0	50825	     D                 PI
1799.0	60221	
1800.0	60221	     D chkIndx         S                   like(typeIndex) Inz
1801.0	80916	     D wkContractID    S             10i 0 inz
1802.0	50825	      /free
1803.0	50825	         IF SvRrnS02>0;
1804.0	61108	           // default to current screen displayed / will be overridden IF errors
1805.0	61108	           IF CSRRRN > 0;
1806.0	50825	             C2Dspr = CSRRRN;
1807.0	61108	             ELSEIF Min_Rrn > 0;
1808.0	50825	               C2Dspr = Min_Rrn;
1809.0	61108	           ENDIF;
1810.0	50825	
1811.0	50825	           ErrorPage = 0;
1812.0	50825	           Valid = True;
1813.0	260924	
1814.0	260924	           CostcoFunded = True;
1815.0	50825	
1816.0	61108	           // Check Subfile to see IF cursor is on a valid subfile line
1817.0	50825	
1818.0	50825	           ReadC S02;
1819.0	50825	           Dow Not %Eof;
1820.0	50825	             SflNxtChg1 = True;
1821.0	50825	             // Validate Option
1822.0	50825	             Select;
1823.0	50825	                //  Invalid Option
1824.0	51025	             When s2Opt <>  OptDlt and s2Opt <> OptDsp and
1825.0	51025	                  s2Opt <>  OptReActivate and s2Opt <> ' ';
1826.0	50825	               Valid = False;
1827.0	50825	               SetCsrPos(Poss2Opt);
1828.0	50825	               %subst(wkMsgDta:1:30) = cOption;
1829.0	50825	               %subst(wkMsgDta:31:30) = s2Opt;
1830.0	50825	               PutErrMsg (Err_BadOpt: MsgF:
1831.0	50825	               SdPgm :JobLang: wkMsgDta);
1832.0	50825	
1833.0	50825	               //   Option 4 - Remove Contract
1834.0	60227	             When s2Opt = OptDlt and s2Mode = AddMode;
1835.0	60227	               Clear S02;
1836.0	60227	               s2Mode = AddMode;
1837.0	60227	               SflNxtChg1 = False;
1838.0	50825	
1839.0	60221	             When s2Opt = OptDlt and s2Mode = *blanks;
1840.0	60223	               rollbackCnt#(rbkIndx) = s2CpnCntId;
1841.0	60223	               rollbackMode(rbkIndx) = DltMode;
1842.0	60223	               rbkIndx += 1;
1843.0	60221	
1844.0	50825	               //   Blanks with Add Mode
1845.0	50825	             When s2Mode = AddMode;
1846.0	61108	               IF s2ContId = *Zeros;
1847.0	50825	                 Clear S02;
1848.0	50825	                 s2Mode = AddMode;
1849.0	50825	                 SflNxtChg1 = False;
1850.0	60221	               else;
1851.0	60223	                 chkIndx = %lookup(s2ContId :rollbackCnt# :1);
1852.0	61108	                 IF chkIndx <> 0;
1853.0	60223	                   rollbackMode(chkIndx) = AddMode;
1854.0	60223	                 else;
1855.0	60503	                   rollbackCnt#(rbkIndx) = s2ContId;
1856.0	60223	                   rollbackMode(rbkIndx) = AddMode;
1857.0	60223	                   rbkIndx += 1;
1858.0	61108	                 ENDIF;
1859.0	61108	               ENDIF;
1860.0	50825	
1861.0	50825	               //   All Other Blanks - Skip These
1862.0	80916	
1863.0	80916	               //   Option 5 - Dsplay Contract
1864.0	80916	             When s2Opt = OptDsp;
1865.0	80916	                wkContractID = s2Contid;
1866.0	80916	                DisplayContract (wkContractID :DISPLAY);
1867.0	80916	                SflNxtChg1 = False;
1868.0	80916	                s2Opt = *Blank;
1869.0	80916	
1870.0	80916	                select;
1871.0	80916	                when keyPressed = F_Exit;
1872.0	80916	                   EndPgm = TRUE;
1873.0	80916	                   Leave;
1874.0	80916	
1875.0	80916	                when KeyPressed = F_Cancel; // F12
1876.0	80924	                     KeyPressed = F_Refresh; // override to redisplay screen
1877.0	80916	                   Leave;
1878.0	80916	
1879.0	80916	                endsl;
1880.0	50825	             When s2Opt = *Blank;
1881.0	50825	
1882.0	50825	             EndSl;
1883.0	260924	
1884.0	260924	          // In case of vendor funded, compare the coupontype on the screen with the
1885.0	260924	          // coupon type associates with each contract.
1886.0	260924	             If EnOpt = OptAdd And s2ContId <> 0;
1887.0	260924	                wkCpnTyp     = getContractCpnType(s2ContId);
1888.0	260924	                CostcoFunded = False;
1889.0	260924	                IF %TRIM(C2CPNTYP) <> %TRIM(wkCpntyp);
1890.0	260924	                   wkMsgDta = 'Coupon Type is not same as that in contract';
1891.0	260924	                   SetCsrPos (PosC2CPNTYP);
1892.0	260924	                   PutErrMsg (cBlankMsg:MsgF
1893.0	260924	                        :sdPgm :JobLang :wkMsgDta);
1894.0	260924	                   Valid = False;
1895.0	260924	                EndIf;
1896.0	260924	             EndIf;
1897.0	50825	
1898.0	50825	             //   Set Page of first error
1899.0	61108	             IF Valid = False and ErrorPage = 0;
1900.0	50825	               ErrorPage = RrnS02;
1901.0	61108	             ENDIF;
1902.0	50825	
1903.0	50825	             Update S02;
1904.0	260924	             // Clear Screen Error indicators except coupon type and reset cursor
1905.0	260924	             ErrMsginds = '0000000000000000000000000000000000000' +
1906.0	260924	                          %SubSt(ErrMsginds:38:1) + '00';
1907.0	260623	
1908.0	50825	             //  Get Next Subfile Change
1909.0	50825	             ReadC S02;
1910.0	50825	           EndDo;
1911.0	260924	
1912.0	260924	          // In case of costco funded, the coupontype on the screen must be either IRC,
1913.0	260924	          // PAPER or ECOM.
1914.0	260924	           If EnOpt = OptAdd And CostcoFunded = True And
1915.0	260924	              C2CPNTYP <> 'PAPER' And C2CPNTYP <> 'IRC' And C2CPNTYP <> 'ECOM';
1916.0	260924	              wkMsgDta = 'Coupon Type is not valid';
1917.0	260924	              SetCsrPos (PosC2CPNTYP);
1918.0	260924	              PutErrMsg (cBlankMsg:MsgF
1919.0	260924	                   :sdPgm :JobLang :wkMsgDta);
1920.0	260924	              Valid = False;
1921.0	260924	           EndIf;
1922.0	50825	
1923.0	50825	           //  Set the cursor page to first error page
1924.0	61108	           IF ErrorPage <> 0;
1925.0	50825	             C2DSPR = ErrorPage;
1926.0	50825	             //  Keep cursor in the same place
1927.0	61108	           ELSEIF CsrRrn > 0;
1928.0	50825	             C2Dspr = CsrRrn;
1929.0	61108	           ELSEIF Min_rrn > 0;
1930.0	50825	             C2Dspr = Min_rrn;
1931.0	61108	           ENDIF;
1932.0	50825	
1933.0	50825	           SflNxtChg1 = False;
1934.0	50825	
1935.0	61108	         ENDIF;
1936.0	50825	
1937.0	50825	       return;
1938.0	50825	      /end-free
1939.0	50825	     P validateInput2...
1940.0	50825	     P                 E
1941.0	50825	
1942.0	50825	       //=========================================================================
1943.0	50825	       //   Do Screen 2 loop for selected items                                  *
1944.0	50825	       //=========================================================================
1945.0	50825	     P loopSubfile2    B
1946.0	50825	     D loopSubfile2    PI
1947.0	50915	
1948.0	60221	     D rlIndex         S                   like(typeIndex) Inz
1949.0	60221	     D clrIndex        S                   like(typeIndex)
1950.0	60221	     D dupIndex        S                   like(typeIndex)
1951.0	51003	
1952.0	50825	      /free
1953.0	51018	
1954.0	51018	         checkContractErrors = False;
1955.0	51018	         errorFoundContract = False;
1956.0	60426	         allContractsInError = False;
1957.0	51025	         Reset errContract#;
1958.0	51025	         clear wkErrIndex;
1959.0	51018	
1960.0	50825	         IF SvRrnS02>0;
1961.0	50825	
1962.0	50825	           Clear w2contid;
1963.0	50825	           Clear w2mode;
1964.0	50825	           Clear w2index;
1965.0	51006	
1966.0	51012	           Reset reloadS02;
1967.0	51123	           Reset duplicateS02;
1968.0	51019	           Reset reloadS02Mode;
1969.0	51003	           Clear rlIndex;
1970.0	51018	           Clear wkContIndex;
1971.0	51028	           checkContractErrors = True;
1972.0	51108	
1973.0	51109	           indx = 1;
1974.0	51108	           %occur(wkErrorMsgDS) = 1;
1975.0	51108	           clear *all wkErrorMsgDS;
1976.0	50825	
1977.0	50921	           READC S02;
1978.0	50921	           DOW NOT %EOF
1979.0	50921	                 and NOT EndPgm;
1980.0	51101	
1981.0	50825	             SflNxtChg1 = True;
1982.0	51123	             rlIndex += 1;
1983.0	51123	
1984.0	51123	             // Check for duplicate contract number
1985.0	51123	             dupIndex = %lookup(s2ContId :reloadS02 :1);
1986.0	61108	             IF dupIndex > 0;
1987.0	51123	               duplicateS02(rlIndex) = s2ContId;
1988.0	61108	             ENDIF;
1989.0	51123	
1990.0	60221	             reloadS02(rlIndex) = s2ContID;
1991.0	60221	             reloadS02Mode(rlIndex) = s2Mode;
1992.0	50825	
1993.0	50825	             // Build Coupon-Coupon Contract Association
1994.0	61108	             IF s2ContId <> *Zeros and s2Mode = AddMode
1995.0	50825	               and s2Opt <> OptDlt;
1996.0	51006	
1997.0	50825	               Clear CpnCntAscDS;
1998.0	51018	               checkContractErrors = True;
1999.0	50825	               CpnCntAscDS.CouponId = c2CpnId;
2000.0	50825	               CpnCntAscDS.ContractId = s2Contid;
2001.0	51027	               CpnCntAscDS.StatusCode = cActive;
2002.0	51026	               RecOption = cApplyBR;
2003.0	61108	               IF not PutCouponContractAssoc(AddMode: RecOption: CpnCntAscDS);
2004.0	50825	                  UpdFailedFlag = True;
2005.0	61108	               ENDIF;
2006.0	51018	
2007.0	50825	               w2index += 1;
2008.0	50825	               w2contid(w2index) = s2contid;
2009.0	50825	               w2mode(w2index) = AddMode;
2010.0	61108	             ENDIF;
2011.0	50825	
2012.0	50825	             // Process Select Option
2013.0	50825	             Select;
2014.0	50825	               //   Option 5 - Display
2015.0	50825	             When s2Opt = OptDsp;
2016.0	50825	               SflNxtChg1 = False;
2017.0	51014	               reset reloadS02(rlIndex);
2018.0	51019	               reset reloadS02Mode(rlIndex);
2019.0	51123	               reset duplicateS02(rlIndex);
2020.0	50825	               Clear s2opt;
2021.0	50915	
2022.0	50825	               //   Option 4 - Remove Contract
2023.0	50825	             When s2Opt = OptDlt;
2024.0	50825	               Clear CpnCntAscDS;
2025.0	51018	               checkContractErrors = True;
2026.0	50825	               CpnCntAscDS.CouponId = c2CpnId;
2027.0	50825	               CpnCntAscDS.ContractId = s2ContId;
2028.0	51014	               CpnCntAscDS.KeyFieldId = s2CpnCntId;
2029.0	51025	               CpnCntAscDS.StatusCode = s2STAT;
2030.0	51025	               RecOption = cApplyBR;
2031.0	80916	               IF not PutCouponContractAssoc(DELETE: RecOption: CpnCntAscDS);
2032.0	50825	                 UpdFailedFlag = True;
2033.0	61108	               ENDIF;
2034.0	50825	               w2index += 1;
2035.0	50825	               w2contid(w2index) = s2contid;
2036.0	50825	               w2mode(w2index) = DltMode;
2037.0	51019	
2038.0	51019	               // Remove contract from reload array
2039.0	60223	              clrIndex = %lookup(s2ContId :reloadS02 :1);
2040.0	61108	              IF clrIndex > 0;
2041.0	60223	                reloads02(clrIndex) = *loval;
2042.0	61108	              ENDIF;
2043.0	50915	
2044.0	50915	               //   Option 8 - ReActivate Contract
2045.0	50915	             When s2Opt = OptReActivate;
2046.0	50915	               Clear CpnCntAscDS;
2047.0	51018	               checkContractErrors = True;
2048.0	50915	               CpnCntAscDS.CouponId = c2CpnId;
2049.0	50915	               CpnCntAscDS.ContractId = s2ContId;
2050.0	51014	               CpnCntAscDS.KeyFieldId = s2CpnCntId;
2051.0	51025	               CpnCntAscDS.StatusCode = s2Stat;
2052.0	51025	               RecOption = cApplyBR;
2053.0	61108	               IF not PutCouponContractAssoc(ReActivateMode: RecOption:
2054.0	51025	                                             CpnCntAscDS);
2055.0	50915	                 UpdFailedFlag = True;
2056.0	61108	               ENDIF;
2057.0	51028	               // Remove contract from reload array
2058.0	51028	              clrIndex = %lookup(s2ContId :reloadS02 :1);
2059.0	61108	              IF clrIndex > 0;
2060.0	51123	                reloadS02(clrIndex) = *loval;
2061.0	51123	                duplicateS02(clrIndex) = *loval;
2062.0	61108	              ENDIF;
2063.0	50825	             EndSl;
2064.0	51018	
2065.0	61108	             // Clear subfile record IF contract number blank
2066.0	61108	             IF s2ContId = *zeros;
2067.0	51018	               clear s02;
2068.0	51018	               s2Mode = AddMode;
2069.0	61108	             ENDIF;
2070.0	50915	
2071.0	50825	             // Position on F12 record
2072.0	61108	             IF WkFn = F_Cancel;
2073.0	50825	               SetCsrPos(Poss2Last);
2074.0	61108	             ENDIF;
2075.0	51025	
2076.0	51110	          // Move error messages to hold data structure to use later
2077.0	51109	             indxHld = 1;
2078.0	51109	             %occur(wkErrorMsgDS) = indx;
2079.0	51109	             %occur(ErrorMsgDS) = indxHld;
2080.0	51108	
2081.0	51109	             DoW ErrorMsgDS <> *blank and indxHld < 10000;
2082.0	51108	               wkErrorMsgDS = ErrorMsgDS;
2083.0	51108	               indx += 1;
2084.0	51109	               indxHld += 1;
2085.0	61108	               IF ErrorMsgDS.ErrMessagID = cDuplicateContract;
2086.0	51123	                 duplicateS02(rlIndex) = s2ContId;
2087.0	61108	               ENDIF;
2088.0	51109	               %occur(wkErrorMsgDS) = indx;
2089.0	51109	               %occur(ErrorMsgDS) = indxHld;
2090.0	51108	             enddo;
2091.0	51025	
2092.0	61108	             IF indxHld > 1 and ErrorPage = 0;
2093.0	51107	               ErrorPage = RrnS02;
2094.0	61108	             ENDIF;
2095.0	50825	
2096.0	51110	             UPDATE S02;
2097.0	50825	             // Clear Screen Error indicators and reset cursor
2098.0	50825	             ErrMsginds = *all'0';
2099.0	61108	             // Leave loop IF F12 pressed on any subscreen
2100.0	61108	             IF WkFn = F_Cancel;
2101.0	50825	               Leave;
2102.0	61108	             ENDIF;
2103.0	50825	
2104.0	50921	             READC S02;
2105.0	50825	           ENDDO;
2106.0	51107	
2107.0	50914	           // Check the error messages passed back by business rules
2108.0	61108	           IF checkContractErrors and not errorFoundContract;
2109.0	51018	             checkContractErrors = False;
2110.0	51018	             errorFoundContract = False;
2111.0	60426	             allContractsInError = False;
2112.0	60427	             reset cancelWarnings;
2113.0	60426	             wkWarningIndex = 1;
2114.0	51018	             Clear CpnCntAscDS;
2115.0	51018	             CpnCntAscDS.CouponId = c2CpnId;
2116.0	51028	             CpnCntAscDS.StatusCode = 'ACT';
2117.0	80916	             IF not CheckCouponContractAssoc(CHANGE : CpnCntAscDS);
2118.0	51018	               CheckContractMsgs ();
2119.0	51014	
2120.0	61108	               // Display warnings IF found
2121.0	61108	               IF warningsFound and not ErrorFoundContract;
2122.0	60707	                 processScreen6();
2123.0	61108	               ENDIF;
2124.0	60427	
2125.0	51018	               // Rebuild subfile with new contract info
2126.0	61108	               IF not cancelWarnings;
2127.0	60427	                 clearScreen2 ();
2128.0	60427	                 loadScreen2 ();
2129.0	61108	               ENDIF;
2130.0	51014	
2131.0	61108	             ENDIF;
2132.0	61108	           ENDIF;
2133.0	60426	
2134.0	61108	           IF ErrorFoundContract;
2135.0	80916	              SetEnvironment(ROLLBACK);
2136.0	61108	              // Check IF any contracts should be deleted after rollback
2137.0	60223	              resetContracts(DltMode);
2138.0	61108	              IF errorpage <> 0;
2139.0	51028	                c2dspr = errorpage;
2140.0	61108	              ENDIF;
2141.0	61108	           ENDIF;
2142.0	50825	
2143.0	50915	           SflNxtChg1 = False;
2144.0	50915	           WkFn = *Blank;
2145.0	61108	         ENDIF;
2146.0	50825	
2147.0	50825	       return;
2148.0	50825	      /end-free
2149.0	50825	     P loopSubfile2    E
2150.0	50825	
2151.0	50825	       //=======================================================================
2152.0	50825	       //   Load SFL Data
2153.0	50825	       //=======================================================================
2154.0	50825	     P loadScreen2     B
2155.0	50825	     D loadScreen2     PI
2156.0	51003	
2157.0	60221	     D resetIndex      S                   like(typeIndex) Inz
2158.0	60221	     D reloadIndex     S                   like(typeIndex)
2159.0	60221	     D dupIndex        S                   like(typeIndex)
2160.0	51125	     D firstDuplicate  S               N   Inz(True)
2161.0	51003	
2162.0	50825	      /free
2163.0	50926	         reset ContractExists;
2164.0	51125	         reset firstDuplicate;
2165.0	51104	         wkDftCompanyNumber = 0;
2166.0	51104	         wkDftDepartmentNumber = 0;
2167.0	91214	         vendorFunded = FALSE;
2168.0	91214	         contractLinked = FALSE;
2169.0	90127	         WkRckAllowed = *Blank;
2170.0	100326	         wkDftCouponLimit = 1;
2171.0	100401	         wkDftCpnDescription = *blanks  ;
2172.0	260423	         EnContID =*ZERO;
2173.0	50926	
2174.0	50825	         RrnS02 = SvRrnS02;
2175.0	50825	         CntLnesS02 = 0;
2176.0	50825	         ProtContId = False;
2177.0	61108	         IF EnOpt = OptChg;
2178.0	50825	            ProtContId = True;
2179.0	61108	         ENDIF;
2180.0	51017	
2181.0	51108	         //  Load subfile a page at a time
2182.0	50825	         DoU cReqRowsCpnCntCpnAsc <> wkAct#ofrows
2183.0	50825	             and RrnS02 <= cMaxRRN;
2184.0	50825	
2185.0	61108	           IF rrnS02 = 0;
2186.0	80916	             wkAct#ofRows = GetCouponContract(c2CpnId :EQUALG);
2187.0	50825	           else;
2188.0	80916	             wkAct#ofRows = GetCouponContract(c2CpnId :NEXT);
2189.0	61108	           ENDIF;
2190.0	260423	
2191.0	50825	           For wkINDEX = 1 to wkAct#ofrows;
2192.0	50825	             Clear S02;
2193.0	50825	             %occur(CouponContractDS) = wkIndex;
2194.0	60221	
2195.0	50825	             CallP UpdContractS02Flds();
2196.0	260623	             //EnContID = S2ContID;
2197.0	50825	
2198.0	61108	          // Clear the reload array IF contract already written
2199.0	51019	             resetIndex = %lookup(s2ContId :reloadS02 :1);
2200.0	61108	             IF resetIndex > 0
2201.0	51123	               and duplicateS02(resetIndex) <> reloadS02(resetIndex);
2202.0	51110	               SflNxtChg1 = True;
2203.0	51110	               s2Mode = reloads02Mode(resetIndex);
2204.0	51110	               reset reloads02Mode(resetIndex);
2205.0	51123	               reloadS02(resetIndex) = *loval;
2206.0	51123	               duplicateS02(resetIndex) = *loval;
2207.0	51019	             else;
2208.0	51019	               SflNxtChg1 = False;
2209.0	61108	             ENDIF;
2210.0	51003	
2211.0	51018	          // Check for contracts in error and position cursor accordingly
2212.0	51019	             wkErrIndex = %lookup(s2ContId :errContract# :1);
2213.0	51125	             dupIndex   = %lookup(s2ContId :duplicateS02 :1);
2214.0	61108	             IF wkErrIndex > 0 and
2215.0	51125	                dupIndex   > 0 and
2216.0	51125	                firstDuplicate;
2217.0	51125	               wkErrIndex = 0;
2218.0	51125	               firstDuplicate = False;
2219.0	61108	             ENDIF;
2220.0	51125	
2221.0	61108	             IF wkErrIndex > 0 or allContractsInError;
2222.0	51019	               setCsrPos (PosS2CONTID);
2223.0	51019	               ProtContId = False;
2224.0	51108	             else;
2225.0	51108	               ErrMsginds = *all'0';
2226.0	61108	             ENDIF;
2227.0	51017	
2228.0	61108	             IF EnOpt = OptCpy;
2229.0	50825	               SflNxtChg1 = True;
2230.0	50825	               s2Mode = AddMode;
2231.0	61108	             ENDIF;
2232.0	51109	             RrnS02 += 1;
2233.0	51109	             CntLnesS02 += 1;
2234.0	61108	             IF CntLnesS02 = 1;
2235.0	50825	               CsrStart=RrnS02;
2236.0	61108	             ENDIF;
2237.0	50825	             Write S02;
2238.0	51104	
2239.0	61108	             IF wkIndex = 1 and EnOpt = OptAdd;
2240.0	51104	                wkDftCompanyNumber = s2cpyc;
2241.0	51104	                wkDftDepartmentNumber = s2dept;
2242.0	100309	                wkDftCpnDescription   = CouponContractDS.contractDescription;
2243.0	100326	                if CouponContractDS.couponTypeCode = PAPER;
2244.0	100409	                  wkDftCouponLimit = 01;
2245.0	100309	                else;
2246.0	100409	                  wkDftCouponLimit = 99;
2247.0	100309	                endif;
2248.0	61108	             ENDIF;
2249.0	50825	           EndFor;
2250.0	100524	           contractLinked = (RrnS02 > 0);
2251.0	50825	
2252.0	50825	         EndDo;
2253.0	50825	
2254.0	50825	         Select;
2255.0	50825	         When EnOpt = OptDlt or EnOpt = OptDsp or
2256.0	50825	              EnOpt = OptPOSMaint or EnOpt = OptReActivate;
2257.0	50825	           EndS02 = True;
2258.0	50825	
2259.0	50825	         Other;
2260.0	50825	           ProtContId = False;
2261.0	61108	           IF rrnS02 > 0;
2262.0	50825	             CntLnesS02 = %Rem(RRNS02:cRecPageS02);
2263.0	61108	           ENDIF;
2264.0	61108	           IF CntLnesS02 < cRecPageS02 and RrnS02 < cMaxRRN
2265.0	50825	              and (EnOpt = OptAdd or EnOpt = OptCpy or EnOpt = OptChg);
2266.0	50825	             EndS02 = False;
2267.0	51102	
2268.0	61108	          // Check IF any contracts in reload array and load into subfile
2269.0	51018	             reloadIndex = 1;
2270.0	51018	             Dow reloadS02(reloadIndex) <> *Hival;
2271.0	61108	               IF reloadS02(reloadIndex) = *loval;
2272.0	51019	                 reloadIndex += 1;
2273.0	51019	                 iter;
2274.0	61108	               ENDIF;
2275.0	51019	
2276.0	51109	               RrnS02 += 1;
2277.0	51109	               CntLnesS02 += 1;
2278.0	51018	               CsrStart = rrnS02;
2279.0	51019	               SflNxtChg1 = True;
2280.0	51102	
2281.0	51018	            // Clear SFL fields
2282.0	51018	               CLEAR S02;
2283.0	51018	               s2ContId = reloadS02(reloadIndex);
2284.0	51019	               s2Mode =  reloadS02Mode(reloadIndex);
2285.0	51102	
2286.0	51018	            // Check for contracts in error and position cursor accordingly
2287.0	51018	               wkErrIndex = %lookup(s2ContId :errContract# :1);
2288.0	61108	               IF wkErrIndex > 0 or allContractsInError;
2289.0	51018	                 setCsrPos (PosS2CONTID);
2290.0	51018	                 ProtContId = False;
2291.0	61108	               ENDIF;
2292.0	51102	
2293.0	51018	               Write S02;
2294.0	51109	               reset reloads02(reloadindex);
2295.0	51123	               reset duplicates02(reloadindex);
2296.0	51018	               reloadIndex += 1;
2297.0	51102	
2298.0	51018	            // Clear Screen Error indicators and reset cursor
2299.0	51018	               ErrMsginds = *all'0';
2300.0	51018	             enddo;
2301.0	51017	
2302.0	51018	          // Clear Screen Error indicators and reset cursor
2303.0	51017	             ErrMsginds = *all'0';
2304.0	51014	
2305.0	51018	          // Fill the rest of the subfile page with blank records
2306.0	61108	             IF rrnS02 > 0;
2307.0	51125	               CntLnesS02 = %Rem(RRNS02:cRecPageS02);
2308.0	61108	             ENDIF;
2309.0	50825	             Dow CntLnesS02 < cRecPageS02;
2310.0	50825	               RrnS02 = RrnS02 + 1;
2311.0	61108	               IF RrnS02 > cRecPageS02 and firstpass;
2312.0	61108	               ELSE;
2313.0	50825	                 CsrStart = rrnS02;
2314.0	61108	               ENDIF;
2315.0	50825	               CntLnesS02 = CntLnesS02 + 1;
2316.0	50825	               SflNxtChg1 = False;
2317.0	51018	            // Clear SFL fields
2318.0	50825	               CLEAR S02;
2319.0	50825	               s2Mode = AddMode;
2320.0	50825	               Write S02;
2321.0	50825	             EndDo;
2322.0	61108	           ENDIF;
2323.0	50825	         EndSl;
2324.0	50825	
2325.0	50825	         firstpass = false;
2326.0	50825	         SvRrnS02 = RrnS02;
2327.0	50825	         NumRecAdd = 0;
2328.0	50825	
2329.0	50825	         // Indicate More records / this may be needed rather than loading blank pages
2330.0	50825	         IF RrnS02 >= cMaxRRN or EndS02 = True;
2331.0	50825	           SflEnd1 = True;
2332.0	50825	         ELSE;
2333.0	50825	           SflEnd1 = False;
2334.0	61108	         ENDIF;
2335.0	50825	
2336.0	61108	         // Empty Subfile? / this may be needed IF no blank pages
2337.0	50825	         SflDsp1 =(RrnS02 > 0);
2338.0	50825	         IF RrnS02 = 0;
2339.0	50825	           PutErrMsg (NoSflRecs: MsgF:
2340.0	50825	            SdPgm :JobLang);
2341.0	50825	         ELSE;
2342.0	61108	           // Set Subfile Display IF Records Loaded to Subfile
2343.0	50825	           //  Default cursor to first record, last screen
2344.0	91215	           C2DSPR = CsrStart;
2345.0	61108	         ENDIF;
2346.0	91215	
2347.0	100421	         If EnOpt = OptAdd or EnOpt = OptCpy or EnOpt = OptChg;
2348.0	100421	           wkDftTaxCode = *blanks;
2349.0	100421	           getDefaultTaxCode();
2350.0	100421	           select;
2351.0	100421	           when contractLinked and not vendorFunded;
2352.0	100421	             wkDftTaxCode = xItemTaxCode;
2353.0	260806	           when contractLinked and vendorFunded and
2354.0	260806	                                wkDftCompanyNumber <> CA_COMPANY;
2355.0	100421	             wkDftTaxCode = xCouponTaxCode;
2356.0	260806	           when contractLinked and vendorFunded and
2357.0	260806	                                 wkDftCompanyNumber = CA_COMPANY;
2358.0	260623	             wkDftTaxCode = xItemTaxCode;
2359.0	100421	           endsl;
2360.0	100421	         endif;
2361.0	50825	
2362.0	50825	       return;
2363.0	50825	      /end-free
2364.0	50825	     P loadScreen2     E
2365.0	50825	
2366.0	50825	       //=========================================================================
2367.0	50825	       //   Process Screen C03                                                   *
2368.0	50825	       //=========================================================================
2369.0	50825	     P processScreen3  B
2370.0	50825	     D processScreen3  PI
2371.0	50825	      /free
2372.0	170516	         // Condition the indicator to dispaly 'No Math' and Disclaimer flag
2373.0	170516	         // by default when mode is Add.
2374.0	170516	         EnableDisTPD = False ;
2375.0	170516	         if enOpt = OptAdd ;
2376.0	170516	           EnableDisTPD  = True;
2377.0	170516	         endif ;
2378.0	170516	
2379.0	61108	         // Fill screen IF needed, display and process user action
2380.0	61108	         IF Fill03YN;
2381.0	60110	           loadScreenFields3 ();
2382.0	61108	         ENDIF;
2383.0	50825	         displayScreen3 ();
2384.0	50825	         testUserAction3 ();
2385.0	50825	
2386.0	50825	       return;
2387.0	50825	      /end-free
2388.0	50825	     P processScreen3  E
2389.0	50825	
2390.0	50825	       //=========================================================================
2391.0	50825	       //   Display I/O for Screen C03                                           *
2392.0	50825	       //=========================================================================
2393.0	50825	     P displayScreen3  B
2394.0	50825	     D displayScreen3  PI
2395.0	50825	      /free
2396.0	50825	         Select;
2397.0	50825	           When EnOpt = OptDlt;
2398.0	50825	             PutErrMsg (' '  :MsgF:
2399.0	50825	                SdPgm :JobLang :cConfirmDelete);
2400.0	50825	           When EnOpt = OptPOSMaint;
2401.0	50825	             PutErrMsg (' '  :MsgF:
2402.0	50825	                SdPgm :JobLang :cConfirmPOSMaint);
2403.0	50825	           When EnOpt = OptReActivate;
2404.0	50825	             PutErrMsg (' '  :MsgF:
2405.0	50825	                SdPgm :JobLang :cConfirmReActivate);
2406.0	50825	         EndSl;
2407.0	50825	
2408.0	50825	         // Display current screen and wait for input
2409.0	50825	         WRITE C02;
2410.0	61108	         IF EnOpt = OptDlt or EnOpt = OptDsp or
2411.0	50825	            EnOpt = OptPOSMaint or EnOpt = OptReActivate;
2412.0	50825	           WRITE R03B;
2413.0	50825	         else;
2414.0	100309	           if not switch_F_Key;
2415.0	100309	             WRITE R03;
2416.0	100309	           else;
2417.0	100309	             WRITE R03C;
2418.0	100309	           endif;
2419.0	61108	         ENDIF;
2420.0	50825	         WRITE MC01;
2421.0	260623	
2422.0	260623	         // Once a Company Number is entered, the Company Number field
2423.0	260623	         // is protected from editing. To change it, refresh and enter the new one.
2424.0	260623	         if C3CmyNbr = US_COMPANY or C3CmyNbr = CA_COMPANY;
2425.0	260623	            ProtCmyNbr = True;
2426.0	260623	         else;
2427.0	260623	            ProtCmyNbr = False;
2428.0	260623	         endif;
2429.0	260623	
2430.0	50825	         EXFMT C03;
2431.0	50825	       return;
2432.0	50825	      /end-free
2433.0	50825	     P displayScreen3  E
2434.0	50825	
2435.0	50825	       //=========================================================================
2436.0	50825	       //   Fill Screen fields for Screen C03                                    *
2437.0	50825	       //=========================================================================
2438.0	50825	     P loadScreenFields3...
2439.0	50825	     P                 B
2440.0	50825	     D loadScreenFields3...
2441.0	50825	     D                 PI
2442.0	90128	     D  Wk_Signed      S             13  0
2443.0	90128	     D  KeyUpc         S             15A
2444.0	110829	      * Parms passed to getUPCCheckDigit
2445.0	90128	     D ParmMode        S              1A
2446.0	90128	     D ParmUPC#        S             15A
2447.0	90128	     D ParmCalChk#     S              1A
2448.0	90128	     D ParmMsgFlag     S              1A
2449.0	90128	     D Get             C                   'G'
2450.0	90128	     D ParmRck         C                   '2'
2451.0	260623	      // Local variables
2452.0	260623	     D wkCouponExcp    S              1N
2453.0	260623	     D res             S             11P 0
2454.0	260623	     D resWithZero     S             12P 0
2455.0	260623	     D tempUPC         S             13A
2456.0	260623	     D wkParmUpc       S             13A
2457.0	260623	     D workChar11      S             12A
2458.0	50825	      /free
2459.0	50825	         // Use to transfer fields from one screen to another / or file to screen
2460.0	50825	         Clear C03;
2461.0	90128	         ParmMode = Get;
2462.0	90128	         ParmCalChk# = *Blank;
2463.0	90128	         ParmMsgFlag = *Blank;
2464.0	90622	         c3CpnId = c2CpnId;
2465.0	90622	         c3ChgUser = C2ChgUser;
2466.0	90622	         c3ChgDate = C2ChgDate;
2467.0	90622	         c3ChgTime = C2ChgTime;
2468.0	50825	
2469.0	61108	         IF EnOpt <> OptAdd;
2470.0	61108	           IF EnOpt = OptCpy OR EnOpt = OptChg;
2471.0	50825	             %occur(CouponMasterDS) = 1;
2472.0	50825	             CouponMasterDS = CpnMasterDS2;
2473.0	61108	           ENDIF;
2474.0	50825	           c3Cmynbr   = CouponMasterDS.CompanyNumber;
2475.0	50825	           c3Cpndes1  = %Subst(CouponMasterDS.longdescription:01:40);
2476.0	50825	           c3Cpndes2  = %Subst(CouponMasterDS.longdescription:41:40);
2477.0	50825	           c3RDes     = CouponMasterDS.registerDescription;
2478.0	50825	           c3POSDEPT  = CouponMasterDS.posDepartmentNumber;
2479.0	50825	           c3POSFmCd  = CouponMasterDS.posFamilyCode;
2480.0	50825	           c3PPFLG    = CouponMasterDS.promptPriceInd;
2481.0	50825	           c3MrgnDstc = CouponMasterDS.MarginDistributionCode;
2482.0	50825	           c3SoftWkIn = CouponMasterDS.allowSoftWeekIndicator;
2483.0	50825	           c3RdmpTnTy = CouponMasterDS.RedemptionType;
2484.0	260623	           c3execcpn  = CouponMasterDS.AllowRandomValueIndicator;
2485.0	61108	           IF EnOpt <> OptCpy;
2486.0	50916	             c3UPCNbr   = CouponMasterDS.upcNumber;
2487.0	260623	
2488.0	260623	             tempUPC = %editc(c3UPCNbr : 'X');
2489.0	260623	                 if %subst(tempUPC : 1 : 3) = CN_PAPER_PREF;
2490.0	260623	                 workChar11 = %subst(tempUPC : 1 : 12);
2491.0	260623	                 res = %dec(workChar11 : 11 : 0);
2492.0	260623	                 res = res - 1;
2493.0	260623	                 resWithZero = %dec((%editc(res : 'X') + '0') : 12 : 0);
2494.0	260623	                 parmUPC# = %editc(resWithZero : 'X');
2495.0	260623	                 getUPCCheckDigit(ParmMode: parmUPC#: ParmCalChk#: ParmMsgFlag);
2496.0	260623	                 wkParmUpc = %subst(%trim(parmUpc#) : 1 : 11) + parmCalChk#;
2497.0	260623	                 c3rckupc = %Dec(wkParmUpc : 13 : 0);
2498.0	260623	                 else;
2499.0	260623	
2500.0	260623	                    C3RckUPC = 0;
2501.0	260623	                    Wk_Signed = c3upcnbr;
2502.0	260623	                    EvalR ParmUPC# = %SUBST(%Editc(Wk_Signed:'X'):1:12) + '0';
2503.0	260623	                    ParmUPC# = %Replace(ParmRck:ParmUPC#:4:1);
2504.0	260623	                    getUPCCheckDigit(ParmMode:ParmUPC#:ParmCalChk#:ParmMsgFlag);
2505.0	260623	                    KeyUpc = %Replace(ParmCalChk#:ParmUPC#:15:1);
2506.0	260623	                    C3RckUPC = %Dec(%SUBST(KeyUpc:3:13):15:0);
2507.0	260623	
2508.0	260623	                 endif;
2509.0	61108	           ENDIF;
2510.0	90128	
2511.0	50825	           c3CpnTaxC  = CouponMasterDS.CouponTaxCode;
2512.0	51011	
2513.0	51101	           // Get Tax Code description
2514.0	90130	           C3CPNTAXCD = *Blanks;
2515.0	260806	           IF c3CpnTaxC <> *Blank AND c3Cmynbr <> CA_COMPANY;
2516.0	51011	           wkAct#ofRows3c = GetTaxCodeDescription(C3CPNTAXC);
2517.0	61108	           IF wkAct#ofRows3c > 0;
2518.0	80919	             C3CPNTAXCD = wkNewTax;
2519.0	61108	           ENDIF;
2520.0	90130	           ENDIF;
2521.0	50825	
2522.0	51101	           // Get Margin Distribution Code description
2523.0	61108	           IF GetCodeDescription(C3MRGNDSTC :
2524.0	51010	                                 tableDistributionCodes) = True;
2525.0	51010	             c3MrgnDstD = TableDS.LDESC;
2526.0	61108	           ENDIF;
2527.0	50831	
2528.0	50825	           Monitor;
2529.0	50825	             c3MinCnt = CouponMasterDS.minimumPurchaseCount;
2530.0	50825	           On-Error;
2531.0	50825	             c3MinCnt = 0;
2532.0	50825	           EndMon;
2533.0	50825	
2534.0	50825	           Monitor;
2535.0	50825	             c3FreeCnt = CouponMasterDS.getFreeCount;
2536.0	50825	           On-Error;
2537.0	50825	             c3FreeCnt = 0;
2538.0	50825	           EndMon;
2539.0	50825	
2540.0	50825	           Monitor;
2541.0	50825	             c3MaxCnt = CouponMasterDS.maximumPurchaseCount;
2542.0	50825	           On-Error;
2543.0	50825	             c3MaxCnt = 0;
2544.0	50825	           EndMon;
2545.0	50825	
2546.0	61108	         ELSE;
2547.0	51104	           c3CmyNbr   = wkDftCompanyNumber;
2548.0	51104	           c3POSDept  = wkDftDepartmentNumber;
2549.0	100309	           C3CPNDES2  = wkDftCpnDescription;
2550.0	50825	           c3MINCNT   = 01;
2551.0	50825	           c3PPFLG    = No;
2552.0	50825	           c3SoftWkIn = No;
2553.0	100309	           c3MaxCnt   = wkDftCouponLimit;
2554.0	50825	           c3FreeCnt  = 00;
2555.0	100309	           c3MrgnDstc = 'CPN';
2556.0	50825	           c3RdmpTnTy = 'CASH';
2557.0	260623	           c3execcpn  = No;
2558.0	91216	           if wkDftTaxCode <> *Blanks;
2559.0	91216	             c3CPNTAXC = wkDftTaxCode;
2560.0	91216	           endif;
2561.0	91216	         ENDIF;
2562.0	100309	
2563.0	260623	         //if c3UPCNbr = 0;
2564.0	260623	           //c3UPCNbr = generateCouponUPC (couponMasterDS.couponId) ;
2565.0	260623	         //endif;
2566.0	100309	
2567.0	100309	         //Get RainCheck UPC Number
2568.0	100309	         //Reset Rain Check Upc number.
2569.0	260623	         // C3RckUPC = 0;
2570.0	260623	         //Wk_Signed = c3upcnbr;
2571.0	260623	         //EvalR ParmUPC# = %SUBST(%Editc(Wk_Signed:'X'):1:12) + '0';
2572.0	260623	         //ParmUPC# = %Replace(ParmRck:ParmUPC#:4:1);
2573.0	260623	         //getUPCCheckDigit(ParmMode:ParmUPC#:ParmCalChk#:ParmMsgFlag);
2574.0	260623	         //KeyUpc = %Replace(ParmCalChk#:ParmUPC#:15:1);
2575.0	260623	         //C3RckUPC = %Dec(%SUBST(KeyUpc:3:13):15:0);
2576.0	51101	
2577.0	51101	         // Get Margin Distribution Code description
2578.0	61108	         IF GetCodeDescription(C3RDMPTNTY :
2579.0	51101	                               tableRedemptionTypeCodes) = True;
2580.0	51101	           c3RdmptnTD = TableDS.LDESC;
2581.0	61108	         ENDIF;
2582.0	51104	
2583.0	51104	         // Get Company description
2584.0	51104	         wkAct#ofRows3c = GetCompanyDescription(c3CmyNbr);
2585.0	61108	         IF wkAct#ofRows3c > 0;
2586.0	51122	           c3CpyNbrDs = CompanyDescDS.CMCNAM;
2587.0	61108	         ENDIF;
2588.0	51104	
2589.0	51104	         // Get Department description
2590.0	51104	         wkAct#ofRows3c = GetDepartmentDescription(c3POSDept);
2591.0	61108	         IF wkAct#ofRows3c > 0;
2592.0	51122	           c3POSDeptD = DeptDescDS.DGDESL;
2593.0	61108	         ENDIF;
2594.0	100309	
2595.0	100309	         if EnOpt = OptAdd or getItemFromContract;
2596.0	100309	           PutCouponItemAssocAuto();
2597.0	100309	           getItemFromContract = FALSE;
2598.0	100309	         endif;
2599.0	50825	
2600.0	51026	         // GetECoupon Group
2601.0	51026	         LoadCouponGroup();
2602.0	51026	
2603.0	161228	         // Load Coupon Disclaimer Compliance Flag
2604.0	170516	
2605.0	170516	         // Load Coupon Disclaimer Flag and 'No Math' flag if -
2606.0	170516	         // there is a contract for the coupon and if it is IRC based on
2607.0	170516	         // coupon data structure values or
2608.0	170516	         // if there is no contract but the couponid type is 1 in
2609.0	170516	         // coupon location association file which means it is an IRC coupon
2610.0	170516	
2611.0	170516	         if ((CouponMasterDS.Contractid <> 0
2612.0	170516	                or  CouponContractDS.Contractid <> 0 )
2613.0	170516	            and (CouponMasterDS.CouponTypeCode = 'IRC'
2614.0	170516	                or CouponContractDS.CouponTypeCode = 'IRC'))
2615.0	170516	
2616.0	170516	         or ((enOpt = OptChg or Enopt = OptDsp or Enopt = OptDlt )
2617.0	170516	            and IsCostcoFundedIRCCoupon(c3CpnId))  ;
2618.0	170516	
2619.0	161228	            ViewSignDesc = True;
2620.0	161228	            wkAct#ofRows3c = getCouponDisclaimerFlag(c3CpnId);
2621.0	161228	            if wkAct#ofRows3c > 0;
2622.0	161228	               c3SDSCFLG  = CpnDisclaimerDS.sngdscflg;
2623.0	161228	               couponDisclaimerExists = True;
2624.0	161228	            else;
2625.0	161228	               c3SDSCFLG  = *Blanks;
2626.0	161228	               couponDisclaimerExists = False;
2627.0	161228	            endif;
2628.0	170516	
2629.0	170516	         // Load TPD Flag
2630.0	170516	            ViewSignTPD = True;
2631.0	170516	            wkAct#ofRows3c = getCouponTPDFlag(c3CpnId);
2632.0	170516	            if wkAct#ofRows3c > 0;
2633.0	170516	               c3TPDFLG  = CpnTPDds.CPNTPDflg;
2634.0	170516	               couponTPDExists = True;
2635.0	170516	            else;
2636.0	170516	               c3TPDFLG  = 'Y'   ;
2637.0	170516	               couponTPDExists = False;
2638.0	170516	            endif;
2639.0	260623	         // Load Exception Sign
2640.0	260623	            TempID = C3CPNID;
2641.0	260623	            wkCouponExcp = GetTPDExceptionSign(TempID);
2642.0	260623	               if wkCouponExcp = True;
2643.0	260623	               C3EXCPSGN = Yes;
2644.0	260623	               else;
2645.0	260623	               C3EXCPSGN = No;
2646.0	260623	               endif;
2647.0	161228	         else;
2648.0	161228	            ViewSignDesc = False;
2649.0	170516	            ViewSignTPD  = False;
2650.0	260623	            IF C3EXCPSGN = *blanks;
2651.0	260623	            TempID = C3CPNID;
2652.0	260623	            wkCouponExcp = GetTPDExceptionSign(TempID);
2653.0	260623	               if wkCouponExcp = True;
2654.0	260623	               C3EXCPSGN = Yes;
2655.0	260623	               else;
2656.0	260623	               C3EXCPSGN = No;
2657.0	260623	               endif;
2658.0	260623	            ENDIF;
2659.0	161228	         endif;
2660.0	170516	
2661.0	260623	         //default the Show Math Flag to Y
2662.0	260623	         //default the Exception Sign to N
2663.0	170516	         if EnOpt = OptAdd;
2664.0	170516	           C3TPDFLG = 'Y' ;
2665.0	260623	           C3EXCPSGN = No;
2666.0	170516	         endif ;
2667.0	161228	
2668.0	50825	         // Clear the subfile
2669.0	50825	         clearScreen3 ();
2670.0	50825	
2671.0	50825	         loadScreen3 ();
2672.0	50825	
2673.0	50825	         Fill03YN = FALSE;
2674.0	50825	
2675.0	50825	       return;
2676.0	50825	      /end-free
2677.0	50825	     P loadScreenFields3...
2678.0	50825	     P                 E
2679.0	50825	
2680.0	50825	       //=========================================================================
2681.0	50825	       //   Clear Screen fields for Screen C03                                   *
2682.0	50825	       //=========================================================================
2683.0	50825	     P clearScreen3    B
2684.0	50825	     D clearScreen3    PI
2685.0	50825	      /free
2686.0	50825	         // Clear subfile.                                                         *
2687.0	50825	
2688.0	50825	         SflDsp2 = False;
2689.0	50825	         SflDspcTL2 = False;
2690.0	50825	         SflEnd2 = False;
2691.0	50825	         WRITE C03;
2692.0	50825	
2693.0	50825	         SflDspcTL2 = True;
2694.0	50825	         SflNxtChg2 = False;
2695.0	61108	         IF EnOpt = OptAdd or EnOpt = OptChg or EnOpt = OptCpy;
2696.0	50902	           CALLP   SetCsrPos(PosCRCmyNbr);
2697.0	61108	         ENDIF;
2698.0	50825	
2699.0	50825	         RrnS03     = 0;
2700.0	50825	         SVRrnS03   = 0;
2701.0	50825	         C3DSPR     = 1;
2702.0	50825	         NumRecAdd  = 0;
2703.0	50825	         EndS03 = False;
2704.0	50825	
2705.0	50825	         Clear w3ItmNBr;
2706.0	50825	         Reset w3Grp#;
2707.0	50825	         Clear w3ItemIndex;
2708.0	50913	
2709.0	50825	         firstpass2 = true;
2710.0	50825	
2711.0	50825	         // Default to display the subfile as a single line, turn on SFLDROP
2712.0	50825	         SflFold = True;
2713.0	50825	
2714.0	50825	       return;
2715.0	50825	      /end-free
2716.0	50825	     P clearScreen3    E
2717.0	50825	
2718.0	50825	       //=========================================================================
2719.0	50825	       //   Process Screen C03 Input                                             *
2720.0	50825	       //=========================================================================
2721.0	50825	     P testUserAction3...
2722.0	50825	     P                 B
2723.0	50825	     D testUserAction3...
2724.0	50825	     D                 PI
2725.0	60221	
2726.0	50825	      /free
2727.0	50825	         // clear all errors before doing anything else
2728.0	50825	         resetErrors ();
2729.0	51021	         reset UpdFailedFlag;
2730.0	50825	
2731.0	50825	         SELECT;
2732.0	50825	         WHEN KeyPressed = F_Exit;
2733.0	50825	           EndPgm = True;
2734.0	50825	
2735.0	50825	         WHEN KeyPressed = F_Prompt;
2736.0	50825	           // Prompt for valid values / return to same position on screen
2737.0	50825	           DisplayPrompt(CSRREC: CSRFLD);
2738.0	50825	           SetCsrPos('Y');
2739.0	50825	
2740.0	50825	         WHEN KeyPressed = F_Cancel;
2741.0	90622	             IF EnOpt = OptPOSMaint;
2742.0	50825	               EndPgm = True;
2743.0	61108	             ELSE;
2744.0	50916	               Screen = 2;
2745.0	51006	               errorFound = False;
2746.0	61101	               loopsubfile3a();
2747.0	61108	               loopsubfile4a();
2748.0	110202	               SetEnvironment(ROLLBACK);
2749.0	61108	               // Check IF any contracts should be deleted after rollback
2750.0	110202	               resetContracts(DltMode);
2751.0	61108	             ENDIF;
2752.0	50825	
2753.0	50825	         WHEN KeyPressed = F_Help
2754.0	50825	               Or KeyPressed = F_HelpKey;
2755.0	50825	           // go out to the help window / return to same position on screen
2756.0	50825	           SeeHelp (SDPgm: CSRFLD: JobLang);
2757.0	50825	           SetCsrPos('Y');
2758.0	61108	           IF CSRRRN > 0;
2759.0	50825	             C3Dspr = CSRRRN;
2760.0	61108	             ELSEIF Min_Rrn > 0;
2761.0	50825	               C3Dspr = Min_Rrn;
2762.0	61108	           ENDIF;
2763.0	50825	
2764.0	50825	         WHEN KeyPressed = F_PageDown;
2765.0	50825	           loadScreen3 ();
2766.0	50906	           SetCsrPos ('Y');
2767.0	50825	
2768.0	50825	         WHEN KeyPressed = F_Refresh;
2769.0	80916	           //SetEnvironment(ROLLBACK);
2770.0	61108	           // Check IF any contracts should be added or deleted after rollback
2771.0	61101	           //resetContracts(AddMode);
2772.0	61101	
2773.0	61108	           loopsubfile4a();
2774.0	61101	           loopsubfile3a();
2775.0	51003	           loadScreenFields3 ();
2776.0	51003	           clearScreen3 ();
2777.0	51003	           loadScreen3 ();
2778.0	51003	           SetCsrPos();
2779.0	50825	
2780.0	100506	         WHEN KeyPressed = F_ViewCpnLoc and
2781.0	100506	             (EnOpt <> OptAdd and EnOpt <> OptChg and EnOpt <> OptCpy);
2782.0	51003	           Screen = 5;
2783.0	50825	
2784.0	50825	         WHEN KeyPressed = F_Enter and EnOpt = OptDlt;
2785.0	51027	           DeleteCoupon();
2786.0	50825	
2787.0	50825	         WHEN KeyPressed = F_Enter and EnOpt = OptPOSMaint;
2788.0	51103	           SendPOSMaintenance();
2789.0	50825	
2790.0	50825	         WHEN KeyPressed = F_Enter and EnOpt = OptReActivate;
2791.0	51027	           ReactivateCoupon();
2792.0	50825	
2793.0	50825	         WHEN KeyPressed = F_Enter and EnOpt = OptDsp;
2794.0	100920	           checkOverlap();
2795.0	50825	           EndPgm = True;
2796.0	50825	
2797.0	100506	         WHEN KeyPressed = F_Enter or KeyPressed = F_GenFamCode or
2798.0	100506	                           KeyPressed = F_ViewCpnLoc;
2799.0	50825	           // Enter
2800.0	61108	           // Change in subfile / Validate is OK / IF OK go to next screen
2801.0	60822	           returnToItems = False;
2802.0	51101	           validateControlFields3 ();
2803.0	50825	           IF Valid and SflDsp2;
2804.0	50825	             validateInput3 ();
2805.0	61107	             IF Valid;
2806.0	61108	                clearScreen4 ();
2807.0	61108	                loadScreen4 ();
2808.0	61108	                IF Valid;
2809.0	61108	                   validateinput4();
2810.0	61108	                ENDIF;
2811.0	61108	             ENDIF;
2812.0	61108	           ENDIF;
2813.0	50825	           // Update
2814.0	61108	           IF Valid;
2815.0	50915	             loopSubfile4 ();
2816.0	50915	             loopSubfile3 ();
2817.0	91214	             clear CpnMasterDS;
2818.0	91214	             cpnMasterDS.couponId      = c2cpnId;
2819.0	91214	             cpnMasterDS.CompanyNumber = c3Cmynbr;
2820.0	91214	             PutCouponMaster(CHANGE :CpnMasterDS: 'UpdCmpy');
2821.0	90303	             if KeyPressed = F_GenFamCode ;
2822.0	90303	               c3POSFMCD =
2823.0	90303	                 getNextFamilyCode(CouponMasterDS.CouponID : c3POSDept);
2824.0	90303	               return;
2825.0	90303	             endif;
2826.0	60822	
2827.0	61108	          // IF not returnToItems;
2828.0	60822	               CallP PrepCpnData();
2829.0	260623	               // Executive coupon validation
2830.0	260623	               ErrorExecCpn = False;
2831.0	260623	               If c3execcpn <> YES and
2832.0	260623	                  c3execcpn <> NO;
2833.0	260623	                  ErrorExecCpn = True;
2834.0	260623	                  wkMsgDta = 'Executive coupon flag';
2835.0	260623	                  SetCsrPos (PosC3EXECCPN);
2836.0	260623	                  PutErrMsg (cInvalidFlag:MsgF
2837.0	260623	                      :sdPgm :JobLang :wkMsgDta);
2838.0	260623	               endif;
2839.0	260623	               // EXCEPTION SIGN VALIDATION
2840.0	260623	               ErrorExcpSgn = False;
2841.0	260623	               If C3EXCPSGN <> YES and
2842.0	260623	                  C3EXCPSGN <> NO;
2843.0	260623	                  ErrorExcpSgn = True;
2844.0	260623	                  wkMsgDta = 'Exception sign flag';
2845.0	260623	                  SetCsrPos (PosC3EXCPSGN);
2846.0	260623	                  PutErrMsg (cInvalidFlag :MsgF
2847.0	260623	                      :sdPgm :JobLang :wkMsgDta);
2848.0	260623	               endif;
2849.0	260623	               // End EXCEPTION SIGN VALIDATION
2850.0	91221	               IF enOpt = OptAdd and C3CpnTaxC = *Blanks
2851.0	91221	                  and wkMItemTax <> *Blanks;
2852.0	91221	                  C3CpnTaxC = wkMItemTax;
2853.0	91221	                  errorFound = TRUE;
2854.0	91221	               ELSEIF not PutCouponMaster(CHANGE :CpnMasterDS: ' ');
2855.0	60822	                 UpdFailedFlag = True;
2856.0	60822	                 CheckCouponMsgs ();
2857.0	161228	               ELSE;
2858.0	170516	                 // Validate Coupon Sign Show Math Flag
2859.0	170516	                 IF (ViewSignTPD and Not errorFound)
2860.0	170516	                 OR (enOpt = OptAdd and Not errorFound) ;
2861.0	170516	
2862.0	170516	                    IF C3TPDFLG <> 'Y' and
2863.0	170516	                    C3TPDFLG <> 'N' ;
2864.0	170516	
2865.0	170516	                      ErrorFound = True;
2866.0	170516	                      wkMsgDta = 'Coupon Sign Show Math Flag';
2867.0	170516	                      setCsrPos (PosC3TPDFLG);
2868.0	170516	                      PutErrMsg (cInvalidFlag :MsgF
2869.0	170516	                          :sdPgm :JobLang :wkMsgDta);
2870.0	170516	                    ENDIF ;
2871.0	170516	
2872.0	170516	                 ENDIF  ;
2873.0	170516	
2874.0	170516	                 // Validate Coupon Sign Disclaimer Flag
2875.0	170516	                 IF (ViewSignDesc and Not errorFound)
2876.0	170516	                 OR (enOpt = OptAdd and Not errorFound) ;
2877.0	170516	                    IF C3SDSCFLG <> 'Y' and
2878.0	170516	                    C3SDSCFLG <> 'N' ;
2879.0	170516	
2880.0	170516	                      ErrorFound = True;
2881.0	170516	                      wkMsgDta = 'Coupon Sign Dislcaimer Flag';
2882.0	170516	                      setCsrPos (PosC3SDSCFLG);
2883.0	170516	                      PutErrMsg (cInvalidFlag :MsgF
2884.0	170516	                          :sdPgm :JobLang :wkMsgDta);
2885.0	170516	                    ENDIF;
2886.0	170516	                 ENDIF ;
2887.0	170516	
2888.0	170516	                 // if no error found above ie sign disclaimer has
2889.0	170516	                 // been validated
2890.0	170516	                 IF (ViewSignTPD and Not errorFound)
2891.0	170516	                 OR (enOpt = OptAdd and Not errorFound) ;
2892.0	170516	
2893.0	170516	                   IF  (C3TPDFLG =  'N' and C3SDSCFLG = 'Y')
2894.0	170516	                   OR (C3TPDFLG =  'N' and C3MAXCNT <> 99) ;
2895.0	170516	                     ErrorFound = True;
2896.0	170516	                     SetCsrPos (PosC3TPDFLG);
2897.0	170516	                     PutErrMsg (cTPDQtyAndDscSet:MsgF
2898.0	170516	                          :sdPgm :JobLang );
2899.0	170516	                   ENDIF ;
2900.0	170516	                 ENDIF ;
2901.0	170516	
2902.0	170516	                 //if no Coupon TPD and Disclaimer Validation errors
2903.0	170516	                 // Update/Write the Disclaimer and TPD flag records
2904.0	170516	
2905.0	170516	                 IF (ViewSignTPD and ViewSignDesc and Not errorFound)
2906.0	260623	                 OR ((enOpt = OptAdd or enOpt = OptChg) and Not errorFound);
2907.0	170516	
2908.0	170516	                    CallPutCouponTPD() ;
2909.0	170516	                    CallPutCouponDisclaimer();
2910.0	170516	                 ENDIF ;
2911.0	170516	
2912.0	61108	               ENDIF;
2913.0	61108	          // ENDIF;
2914.0	60822	
2915.0	61108	             IF noItemsEntered and
2916.0	60822	                not ErrorFound and not ErrorFoundItem;
2917.0	60822	               %occur(warningMessagesDS) = 1;
2918.0	60822	               wkMessage = cNoItemsEntered;
2919.0	60822	               wkMsgId   = *blanks;
2920.0	60822	               processScreen6();
2921.0	61108	             ENDIF;
2922.0	50914	
2923.0	260623	             IF not ErrorFound and not ErrorFoundItem and not ErrorExecCpn
2924.0	260623	               and not ErrorExcpSgn;
2925.0	50915	               Screen = 5;
2926.0	61108	             ENDIF;
2927.0	61108	           ENDIF;
2928.0	50825	
2929.0	50825	         WHEN KeyPressed = F_ModGrp;
2930.0	61108	           // Change in subfile / Validate is OK / IF OK go to next screen
2931.0	50825	           validateControlFields3 ();
2932.0	61108	           IF Valid;
2933.0	50825	             validateInput3 ();
2934.0	61108	             IF Valid;
2935.0	61108	               Fill04YN = True;
2936.0	61108	               Screen = 4;
2937.0	61108	             ENDIF;
2938.0	61108	           ENDIF;
2939.0	51207	
2940.0	90303	         //WHEN KeyPressed = F_GenFamCode;
2941.0	60103	            // Get next available family code
2942.0	90303	            //c3POSFMCD = getNextFamilyCode(CouponMasterDS.CouponID : c3POSDept);
2943.0	100309	
2944.0	100309	         WHEN KeyPressed = F_Top;
2945.0	100309	           fill03YN = FALSE;
2946.0	100309	           c3Dspr = 1;
2947.0	100309	
2948.0	100309	         WHEN KeyPressed = F_Bottom;
2949.0	100309	           fill03YN = FALSE;
2950.0	100309	           c3Dspr = SvRrnS03;
2951.0	100309	
2952.0	100517	         WHEN KeyPressed = F_SyncItem and EnOpt <> OptAdd;
2953.0	100309	           getItemFromContract = TRUE;
2954.0	100517	           fill03YN = TRUE;
2955.0	100309	
2956.0	100309	         WHEN KeyPressed = F_MoreKeys;
2957.0	100309	           select;
2958.0	100309	           when switch_F_Key;
2959.0	100309	             switch_F_Key = FALSE;
2960.0	100309	           other;
2961.0	100309	             switch_F_Key = TRUE;
2962.0	100309	           endsl;
2963.0	100309	           fill03YN = FALSE;
2964.0	241226	
2965.0	241226	         WHEN KeyPressed = F_CatMaint;
2966.0	241226	
2967.0	241226	           returnToItems = False;
2968.0	241226	           validateControlFields3 ();
2969.0	241226	           IF Valid and SflDsp2;
2970.0	241226	             validateInput3 ();
2971.0	241226	             IF Valid;
2972.0	250130	                SetCatStat =FALSE;
2973.0	250211	                wkExitScrn =FALSE;
2974.0	241226	              // Maintain Category.
2975.0	250123	            MaintainCategory ( );
2976.0	250123	
2977.0	241226	             endif;
2978.0	241226	           endif;
2979.0	241226	
2980.0	50825	         ENDSL;
2981.0	50825	
2982.0	50825	       return;
2983.0	50825	      /end-free
2984.0	50825	     P testUserAction3...
2985.0	50825	     P                 E
2986.0	50825	
2987.0	50825	       //=========================================================================
2988.0	50825	       //   Validate Control Fields                                              *
2989.0	50825	       //=========================================================================
2990.0	50825	     P validateControlFields3...
2991.0	50825	     P                 B
2992.0	50825	     D validateControlFields3...
2993.0	50825	     D                 PI
2994.0	50825	      /free
2995.0	50825	         Valid = True;
2996.0	100322	
2997.0	100322	         if EnOpt = OptAdd;
2998.0	100322	           if c3CmyNbr = *zeros;
2999.0	100322	             c3CmyNbr = wkDftCompanyNumber;
3000.0	100322	           endif;
3001.0	100322	           if c3POSDept = *zeros;
3002.0	100322	             c3POSDept = wkDftDepartmentNumber;
3003.0	100322	           endif;
3004.0	100322	           if c3CPNDES2 = *blanks;
3005.0	100322	             c3CPNDES2 = wkDftCpnDescription;
3006.0	100322	           endif;
3007.0	100322	           if c3MaxCnt = 0;
3008.0	100322	            c3MaxCnt = wkDftCouponLimit;
3009.0	100322	           endif;
3010.0	100322	           if c3CpnTaxc = *Blanks and wkDftTaxCode <> *Blanks;
3011.0	100322	             c3CpnTaxc = wkDftTaxCode;
3012.0	100322	           endif;
3013.0	100326	           if c3RdmpTnTy = *blanks;
3014.0	100326	             c3RdmpTnTy = 'CASH';
3015.0	100326	           endif;
3016.0	100326	           if c3PPFLG = *blanks;
3017.0	100326	             c3PPFLG = No;
3018.0	100326	           endif;
3019.0	100326	           if c3MINCNT = *zeros;
3020.0	100326	             c3MINCNT   = 01;
3021.0	100326	           endif;
3022.0	100322	         endif;
3023.0	100322	
3024.0	51101	
3025.0	51101	         c3POSDeptD = *blanks;
3026.0	51101	         wkAct#ofRows3c = GetDepartmentDescription(c3POSDept);
3027.0	61108	         IF wkAct#ofRows3c > 0;
3028.0	51122	           c3POSDeptD = DeptDescDS.DGDESL;
3029.0	61108	         ENDIF;
3030.0	51101	
3031.0	51101	         c3CpyNbrDs = *blanks;
3032.0	51101	         wkAct#ofRows3c = GetCompanyDescription(c3CmyNbr);
3033.0	61108	         IF wkAct#ofRows3c > 0;
3034.0	51122	           c3CpyNbrDs = CompanyDescDS.CMCNAM;
3035.0	61108	         ENDIF;
3036.0	51101	
3037.0	51101	         c3CpnTaxCd = *blanks;
3038.0	260806	         IF c3Cmynbr <> CA_COMPANY;
3039.0	51101	         wkAct#ofRows3c = GetTaxCodeDescription(C3CPNTAXC);
3040.0	61108	         IF wkAct#ofRows3c > 0;
3041.0	80919	           C3CpnTaxCd = wkNewTax;
3042.0	61108	         ENDIF;
3043.0	260623	         ENDIF;
3044.0	51101	
3045.0	51101	         c3MrgnDstD = *blanks;
3046.0	61108	         IF GetCodeDescription(C3MRGNDSTC :
3047.0	51101	                              tableDistributionCodes) = True;
3048.0	51101	            c3MrgnDstD = TableDS.LDESC;
3049.0	61108	         ENDIF;
3050.0	51101	
3051.0	51101	         c3RdmptnTD = *blanks;
3052.0	61108	         IF GetCodeDescription(C3RDMPTNTY :
3053.0	51101	                               tableRedemptionTypeCodes) = True;
3054.0	51101	           c3RdmptnTD = TableDS.LDESC;
3055.0	61108	         ENDIF;
3056.0	50825	
3057.0	50825	       return;
3058.0	50825	      /end-free
3059.0	50825	     P validateControlFields3...
3060.0	50825	     P                 E
3061.0	50825	
3062.0	50825	       //========================================================================
3063.0	50825	       //   Validate the subfile records                                        *
3064.0	50825	       //========================================================================
3065.0	50825	     P validateInput3...
3066.0	50825	     P                 B
3067.0	50825	     D validateInput3...
3068.0	50825	     D                 PI
3069.0	61108	
3070.0	61108	     D wkRRN#          S              5S 0 Inz(0)
3071.0	61108	     D Group#Entered   S               N   inz(False)
3072.0	50913	
3073.0	260623	     D  Wk_Signed      S             13  0
3074.0	260623	     D  KeyUpc         S             15A
3075.0	260623	     D ParmMode        S              1A
3076.0	260623	     D ParmUPC#        S             15A
3077.0	260623	     D ParmCalChk#     S              1A
3078.0	260623	     D ParmMsgFlag     S              1A
3079.0	260623	     D Get             C                   'G'
3080.0	260623	     D ParmRck         C                   '2'
3081.0	260623	
3082.0	260623	      // Local Constants for Canada Paper UPC generation
3083.0	260623	     D ZERO_CHAR       C                   '0'
3084.0	260623	     D wkParmUpc       S             13A
3085.0	260623	     D FAMILY4_SERIES  C                   '4'
3086.0	260623	     D InCompany       C                    4
3087.0	260623	     D inDeptNo        C                    83
3088.0	260623	     D UPCStartSeries  S             15A   INZ('4')
3089.0	260623	     D inItemNumber    C                    0
3090.0	260623	     D inIsItemNeeded  S              1A   INZ('0')
3091.0	260623	     D UPCLimitReach   S              1A   INZ('0')
3092.0	260623	      /free
3093.0	260623	         ParmMode = Get;
3094.0	260623	
3095.0	260623	      *
3096.0	260623	        //If the Coupon Type is Paper and the Company is Canada,
3097.0	260623	        //the UPC# must start with 41 series
3098.0	260623	        //for both Regular and Raincheck Paper Coupons.
3099.0	260623	      *
3100.0	260623	         if C2CPNTYP = PAPER and c3cmynbr = CA_COMPANY and
3101.0	260623	            (C3upcnbr = 0
3102.0	260623	               or %subst(%editc(C3UPCNBR: 'X'): 1: 2) = %char(USREGULAR));
3103.0	260623	      *      // For the first 11 digits
3104.0	260623	             parmUPC# = getItemUPCWithoutCheckDigit(UPCStartSeries:
3105.0	260623	                inIsItemNeeded:CA_COMPANY:inDeptNo:inItemNumber:UPCLimitReach);
3106.0	260623	
3107.0	260623	             // Calculate Check Digit
3108.0	260623	             getUPCCheckDigit(ParmMode: parmUPC#: ParmCalChk#: ParmMsgFlag);
3109.0	260623	             parmUpc# = %trim(parmUpc#) + ZERO_CHAR;
3110.0	260623	             getUPCCheckDigit(ParmMode: parmUPC#: ParmCalChk#: ParmMsgFlag);
3111.0	260623	             wkParmUpc = %subst(%trim(parmUpc#) : 1 : 11) + parmCalChk#;
3112.0	260623	
3113.0	260623	             c3upcnbr = %Dec(wkParmUpc : 13 : 0);
3114.0	260623	             wkupcnbr = c3upcnbr;
3115.0	260623	             // First 11 digits for Raincheck UPC#
3116.0	260623	             parmUPC# = getItemUPCWithoutCheckDigit(UPCStartSeries:
3117.0	260623	                inIsItemNeeded:CA_COMPANY:inDeptNo:inItemNumber:UPCLimitReach);
3118.0	260623	             ParmCalChk# = *BLANKS;
3119.0	260623	
3120.0	260623	             // Calculate Check Digit
3121.0	260623	             getUPCCheckDigit(ParmMode: parmUPC#: ParmCalChk#: ParmMsgFlag);
3122.0	260623	             parmUpc# = %trim(parmUpc#) + ZERO_CHAR;
3123.0	260623	             getUPCCheckDigit(ParmMode: parmUPC#: ParmCalChk#: ParmMsgFlag);
3124.0	260623	             wkParmUpc = %subst(%trim(parmUpc#) : 1 : 11) + parmCalChk#;
3125.0	260623	
3126.0	260623	             c3rckupc = %Dec(wkParmUpc : 13 : 0);
3127.0	260623	             wkrckupc = c3rckupc;
3128.0	260623	            endif;
3129.0	260623	      *
3130.0	260623	        //For the following combinations:
3131.0	260623	        // 1) Coupon type = IRC   and Company is US.
3132.0	260623	        // 2) Coupon type = PAPER and Company is US.
3133.0	260623	        // 3) Coupon type = IRC   and Company is Canada.
3134.0	260623	        //the UPC# must start with the 21 series for Regular Coupons
3135.0	260623	        //and the 22 series for Raincheck Coupons.
3136.0	260623	      *
3137.0	260623	            if C2CPNTYP = IRC or (C2CPNTYP = PAPER and C3cmynbr = US_COMPANY);
3138.0	260623	               c3UPCNbr = generateCouponUPC (couponMasterDS.couponId) ;
3139.0	260623	               //Get RainCheck UPC Number
3140.0	260623	               //Reset Rain Check Upc number.
3141.0	260623	               C3RckUPC = 0;
3142.0	260623	               Wk_Signed = c3upcnbr;
3143.0	260623	               EvalR ParmUPC# = %SUBST(%Editc(Wk_Signed:'X'):1:12) + '0';
3144.0	260623	               ParmUPC# = %Replace(ParmRck:ParmUPC#:4:1);
3145.0	260623	               getUPCCheckDigit(ParmMode:ParmUPC#:ParmCalChk#:ParmMsgFlag);
3146.0	260623	               KeyUpc = %Replace(ParmCalChk#:ParmUPC#:15:1);
3147.0	260623	               C3RckUPC = %Dec(%SUBST(KeyUpc:3:13):15:0);
3148.0	260623	            endif;
3149.0	61108	         Valid         = True;
3150.0	61108	         wkRRN#        = *Zeros;
3151.0	61108	         Group#Entered = False;
3152.0	61109	         Clear w4Stat;
3153.0	100401	         wkMItemTax= *Blank;
3154.0	61108	
3155.0	50825	         IF SvRrnS03>0;
3156.0	61108	        // Default to current screen displayed / will be overridden IF errors
3157.0	61108	           IF CSRRRN > 0;
3158.0	50825	             C3Dspr = CSRRRN;
3159.0	61108	             ELSEIF Min_Rrn > 0;
3160.0	50825	               C3Dspr = Min_Rrn;
3161.0	61108	           ENDIF;
3162.0	50825	
3163.0	50929	           reset retrievalRrnS03;
3164.0	51027	           ErrorPage3 = 0;
3165.0	50825	
3166.0	61108	        // Check Subfile to see IF cursor is on a valid subfile line
3167.0	51010	           Chain(e) retrievalRrnS03 S03;
3168.0	50929	           Dow retrievalRrnS03 <= SvRrnS03;
3169.0	50825	             SflNxtChg2 = True;
3170.0	51010	          // Validate Option
3171.0	50825	             Select;
3172.0	50909	
3173.0	51010	          // Invalid Option
3174.0	50915	             When s3Opt <>  OptDlt and s3Opt <> OptReActivate
3175.0	50915	                  and s3Opt <> ' ';
3176.0	50825	               Valid = False;
3177.0	50825	               SetCsrPos(Poss3Opt);
3178.0	50825	               %subst(wkMsgDta:1:30) = cOption;
3179.0	50921	               %subst(wkMsgDta:31:30) = s3Opt;
3180.0	50825	               PutErrMsg (Err_BadOpt :MsgF
3181.0	50825	                          :sdPgm :JobLang :wkMsgDta);
3182.0	50825	
3183.0	51010	          // Option 4 - Remove Item
3184.0	50825	             When s3Opt = OptDlt and s3Mode = AddMode;
3185.0	50825	               Clear S03;
3186.0	60926	               s3Mode = AddMode;
3187.0	60926	               s3FITF = No;
3188.0	50825	               SflNxtChg2 = False;
3189.0	50915	
3190.0	51010	          // Option 8 - Reactivate Item
3191.0	50915	             When s3Opt = OptReActivate and s3Mode = AddMode;
3192.0	50915	               Clear S03;
3193.0	60926	               s3Mode = AddMode;
3194.0	60926	               s3FITF = No;
3195.0	50915	               SflNxtChg2 = False;
3196.0	50825	
3197.0	51010	          // Blanks with Add Mode
3198.0	50825	             When s3Mode = AddMode;
3199.0	61108	               IF s3ItmNbr = *Zeros;
3200.0	50825	                 Clear S03;
3201.0	50825	                 s3Mode = AddMode;
3202.0	51020	                 s3FITF = No;
3203.0	50825	                 SflNxtChg2 = False;
3204.0	61108	               ENDIF;
3205.0	50825	
3206.0	60109	          // Blanks with change mode
3207.0	60109	             When s3Mode = ChgMode;
3208.0	61108	               IF s3ItmNbr = *Zeros;
3209.0	60109	                 Clear S03;
3210.0	60109	                 s3Mode = AddMode;
3211.0	60109	                 s3FITF = No;
3212.0	60109	                 SflNxtChg2 = False;
3213.0	61108	               ENDIF;
3214.0	60109	
3215.0	51010	          // All Other Blanks - Skip These
3216.0	50825	             When s3Opt = *Blank;
3217.0	61108	               IF s3Mode = *Blank;
3218.0	50825	                 SflNxtChg2 = False;
3219.0	61108	               ENDIF;
3220.0	50825	             EndSl;
3221.0	50825	
3222.0	51010	          // Set Page of first error
3223.0	61108	             IF Valid = False and ErrorPage3 = 0;
3224.0	51027	               ErrorPage3 = RrnS03;
3225.0	61108	             ENDIF;
3226.0	50912	
3227.0	51010	          //------------------------------------------------
3228.0	51010	          // Update the arrays
3229.0	51010	          //------------------------------------------------
3230.0	51026	             x = %lookup(s3ItmNbr :w3ItmNbr :1);
3231.0	61108	             IF x > 0;
3232.0	51026	               w3Grp#(x) = s3Grp#;
3233.0	51026	             else;
3234.0	51026	               w3ItemIndex += 1;
3235.0	51026	               w3ItmNbr(w3ItemIndex) = s3ItmNbr;
3236.0	51026	               w3Grp#(w3ItemIndex) = s3Grp#;
3237.0	61108	             ENDIF;
3238.0	51026	
3239.0	61108	             IF s3Grp# <> 0;
3240.0	51026	               x = %lookup(s3Grp# :w4Grp# :1);
3241.0	61108	               Group#Entered = True;
3242.0	61108	               IF x = 0;
3243.0	51026	                 w4GrpIndex += 1;
3244.0	51026	                 w4Grp#(w4GrpIndex) = s3Grp#;
3245.0	51026	                 w4Mode(w4GrpIndex) = AddMode;
3246.0	61109	                 x = w4GrpIndex;
3247.0	61115	               ELSEIF w4OldRcd(X);
3248.0	70503	                 w4Mode(x) = ChgMode;
3249.0	61108	               ENDIF;
3250.0	61109	               IF s3STAT = 'ACT' or s3STAT = ' ';
3251.0	61109	                  w4STAT(X) = cActive;
3252.0	61109	               ENDIF;
3253.0	61108	             ENDIF;
3254.0	51104	
3255.0	51104	            // Get Item description
3256.0	61108	            IF s3itmnbr <> 0 ;
3257.0	61108	               IF s3Mode = AddMode;
3258.0	61108	                  wkAct#ofRows3c = GetItemDescription(c3CmyNbr :S3ItmNbr);
3259.0	61108	                  IF wkAct#ofRows3c > 0;
3260.0	61108	                    s3ItDes1 = ItemDescriptionDS.IMDES1;
3261.0	61108	                    s3ItDes2 = ItemDescriptionDS.IMDES2;
3262.0	61108	                    s3Dept   = ItemDescriptionDS.IMDEPT;
3263.0	61108	                  ENDIF;
3264.0	61108	               ENDIF;
3265.0	61108	               IF s3Grp# = 0 and wkRRN# = 0;
3266.0	61108	                  wkRRN# = RRNS03;
3267.0	61108	               ENDIF;
3268.0	61108	             ENDIF;
3269.0	50825	
3270.0	50825	             Update S03;
3271.0	50912	
3272.0	51010	          // Clear Screen Error indicators and reset cursor
3273.0	50825	             ErrMsginds = *all'0';
3274.0	50825	
3275.0	51010	          // Get Next Subfile Change
3276.0	50929	             retrievalRrnS03 += 1;
3277.0	61108	             IF retrievalRrnS03 > svRrnS03;
3278.0	51018	               leave;
3279.0	61108	             ENDIF;
3280.0	51018	
3281.0	51010	             Chain(e) retrievalRrnS03 S03;
3282.0	50825	           EndDo;
3283.0	61108	
3284.0	61108	           If Group#Entered and wkRRN# <> 0;
3285.0	61108	              chain wkRRN# s03;
3286.0	80711	              if %trim(S3STATDESC) <> DltMode;
3287.0	80714	                 Valid = False;
3288.0	80710	                 SetCsrPos(Poss3Grp#);
3289.0	80714	                 Update S03;
3290.0	80710	                 %subst(wkMsgDta:1:30) = 'Group number';
3291.0	80710	                 PutErrMsg (Is_Required  :MsgF
3292.0	80710	                           :sdPgm :JobLang :wkMsgDta);
3293.0	80710	              If ErrorPage3 = 0;
3294.0	80710	                 ErrorPage3 = wkRRN#;
3295.0	80710	              Endif;
3296.0	80710	              endif;
3297.0	61108	           Endif;
3298.0	50825	
3299.0	51010	        // Update the arrays
3300.0	51026	           For a1 = 1 to w4GrpIndex;
3301.0	51026	             x = %LookUp(w4Grp#(a1) :w3Grp# :1);
3302.0	61108	             IF x = 0;
3303.0	61108	               IF w4Mode(a1) = AddMode;
3304.0	51026	                 w4Grp# = 0;
3305.0	61108	               ELSE;
3306.0	61107	                 w4Mode(a1) = DltMode;
3307.0	61108	               ENDIF;
3308.0	61108	             ENDIF;
3309.0	50825	           EndFor;
3310.0	50825	
3311.0	51010	        // Set the cursor page to first error page
3312.0	61108	           IF ErrorPage3 <> 0;
3313.0	51027	             C3DSPR = ErrorPage3;
3314.0	51010	        // Keep cursor in the same place
3315.0	61108	           ELSEIF CsrRrn > 0;
3316.0	50825	             C3Dspr = CsrRrn;
3317.0	61108	           ELSEIF Min_rrn > 0;
3318.0	50825	             C3Dspr = Min_rrn;
3319.0	61108	           ENDIF;
3320.0	50825	
3321.0	50825	           SflNxtChg2 = False;
3322.0	50825	
3323.0	61108	         ENDIF;
3324.0	50825	
3325.0	50825	       return;
3326.0	50825	      /end-free
3327.0	50825	     P validateInput3...
3328.0	50825	     P                 E
3329.0	50825	
3330.0	50825	       //=========================================================================
3331.0	50825	       //   Do Screen 3 loop for selected items                                  *
3332.0	50825	       //=========================================================================
3333.0	50825	     P loopSubfile3    B
3334.0	50825	     D loopSubfile3    PI
3335.0	50912	
3336.0	50825	      /free
3337.0	60919	         noItemsEntered = True;
3338.0	60919	
3339.0	50915	         IF SvRrnS03>0;
3340.0	50825	
3341.0	50929	           reset retrievalRrnS03;
3342.0	51027	           errorFoundItem = FALSE;
3343.0	50912	
3344.0	51010	           Chain(e) retrievalRrnS03 S03;
3345.0	50929	           Dow retrievalRrnS03 <= SvRrnS03
3346.0	50930	                 and NOT EndPgm;
3347.0	50825	
3348.0	51027	             ProtItmNbr = False;
3349.0	61108	             IF s3ItmNbr <> *zeros;
3350.0	50915	
3351.0	50915	               SflNxtChg2 = True;
3352.0	60822	               noItemsEntered = False;
3353.0	50825	
3354.0	51010	            // Build Coupon Item Association
3355.0	61108	               IF s3ItmNbr <> *Zeros and s3Mode = AddMode
3356.0	51021	                 and s3Opt <> OptDlt and s3CpnItmID = 0 ;
3357.0	51027	
3358.0	51027	                 s3Stat = cActive;
3359.0	51027	                 s3StatDesc = cActive;
3360.0	51027	
3361.0	51027	                 MoveS03Fields();
3362.0	61108	                 IF not PutCouponItemAssoc(AddMode :CpnItmAscDS);
3363.0	50915	                   UpdFailedFlag = True;
3364.0	61108	                 ENDIF;
3365.0	51010	
3366.0	51010	              // Check for any error messages
3367.0	61108	                 IF ErrorMsgds <> *Blank;
3368.0	50915	                   CheckItemAssocMsgs ();
3369.0	61108	                 ELSE;
3370.0	51021	                   s3CpnItmID = CouponItmAscDS.CouponItemId;
3371.0	51021	                   s3Mode = ChgMode;
3372.0	51021	                   ProtItmnbr = True;
3373.0	61108	                 ENDIF;
3374.0	61108	               ENDIF;
3375.0	60109	
3376.0	60109	            //----------------------------------------------------
3377.0	60109	            // Update the group id in the Item Association table
3378.0	60109	            //----------------------------------------------------
3379.0	61108	               IF s3ItmNbr <> *Zeros and s3Mode = ChgMode and
3380.0	60109	                 s3Opt <> OptDlt and s3Opt <> OptReactivate;
3381.0	60109	
3382.0	60109	                 MoveS03Fields();
3383.0	80916	                 IF not PutCouponItemAssoc(CHANGE :CpnItmAscDS);
3384.0	60109	                   UpdFailedFlag = True;
3385.0	61108	                 ENDIF;
3386.0	60109	                 ProtItmNbr = True;
3387.0	60109	
3388.0	60109	              // Check for any error messages
3389.0	61108	                 IF ErrorMsgds <> *Blank;
3390.0	60109	                   CheckItemAssocMsgs ();
3391.0	61108	                 ENDIF;
3392.0	60109	
3393.0	61108	               ENDIF;
3394.0	50912	
3395.0	51010	            //--------------------------------------
3396.0	51010	            // Process Select Option
3397.0	51010	            //--------------------------------------
3398.0	50915	               Select;
3399.0	61108	            // Option 4 - Cancel Item (remove group id IF needed)
3400.0	50915	               When s3Opt = OptDlt;
3401.0	51027	
3402.0	60510	                 s3STAT = dltMode;
3403.0	51027	                 MoveS03Fields();
3404.0	80916	                 IF not PutCouponItemAssoc(DELETE: CpnItmAscDS);
3405.0	50930	                   UpdFailedFlag = True;
3406.0	61108	                 ENDIF;
3407.0	51027	                 ProtItmNbr = True;
3408.0	51027	
3409.0	60109	              // Check for any error messages
3410.0	61108	                 IF ErrorMsgds <> *Blank;
3411.0	51027	                   CheckItemAssocMsgs ();
3412.0	60509	                 else;
3413.0	60509	                   clear s3Opt;
3414.0	60510	                   s3StatDesc = CouponItmAscDS.StatusCode;
3415.0	61108	                 ENDIF;
3416.0	50915	
3417.0	51010	            // Option 8 - Reactivate Item
3418.0	50915	               When s3Opt = OptReActivate;
3419.0	51027	
3420.0	51027	                 MoveS03Fields();
3421.0	61108	                 IF not PutCouponItemAssoc(ReActivateMode: CpnItmAscDS);
3422.0	50915	                   UpdFailedFlag = True;
3423.0	61108	                 ENDIF;
3424.0	51027	                 ProtItmNbr = True;
3425.0	51027	
3426.0	60109	              // Check for any error messages
3427.0	61108	                 IF ErrorMsgds <> *Blank;
3428.0	51027	                   CheckItemAssocMsgs ();
3429.0	60510	                 else;
3430.0	60510	                   clear s3Opt;
3431.0	60510	                   s3STAT = cActive;
3432.0	60510	                   s3StatDesc = cActive;
3433.0	61108	                 ENDIF;
3434.0	50915	               EndSl;
3435.0	51027	
3436.0	61108	               IF errorFoundItem and ErrorPage3 = 0;
3437.0	60120	                 ErrorPage3 = RrnS03;
3438.0	61108	               ENDIF;
3439.0	60511	
3440.0	60511	               s3Err = %subst(ErrMsgIndsSf:4:1) +
3441.0	60511	                       %subst(ErrMsgIndsSf:7:2);
3442.0	51027	
3443.0	60120	               UPDATE S03;
3444.0	51013	
3445.0	60120	               // Clear Screen Error indicators
3446.0	60120	               %subst(ErrMsginds:26:2) = '00';
3447.0	61108	             ENDIF;
3448.0	50825	
3449.0	50929	             retrievalRrnS03 += 1;
3450.0	61108	             IF retrievalRrnS03 > svRrnS03;
3451.0	51018	               leave;
3452.0	61108	             ENDIF;
3453.0	51027	
3454.0	51027	             // Clear Screen Error indicators
3455.0	51027	             ErrMsginds = *all'0';
3456.0	51018	
3457.0	51010	             Chain(e) retrievalRrnS03 S03;
3458.0	50825	           ENDDO;
3459.0	50825	
3460.0	61108	           IF errorpage3 > 0;
3461.0	51027	              c3dspr = errorpage3;
3462.0	61108	           ENDIF;
3463.0	50825	
3464.0	50825	           SflNxtChg1 = False;
3465.0	50825	           WkFn = *Blank;
3466.0	61108	         ENDIF;
3467.0	50825	
3468.0	50825	       return;
3469.0	50825	      /end-free
3470.0	50825	     P loopSubfile3    E
3471.0	61101	
3472.0	61101	       //=========================================================================
3473.0	61101	       //   Do Screen 3 loop for selected items                                  *
3474.0	61101	       //=========================================================================
3475.0	61101	     P loopSubfile3a   B
3476.0	61101	     D loopSubfile3a   PI
3477.0	61101	
3478.0	61101	      /free
3479.0	61101	
3480.0	61101	         IF SvRrnS03>0;
3481.0	61101	
3482.0	61101	           reset retrievalRrnS03;
3483.0	61101	
3484.0	61101	           Chain(e) retrievalRrnS03 S03;
3485.0	61101	           Dow retrievalRrnS03 <= SvRrnS03
3486.0	61101	                 and NOT EndPgm;
3487.0	61101	
3488.0	61108	             IF s3ItmNbrsv = *Zeros and s3ItmNbr <> 0;
3489.0	61101	                 MoveS03FieldsA();
3490.0	80916	                 PutCouponItemAssoc(DELETE: CpnItmAscDS);
3491.0	61108	             ENDIF;
3492.0	61101	
3493.0	61108	             IF s3ItmNbrsv <> *Zeros;
3494.0	61101	                 MoveS03FieldsA();
3495.0	80916	                 PutCouponItemAssoc(CHANGE: CpnItmAscDS);
3496.0	61108	             ENDIF;
3497.0	61101	
3498.0	61101	             retrievalRrnS03 += 1;
3499.0	61108	             IF retrievalRrnS03 > svRrnS03;
3500.0	61101	               leave;
3501.0	61108	             ENDIF;
3502.0	61101	
3503.0	61101	             Chain(e) retrievalRrnS03 S03;
3504.0	61101	           ENDDO;
3505.0	61101	
3506.0	61108	         ENDIF;
3507.0	61101	
3508.0	61101	       return;
3509.0	61101	      /end-free
3510.0	61101	     P loopSubfile3a   E
3511.0	51125	
3512.0	51027	
3513.0	51027	       //=========================================================================
3514.0	51027	       //   Move s03 field to data structure for upate                           *
3515.0	51027	       //=========================================================================
3516.0	51027	     P MoveS03Fields   B
3517.0	51027	     D MoveS03Fields   PI
3518.0	51027	
3519.0	51027	      /free
3520.0	51027	
3521.0	51027	       Clear CpnItmAscDS;
3522.0	51027	
3523.0	51027	       x = %lookup(s3Grp# :w4Grp# :1);
3524.0	61108	       IF x > 0 and w4GrpID(x) <> *Hival;
3525.0	51027	         CpnItmAscDS.CouponGroupID   = w4GrpId(x);
3526.0	51027	       else;
3527.0	51027	         CpnItmAscDS.CouponGroupID   = *zeros;
3528.0	61108	       ENDIF;
3529.0	51027	       CpnItmAscDS.CouponId        = c2CpnId;
3530.0	51027	       CpnItmAscDS.CompanyNumber   = c3cmynbr;
3531.0	51027	       CpnItmAscDS.ItemNumber      = s3itmnbr;
3532.0	51027	       CpnItmAscDS.StatusCode      = s3STAT;
3533.0	51027	       CpnItmAscDS.AssociationCode = s3fitf;
3534.0	51101	       CpnItmAscDS.CouponItemId    = s3CpnItmId;
3535.0	51027	
3536.0	51027	       return;
3537.0	51027	      /end-free
3538.0	51027	     P MoveS03Fields   E
3539.0	61101	
3540.0	61101	
3541.0	61101	       //=========================================================================
3542.0	61101	       //   Move s03 field to data structure for upate                           *
3543.0	61101	       //=========================================================================
3544.0	61101	     P MoveS03FieldsA  B
3545.0	61101	     D MoveS03FieldsA  PI
3546.0	61101	
3547.0	61101	      /free
3548.0	61101	
3549.0	61101	       Clear CpnItmAscDS;
3550.0	61101	
3551.0	61101	       CpnItmAscDS.CouponGroupID   = s3GrpIdsv;
3552.0	61101	       CpnItmAscDS.CouponId        = c2CpnId;
3553.0	61101	       CpnItmAscDS.CompanyNumber   = c3cmynbr;
3554.0	61101	       CpnItmAscDS.ItemNumber      = s3itmnbrsv;
3555.0	61101	       CpnItmAscDS.StatusCode      = s3STATsv;
3556.0	61101	       CpnItmAscDS.AssociationCode = s3fitfsv;
3557.0	61101	       CpnItmAscDS.CouponItemId    = s3CpnItmId;
3558.0	61101	
3559.0	61101	       return;
3560.0	61101	      /end-free
3561.0	61101	     P MoveS03FieldsA  E
3562.0	51125	
3563.0	50825	
3564.0	50825	       //=======================================================================
3565.0	50825	       //   Load SFL Data
3566.0	50825	       //=======================================================================
3567.0	50825	     P loadScreen3     B
3568.0	50825	     D loadScreen3     PI
3569.0	51102	
3570.0	51102	     D CpnIdHld        S                   like(c2CpnId) Inz
3571.0	51102	
3572.0	50825	      /free
3573.0	50825	         RrnS03 = SvRrnS03;
3574.0	50825	         CntLnesS03 = 0;
3575.0	50825	
3576.0	61108	         IF enOpt = optCpy;
3577.0	51102	           cpnIdHld = wkCpnId;
3578.0	51102	         else;
3579.0	51102	           cpnIdHld = c2CpnId;
3580.0	61108	         ENDIF;
3581.0	51102	
3582.0	51101	         DoU cReqRowsCntItmAsc <> wkAct#ofrows2 and
3583.0	51101	             RrnS03 < cMaxRRN;
3584.0	50825	
3585.0	61108	           IF rrnS03 = 0;
3586.0	80916	             wkAct#ofRows2 = GetCouponItemAssoc(cpnIdHld :EQUALG);
3587.0	50825	           else;
3588.0	80916	             wkAct#ofRows2 = GetCouponItemAssoc(cpnIdHld :NEXT);
3589.0	61108	           ENDIF;
3590.0	50825	
3591.0	50825	           For wkINDEX = 1 to wkAct#ofrows2;
3592.0	50825	             %occur(CouponItmAscDS) = wkIndex;
3593.0	50825	             RrnS03 = RrnS03 + 1;
3594.0	50825	             CntLnesS03 = CntLnesS03 + 1;
3595.0	61108	             IF CntLnesS03 = 1;
3596.0	50825	               CsrStart=RrnS03;
3597.0	61108	             ENDIF;
3598.0	51010	          // Load SFL fields
3599.0	50825	             CLEAR S03;
3600.0	50825	             ProtItmNbr = True;
3601.0	51027	             ProtS03Flds = False;
3602.0	51118	             s3Mode     = ChgMode;
3603.0	51118	             s3CpnItmId = CouponItmAscDS.CouponItemId;
3604.0	51118	             s3cmynbr   = CouponItmAscDS.CompanyNumber;
3605.0	50825	             s3itmnbr   = CouponItmAscDS.ItemNumber;
3606.0	50825	             s3itdes1   = CouponItmAscDS.ItemDesc1;
3607.0	50825	             s3itdes2   = CouponItmAscDS.ItemDesc2;
3608.0	50825	             s3fitf     = CouponItmAscDS.AssociationCode;
3609.0	50825	             s3GrpId    = CouponItmAscDS.CouponGroupID;
3610.0	50928	             s3Dept     = CouponItmAscDS.ItemDept;
3611.0	50928	             s3Stat     = CouponItmAscDS.StatusCode;
3612.0	51010	             s3StatDesc = CouponItmAscDS.StatusCode;
3613.0	61108	             IF s3Stat = cCancelled;
3614.0	51027	               ProtS03Flds = True;
3615.0	61108	             ENDIF;
3616.0	51026	
3617.0	51026	             w3ItemIndex += 1;
3618.0	51026	             w3ItmNbr(w3ItemIndex) = s3ItmNbr;
3619.0	61109	             IF s3GrpId <> 0 and s3STAT = cActive;
3620.0	51026	               x = %lookup(CouponItmAscDS.CouponGroupID :w4GrpId :1);
3621.0	61108	               IF x > 0;
3622.0	51026	                 w3Grp#(w3ItemIndex) = w4Grp#(x);
3623.0	51026	                 s3Grp# = w4Grp#(x);
3624.0	61108	               ENDIF;
3625.0	61108	             ENDIF;
3626.0	61101	
3627.0	61101	          // Load original values
3628.0	61101	             s3itmnbrsv = s3itmnbr;
3629.0	61101	             s3Grp#sv   = s3Grp#;
3630.0	61101	             s3fitfsv   = s3fitf;
3631.0	61101	             s3statsv   = s3stat;
3632.0	61101	             s3GrpIdsv  = s3GrpId;
3633.0	61101	
3634.0	61108	             IF enOpt = optCpy;
3635.0	51118	               s3Mode = AddMode;
3636.0	51118	               clear s3CpnItmId;
3637.0	51118	               clear s3cmynbr;
3638.0	61108	             ENDIF;
3639.0	51020	
3640.0	50825	             Write S03;
3641.0	60109	
3642.0	60109	             // Clear Screen Error indicators
3643.0	60109	             ErrMsginds = *all'0';
3644.0	60109	
3645.0	50825	           EndFor;
3646.0	50825	
3647.0	51101	         EndDo;
3648.0	50825	
3649.0	51027	         ProtItmNbr  = False;
3650.0	51027	         ProtS03Flds = False;
3651.0	50825	
3652.0	50825	         Select;
3653.0	50825	         When EnOpt = OptDlt or EnOpt = OptDsp or
3654.0	50825	              EnOpt = OptPOSMaint or EnOpt = OptReActivate;
3655.0	50825	           EndS03 = True;
3656.0	50825	
3657.0	50825	         Other;
3658.0	50921	
3659.0	90622	         IF wkAct#ofRows2 <= 11;
3660.0	61108	           IF rrnS03 > 0;
3661.0	50825	             CntLnesS03 = %Rem(RRNS03:cRecPageS03);
3662.0	61108	           ENDIF;
3663.0	61108	           IF CntLnesS03 < cRecPageS03 and RrnS03 < cMaxRRN;
3664.0	50825	             EndS03 = False;
3665.0	50825	             //  Fill the rest of the subfile page with blank records
3666.0	50906	             Dow CntLnesS03 < cRecPageS03;
3667.0	50906	               RrnS03 = RrnS03 + 1;
3668.0	50906	               CntLnesS03 = CntLnesS03 + 1;
3669.0	61108	               IF rrnS03 > cRecPageS03 and firstpass2;
3670.0	61108	               ELSE;
3671.0	50906	               CsrStart=RrnS03;
3672.0	61108	               ENDIF;
3673.0	50906	               //  Clear SFL fields
3674.0	50906	               CLEAR S03;
3675.0	50906	               s3Mode = AddMode;
3676.0	50906	               s3FITF = No;
3677.0	50906	               Write S03;
3678.0	50906	             EndDo;
3679.0	61108	           ENDIF;
3680.0	61108	         ENDIF;
3681.0	50825	         EndSl;
3682.0	50825	
3683.0	50825	         SvRrnS03 = RrnS03;
3684.0	50825	         NumRecAdd = 0;
3685.0	50825	         firstpass2 = false;
3686.0	50825	
3687.0	50825	         // Indicate More records / this may be needed rather than loading blank pages
3688.0	50825	         IF RrnS03 >= cMaxRRN or EndS03 = True;
3689.0	50825	           SflEnd2 = True;
3690.0	50825	         ELSE;
3691.0	50825	           SflEnd2 = False;
3692.0	61108	         ENDIF;
3693.0	50825	
3694.0	61108	         // Empty Subfile? / this may be needed IF no blank pages
3695.0	50908	         SflDsp2 =(RrnS03 > 0);
3696.0	50825	         IF RrnS03 = 0;
3697.0	50825	           PutErrMsg (NoSflRecs: MsgF:
3698.0	50825	            SdPgm :JobLang);
3699.0	50825	         ELSE;
3700.0	61108	           // Set Subfile Display IF Records Loaded to Subfile
3701.0	50825	           //  Default cursor to first record, last screen
3702.0	50906	           C3DSPR = CsrStart;
3703.0	61108	         ENDIF;
3704.0	50825	
3705.0	50825	       return;
3706.0	50825	      /end-free
3707.0	50825	     P loadScreen3     E
3708.0	60109	
3709.0	60109	       //=========================================================================
3710.0	60109	       //   Update the error messages in item subfile                            *
3711.0	60109	       //=========================================================================
3712.0	60109	     P updateSubfile3  B
3713.0	60109	     D updateSubfile3  PI
3714.0	60109	
3715.0	60109	      /free
3716.0	60109	         IF SvRrnS03>0;
3717.0	60511	           ErrMsgIndsSf = *all'0';
3718.0	60109	
3719.0	60109	           reset retrievalRrnS03;
3720.0	60109	           errorFoundItem = FALSE;
3721.0	60109	
3722.0	60109	           Chain(e) retrievalRrnS03 S03;
3723.0	60109	           Dow retrievalRrnS03 <= SvRrnS03
3724.0	60109	                 and NOT EndPgm;
3725.0	60109	
3726.0	61108	             IF s3ItmNbr = itemInError and itemInError > *zeros;
3727.0	60111	
3728.0	60111	            // Set Page of first error
3729.0	61108	               IF ErrorPage3 = 0;
3730.0	60111	                 ErrorPage3 = RrnS03;
3731.0	61108	               ENDIF;
3732.0	60111	
3733.0	60511	               //%subst(ErrMsgIndsSf:5:1) = '1';
3734.0	60511	               setCsrPos(posS3ItmNbr);
3735.0	60511	               setCsrPos(posS3Last);
3736.0	60120	               ProtItmnbr = True;
3737.0	60109	               reset itemInError;
3738.0	61108	             ENDIF;
3739.0	60511	
3740.0	60511	             %subst(ErrMsgIndsSf:4:1) = s3OptError;
3741.0	60511	             %subst(ErrMsgIndsSf:7:2) = s3FreeItemError + s3GroupNumberError;
3742.0	60511	
3743.0	61108	             IF s3OptError = '1';
3744.0	60511	               setCsrPos(posS3Last);
3745.0	61108	             ENDIF;
3746.0	60109	
3747.0	60511	             UPDATE S03;
3748.0	60109	
3749.0	60510	             // Clear Screen Error indicators and reset cursor
3750.0	60511	             ErrMsgIndsSf = *all'0';
3751.0	60511	             ProtItmnbr = False;
3752.0	60109	
3753.0	60109	             retrievalRrnS03 += 1;
3754.0	61108	             IF retrievalRrnS03 > svRrnS03;
3755.0	60109	               leave;
3756.0	61108	             ENDIF;
3757.0	60109	
3758.0	60109	             Chain(e) retrievalRrnS03 S03;
3759.0	60109	           ENDDO;
3760.0	60109	
3761.0	61108	           IF errorpage3 > 0;
3762.0	60109	              c3dspr = errorpage3;
3763.0	61108	           ENDIF;
3764.0	60109	
3765.0	60109	           SflNxtChg1 = False;
3766.0	60109	           WkFn = *Blank;
3767.0	61108	         ENDIF;
3768.0	60109	
3769.0	60109	       return;
3770.0	60109	      /end-free
3771.0	60109	     P updateSubfile3  E
3772.0	50825	
3773.0	50825	       //=========================================================================
3774.0	50825	       //   Process Screen C04                                                   *
3775.0	50825	       //=========================================================================
3776.0	50825	     P processScreen4  B
3777.0	50825	     D processScreen4  PI
3778.0	50825	      /free
3779.0	50825	
3780.0	61108	         // Fill screen IF needed, display and process user action
3781.0	61108	         IF Fill04YN;
3782.0	60707	            loadScreenFields4 ();
3783.0	61108	            Fill04YN = False;
3784.0	61108	         ENDIF;
3785.0	61108	         IF Valid;
3786.0	61108	            displayScreen4 ();
3787.0	61108	            testUserAction4 ();
3788.0	61108	         ENDIF;
3789.0	50825	
3790.0	50825	       return;
3791.0	50825	      /end-free
3792.0	50825	     P processScreen4  E
3793.0	50825	
3794.0	50825	       //=========================================================================
3795.0	50825	       //   Display I/O for Screen C04                                           *
3796.0	50825	       //=========================================================================
3797.0	50825	     P displayScreen4  B
3798.0	50825	     D displayScreen4  PI
3799.0	50825	      /free
3800.0	50825	         // Display current screen and wait for input
3801.0	50825	         WRITE W01;
3802.0	50825	         WRITE W04;
3803.0	60707	         WRITE WMC01;
3804.0	50825	         EXFMT WC04;
3805.0	50825	
3806.0	50825	       return;
3807.0	50825	      /end-free
3808.0	50825	     P displayScreen4  E
3809.0	50825	
3810.0	50825	       //=========================================================================
3811.0	50825	       //   Fill Screen fields for Screen C04                                    *
3812.0	50825	       //=========================================================================
3813.0	50825	     P loadScreenFields4...
3814.0	50825	     P                 B
3815.0	50825	     D loadScreenFields4...
3816.0	50825	     D                 PI
3817.0	50825	      /free
3818.0	50825	         // Use to transfer fields from one screen to another / or file to screen
3819.0	50825	
3820.0	50825	         // Clear the subfile
3821.0	50825	         clearScreen4 ();
3822.0	50825	
3823.0	50825	         loadScreen4 ();
3824.0	50825	
3825.0	50825	       return;
3826.0	50825	      /end-free
3827.0	50825	     P loadScreenFields4...
3828.0	50825	     P                 E
3829.0	50825	
3830.0	50825	       //=========================================================================
3831.0	50825	       //   Clear Screen fields for Screen C04                                   *
3832.0	50825	       //=========================================================================
3833.0	50825	     P clearScreen4    B
3834.0	50825	     D clearScreen4    PI
3835.0	50825	      /free
3836.0	50825	         // Clear subfile.                                                         *
3837.0	50825	
3838.0	50825	         SflDsp3 = False;
3839.0	50825	         SflDspcTL3 = False;
3840.0	50825	         SflEnd3 = False;
3841.0	50825	         WRITE WC04;
3842.0	50825	
3843.0	50825	         SflDspcTL3 = True;
3844.0	50825	
3845.0	50825	         RrnS04     = 0;
3846.0	50825	         SVRrnS04   = 0;
3847.0	50825	         C4DSPR     = 1;
3848.0	50825	         NumRecAdd  = 0;
3849.0	50825	         EndS04 = False;
3850.0	50825	
3851.0	50825	         // Default to display the subfile as a single line, turn on SFLDROP
3852.0	50825	         SflFold = True;
3853.0	50825	       return;
3854.0	50825	      /end-free
3855.0	50825	     P clearScreen4    E
3856.0	50825	
3857.0	50825	       //=========================================================================
3858.0	50825	       //   Process Screen C04 Input                                             *
3859.0	50825	       //=========================================================================
3860.0	50825	     P testUserAction4...
3861.0	50825	     P                 B
3862.0	50825	     D testUserAction4...
3863.0	50825	     D                 PI
3864.0	50825	      /free
3865.0	50825	
3866.0	50825	         // clear all errors before doing anything else
3867.0	50825	         resetErrors ();
3868.0	51021	         reset UpdFailedFlag;
3869.0	50825	
3870.0	50825	         SELECT;
3871.0	50825	         WHEN KeyPressed = F_Exit;
3872.0	50825	           EndPgm = True;
3873.0	50825	
3874.0	50825	         WHEN KeyPressed = F_Cancel;
3875.0	50825	             Screen = 3;
3876.0	50825	           // Need to reset subfile - may need to be done somewhere else instead
3877.0	50825	             clearScreen4 ();
3878.0	50825	
3879.0	50825	         WHEN KeyPressed = F_Help
3880.0	50825	               Or KeyPressed = F_HelpKey;
3881.0	50825	           // go out to the help window / return to same position on screen
3882.0	50825	           SeeHelp (SDPgm: CSRFLD: JobLang);
3883.0	50825	           SetCsrPos('Y');
3884.0	61108	           IF CSRRRN > 0;
3885.0	50825	             C4Dspr = CSRRRN;
3886.0	61108	             ELSEIF Min_Rrn > 0;
3887.0	50825	               C4Dspr = Min_Rrn;
3888.0	61108	           ENDIF;
3889.0	50825	
3890.0	50825	         WHEN KeyPressed = F_Refresh;
3891.0	50825	             clearScreen4 ();
3892.0	50825	             loadScreen4 ();
3893.0	50825	             SetCsrPos();
3894.0	50825	
3895.0	50825	         WHEN KeyPressed = F_Enter and
3896.0	50825	            (EnOpt = OptDlt or EnOpt = OptDsp or EnOpt = OptPOSMaint
3897.0	50825	             or EnOpt = OptReActivate);
3898.0	50825	            Screen = 3;
3899.0	50825	
3900.0	50825	         WHEN KeyPressed = F_Enter;
3901.0	50825	           // Enter
3902.0	61108	           // Change in subfile / Validate is OK / IF OK go to next screen
3903.0	50825	           validateInput4 ();
3904.0	61108	           IF Valid;
3905.0	50825	             Screen = 3;
3906.0	61108	           ENDIF;
3907.0	61108	           Valid = True;
3908.0	50825	
3909.0	50825	         ENDSL;
3910.0	61108	
3911.0	61108	        // Keep cursor in the same place
3912.0	61108	         IF CsrRrn > 0;
3913.0	61108	           C3Dspr = CsrRrn;
3914.0	61108	         ELSE;
3915.0	61108	           C3Dspr = 1;
3916.0	61108	         ENDIF;
3917.0	50825	
3918.0	50825	       return;
3919.0	50825	      /end-free
3920.0	50825	     P testUserAction4...
3921.0	50825	     P                 E
3922.0	50825	
3923.0	50825	       //========================================================================
3924.0	50825	       //   Validate the subfile records                                        *
3925.0	50825	       //========================================================================
3926.0	50825	     P validateInput4...
3927.0	50825	     P                 B
3928.0	50825	     D validateInput4...
3929.0	50825	     D                 PI
3930.0	50825	      /free
3931.0	50825	
3932.0	50825	         IF SvRrnS04>0;
3933.0	61108	           // default to current screen displayed / will be overridden IF errors
3934.0	61108	           IF CSRRRN > 0;
3935.0	50825	             C4Dspr = CSRRRN;
3936.0	61108	             ELSEIF Min_Rrn > 0;
3937.0	50825	               C4Dspr = Min_Rrn;
3938.0	61108	           ENDIF;
3939.0	50825	
3940.0	60707	           ErrorPage4 = 0;
3941.0	50825	           Valid = True;
3942.0	50825	
3943.0	61108	           // Check Subfile to see IF cursor is on a valid subfile line
3944.0	50825	
3945.0	50825	           ReadC WS04;
3946.0	50825	           Dow Not %Eof;
3947.0	50825	             SflNxtChg3 = True;
3948.0	50825	
3949.0	50825	             X = %lookup(s4Grp# :w4Grp# :1);
3950.0	61108	             IF X > 0;
3951.0	50825	                w4gmpq(x) = s4gmpq;
3952.0	50909	                w4GrpId(x) = s4GrpId;
3953.0	61107	
3954.0	61108	             IF w4gmpq(x) = 0;
3955.0	61107	                Valid = False;
3956.0	61108	                ErrorPage4 = rrnS04;
3957.0	61108	                wkMsgDta = 'Group Min Purchase Qty';
3958.0	61107	                PutErrMsg (Is_Required: MsgF:
3959.0	61107	                           SdPgm :JobLang: wkMsgDta);
3960.0	61107	                SetCsrPos(PosS4GrpQty);
3961.0	61109	                chain 1 s03;
3962.0	61109	                SetCsrPos(PosS3Last);
3963.0	61109	                Update s03;
3964.0	61109	                c3DSPR = RrnS03;
3965.0	61108	             ENDIF;
3966.0	61108	             ENDIF;
3967.0	50825	
3968.0	61108	             IF w4gmpq(x) < 0;
3969.0	60707	                Valid = False;
3970.0	61108	                ErrorPage4 = rrnS04;
3971.0	61108	                wkMsgDta = 'Group Min Purchase Qty';
3972.0	60707	                PutErrMsg (cNegativeNotAllowed: MsgF:
3973.0	60707	                           SdPgm :JobLang: wkMsgDta);
3974.0	60707	                SetCsrPos(PosS4GrpQty);
3975.0	61108	             ENDIF;
3976.0	60707	
3977.0	50825	             Update WS04;
3978.0	50825	             // Clear Screen Error indicators and reset cursor
3979.0	50825	             ErrMsginds = *all'0';
3980.0	50825	
3981.0	50825	             //  Get Next Subfile Change
3982.0	50825	             ReadC WS04;
3983.0	50825	           EndDo;
3984.0	50825	
3985.0	50825	           //  Set the cursor page to first error page
3986.0	61108	           IF ErrorPage4 <> 0;
3987.0	60707	             C4DSPR = ErrorPage4;
3988.0	50825	             //  Keep cursor in the same place
3989.0	61108	           ELSEIF CsrRrn > 0;
3990.0	50825	             C4Dspr = CsrRrn;
3991.0	50825	             SetCsrPos('Y');
3992.0	61108	           ELSEIF Min_rrn > 0;
3993.0	50825	             C4Dspr = Min_rrn;
3994.0	61108	           ENDIF;
3995.0	50825	
3996.0	50825	           SflNxtChg3 = False;
3997.0	50825	
3998.0	61108	         ENDIF;
3999.0	50825	
4000.0	50825	       return;
4001.0	50825	      /end-free
4002.0	50825	     P validateInput4...
4003.0	50825	     P                 E
4004.0	50825	
4005.0	50825	       //=======================================================================
4006.0	50825	       //   Load SFL Data
4007.0	50825	       //=======================================================================
4008.0	50825	     P loadScreen4     B
4009.0	50825	     D loadScreen4     PI
4010.0	50825	      /free
4011.0	50825	
4012.0	50825	         RrnS04 = SvRrnS04;
4013.0	50825	         CntLnesS04 = 0;
4014.0	50825	
4015.0	50825	         // Load subfile
4016.0	50825	         For wkINDEX = 1 to w4GRPIndex;
4017.0	50825	
4018.0	50825	           SflNxtChg3 = False;
4019.0	61108	           IF w4Grp#(wkINDEX) > 0 and w4Grp#(wkINDEX) <> *Hival
4020.0	61109	              and w4Mode(wkINDEX) <> DltMode and w4Stat(wkINDEX) = cActive;
4021.0	50825	             RrnS04 = RrnS04 + 1;
4022.0	50825	             CntLnesS04 = CntLnesS04 + 1;
4023.0	61108	             IF CntLnesS04 = 1;
4024.0	50825	               CsrStart=RrnS04;
4025.0	61108	             ENDIF;
4026.0	50825	
4027.0	50825	             //  Load SFL fields
4028.0	50825	             CLEAR WS04;
4029.0	50825	             s4grp# = w4grp#(wkIndex);
4030.0	50825	             s4gmpq = w4gmpq(wkIndex);
4031.0	50909	             s4GrpId = w4GrpId(wkIndex);
4032.0	50825	             SflNxtChg3 = True;
4033.0	50825	
4034.0	50825	           Write WS04;
4035.0	61108	           ENDIF;
4036.0	50825	
4037.0	61108	           IF CntLnesS04 > cMaxRRN;
4038.0	50825	             leave;
4039.0	61108	           ENDIF;
4040.0	50825	
4041.0	50825	         EndFor;
4042.0	50825	
4043.0	50825	         SvRrnS04 = RrnS04;
4044.0	50825	
4045.0	50825	         SflEnd3 = True;
4046.0	50825	
4047.0	61108	         // Empty Subfile? / this may be needed IF no blank pages
4048.0	50825	         SflDsp3 = (RrnS04 > 0);
4049.0	50825	         C4DSPR = CsrStart;
4050.0	61108	
4051.0	61108	         Select;
4052.0	61108	          // Send Error message, when no groups to maintain
4053.0	61108	          When RrnS04 = 0 and KeyPressed = F_ModGrp;
4054.0	61108	             PutErrMsg (' '  :MsgF :SdPgm :JobLang
4055.0	61108	                        :cNoGroupsToMaintain);
4056.0	61108	             Screen = 3;
4057.0	61108	             SetCsrPos(Poss3Opt);
4058.0	61108	             Valid = False;
4059.0	61108	
4060.0	61108	          // Send Error message, need at least two groups
4061.0	61108	          When RrnS04 > 0 and RrnS04 < 2 ;
4062.0	61108	             PutErrMsg (' '  :MsgF:
4063.0	61108	                        SdPgm :JobLang :cNotEnoughGroups);
4064.0	61108	             Screen = 3;
4065.0	61109	             chain 1 s03;
4066.0	61109	             SetCsrPos(Poss3Last);
4067.0	61109	             update s03;
4068.0	61109	             ErrorPage3 = RrnS03;
4069.0	61108	             Valid = False;
4070.0	61108	         EndSl;
4071.0	50825	
4072.0	50825	       return;
4073.0	50825	      /end-free
4074.0	50825	     P loadScreen4     E
4075.0	50825	
4076.0	50825	       //=======================================================================
4077.0	50825	       //   Process all group number
4078.0	50825	       //=======================================================================
4079.0	50825	     P loopSubfile4    B
4080.0	50825	     D loopSubfile4    PI
4081.0	50825	      /free
4082.0	50825	
4083.0	51026	         // Load subfile
4084.0	51026	         For wkINDEX = 1 to w4GRPIndex;
4085.0	51026	
4086.0	51026	           // Build Coupon Group
4087.0	61108	           IF w4Grp#(wkINDEX) > 0 ;
4088.0	51026	             Clear CpnGroupDS;
4089.0	51026	             CpnGroupDS.CouponGroupId       = w4GrpId(wkIndex);
4090.0	51026	             CpnGroupDS.CouponId            = c2CpnId;
4091.0	51026	             CpnGroupDS.CouponGroupNumber   = w4POSGrp#(wkIndex);
4092.0	51026	             CpnGroupDS.GroupMinPurQuantity = w4GMPQ(wkIndex);
4093.0	51026	             Select;
4094.0	51026	               When w4Mode(wkINDEX) = Addmode;
4095.0	51027	                 CpnGroupDS.StatusCode = cActive;
4096.0	51026	                 CpnGroupDS.CouponGroupId =  0;
4097.0	61108	                 IF not PutCouponGroup(AddMode :CpnGroupDS);
4098.0	51026	                   UpdFailedFlag = True;
4099.0	61108	                 ENDIF;
4100.0	51026	                 w4GrpID(wkINDEX) = CouponGroupDS.CouponGroupID;
4101.0	51026	                 W4Mode(wkINDEX) = ChgMode;
4102.0	80528	                 w4POSGrp#(wkIndex)= couponGroupDS.couponGroupNumber;
4103.0	51026	               When w4Mode(wkINDEX) = Chgmode;
4104.0	51027	                 CpnGroupDS.StatusCode = cActive;
4105.0	80916	                 IF not PutCouponGroup(CHANGE :CpnGroupDS);
4106.0	51026	                   UpdFailedFlag = True;
4107.0	61108	                 ENDIF;
4108.0	51026	               When w4Mode(wkINDEX) = DltMode;
4109.0	51027	                 CpnGroupDS.StatusCode = DltMode;
4110.0	80916	                 IF not PutCouponGroup(DELETE :CpnGroupDS);
4111.0	51026	                   UpdFailedFlag = True;
4112.0	61108	                 ENDIF;
4113.0	51026	             EndSl;
4114.0	61108	           ENDIF;
4115.0	50825	
4116.0	50825	         EndFor;
4117.0	50825	
4118.0	50825	       return;
4119.0	50825	      /end-free
4120.0	50825	     P loopSubfile4    E
4121.0	61108	
4122.0	61108	       //=======================================================================
4123.0	61108	       //   Process all group number
4124.0	61108	       //=======================================================================
4125.0	61108	     P loopSubfile4a   B
4126.0	61108	     D loopSubfile4a   PI
4127.0	61108	      /free
4128.0	61108	
4129.0	61108	         // Load subfile
4130.0	61108	         For wkINDEX = 1 to w4GRPIndex;
4131.0	61108	
4132.0	61108	           // Build Coupon Group
4133.0	61108	           IF w4Grp#(wkINDEX) > 0 ;
4134.0	61108	             Clear CpnGroupDS;
4135.0	61108	             CpnGroupDS.CouponGroupId       = w4GrpId(wkIndex);
4136.0	61108	             CpnGroupDS.CouponId            = c2CpnId;
4137.0	61108	             CpnGroupDS.CouponGroupNumber   = w4POSGrp#(wkIndex);
4138.0	61108	             CpnGroupDS.GroupMinPurQuantity = w4GMPQ2(wkIndex);
4139.0	61108	             Select;
4140.0	61108	               When w4OldRcd(wkIndex);
4141.0	61108	                 CpnGroupDS.StatusCode = cActive;
4142.0	80916	                 PutCouponGroup(CHANGE :CpnGroupDS);
4143.0	61108	               Other;
4144.0	61108	                 CpnGroupDS.StatusCode = DltMode;
4145.0	80916	                 PutCouponGroup(DELETE :CpnGroupDS);
4146.0	61108	             EndSl;
4147.0	61108	           ENDIF;
4148.0	61108	
4149.0	61108	         EndFor;
4150.0	61108	
4151.0	61108	       return;
4152.0	61108	      /end-free
4153.0	61108	     P loopSubfile4a   E
4154.0	50825	
4155.0	50825	       //=========================================================================
4156.0	50825	       //   Process Call to Coupon Location Maintenance                          *
4157.0	50825	       //=========================================================================
4158.0	60426	     P processScreen5  B
4159.0	60426	     D processScreen5  PI
4160.0	60217	
4161.0	50825	      /free
4162.0	260623	
4163.0	260623	       EnCpnTyp = C2CPNTYP;
4164.0	81119	       // Added 5th arg, ChkFlg, can be used to control behavior in OACP1020R
4165.0	260623	        //EnContID = S2ContID;
4166.0	260623	       // Added 6th arg, EnCpnTyp, to pass the Coupon Type to OACP1020R
4167.0	260423	       CallP MaintainCpnLoc (Enopt :c2CpnId
4168.0	260623	                             :wkCpnId :wkFn2
4169.0	260623	                             :ChkFlg :EnContID :EnCpnTyp);
4170.0	81119	       ChkFlg = False; // arg on CallP MaintainCpnLoc
4171.0	50825	          Select;
4172.0	50825	            when wkFn2 = F_Exit;
4173.0	50825	               Keypressed = wkFn2;
4174.0	50825	               EndPgm = True;
4175.0	50825	
4176.0	50825	            when wkFn2 = F_Cancel;
4177.0	50825	               Screen = 3;
4178.0	50825	
4179.0	50825	            when wkFn2 = F_Enter;
4180.0	50825	               Keypressed = wkFn2;
4181.0	61108	               IF EnOpt = OptAdd or EnOpt = OptChg or EnOpt = OptCpy;
4182.0	60220	                  EndPgm = True;
4183.0	50825	               else;
4184.0	50825	                  screen = 3;
4185.0	61108	               ENDIF;
4186.0	50825	          EndSl;
4187.0	50825	
4188.0	50825	       return;
4189.0	50825	      /end-free
4190.0	60426	     P processScreen5  E
4191.0	60426	
4192.0	60426	      // =======================================================================
4193.0	250123	      // Procedure processScreen6:
4194.0	60426	      // =======================================================================
4195.0	60426	      // This procedure is used to control processing for format WS06/WS06.
4196.0	60426	      // =======================================================================
4197.0	60426	     P processScreen6  B
4198.0	60426	     D processScreen6  PI
4199.0	60426	      /free
4200.0	60426	       clearScreen6 ();
4201.0	60426	       loadScreen6 ();
4202.0	60919	       reset userAccepted;
4203.0	60426	
4204.0	60426	       dou userAccepted or
4205.0	60426	           keyPressed = F_EXIT or
4206.0	60426	           keyPressed = F_CANCEL;
4207.0	60426	         displayScreen6  ();
4208.0	60426	         testUserAction6 ();
4209.0	60426	       enddo;
4210.0	60426	
4211.0	61108	       IF keyPressed = F_CANCEL;
4212.0	60426	         clear keyPressed;
4213.0	61108	       ENDIF;
4214.0	60426	
4215.0	60426	       return;
4216.0	60426	      /end-free
4217.0	60426	     P processScreen6  E
4218.0	60426	
4219.0	60426	      // =======================================================================
4220.0	60426	      // Procedure clearScreen6:
4221.0	60426	      // =======================================================================
4222.0	60426	      // This procedure is used to clear the subfile.
4223.0	60426	      // =======================================================================
4224.0	60426	     P clearScreen6    B
4225.0	60426	     D clearScreen6    PI
4226.0	60426	      /free
4227.0	60426	       sflDsp6    = FALSE;
4228.0	60426	       sflDspCtl6 = FALSE;
4229.0	60426	       write WC06;
4230.0	60426	
4231.0	60426	       sflDspCtl6 = TRUE;
4232.0	60426	       c6DspR = 1;
4233.0	60426	
4234.0	60426	       rrnWS06 = 0;
4235.0	60426	
4236.0	60426	       return;
4237.0	60426	      /end-free
4238.0	60426	     P clearScreen6    E
4239.0	60426	
4240.0	60426	      // =======================================================================
4241.0	60426	      // Procedure loadScreen6:
4242.0	60426	      // =======================================================================
4243.0	60426	      // This procedure is used to load the warning window Subfile.
4244.0	60426	      // =======================================================================
4245.0	60426	     P loadScreen6     B
4246.0	60426	     D loadScreen6     PI
4247.0	60426	
4248.0	60426	      /free
4249.0	60426	       // Start with the last SFL record loaded
4250.0	60426	
4251.0	60426	       numberLinesWS06 = 0;
4252.0	60426	       numberRecordsAdded = %rem(numberRecordsAdded : cRecPageWS06);
4253.0	60426	
4254.0	60426	       //  Load entire subfile.
4255.0	60426	         Dou WarningMessagesDS = *blanks;
4256.0	60426	
4257.0	60426	         numberLinesWS06 += 1;
4258.0	260423	
4259.0	60426	         %occur(WarningMessagesDS) = numberLinesWS06;
4260.0	61108	         IF wkMessage = *blanks;
4261.0	60426	           leave;
4262.0	61108	         ENDIF;
4263.0	60426	
4264.0	60426	         rrnWS06 += 1;
4265.0	60426	
4266.0	60426	         // Load Subfile fields.
4267.0	60426	         clear WS06;
4268.0	60426	         s6Message = wkMessage;
4269.0	60426	         s6MsgId   = wkMsgId;
4270.0	60426	
4271.0	60426	         write WS06;
4272.0	60426	
4273.0	60426	       EndDo;
4274.0	60426	       sflEnd6 = True;
4275.0	60426	
4276.0	60426	       numberRecordsAdded = 0;
4277.0	60426	
4278.0	61108	       // Empty Subfile? / this may be needed IF no blank pages
4279.0	60426	       sflDsp6 = (rrnwS06 <> 0);
4280.0	60426	
4281.0	61108	       IF rrnWS06 = 0;
4282.0	60426	          PutErrMsg (NoSflRecs: MsgF:
4283.0	60426	           SdPgm :JobLang);
4284.0	60426	       else;
4285.0	61108	          // Set Subfile Display IF Records Loaded to Subfile
4286.0	60426	          // Default cursor to first record, last screen
4287.0	60426	          c6DspR = 1;
4288.0	61108	       ENDIF;
4289.0	60426	
4290.0	60426	       return;
4291.0	60426	      /end-free
4292.0	60426	     P loadScreen6     E
4293.0	60426	
4294.0	60426	      // =======================================================================
4295.0	60426	      // Procedure displayScreen6:
4296.0	60426	      // =======================================================================
4297.0	60426	      // This procedure is used to display the screen formats WC06/WS06.
4298.0	60426	      // =======================================================================
4299.0	60426	     P displayScreen6  B
4300.0	60426	     D displayScreen6  PI
4301.0	60426	      /free
4302.0	60426	       write W02;
4303.0	60426	       write W06;
4304.0	60426	       exfmt WC06;
4305.0	60426	
4306.0	60426	       return;
4307.0	60426	      /end-free
4308.0	60426	     P displayScreen6  E
4309.0	60426	
4310.0	60426	      // =======================================================================
4311.0	60426	      // Procedure testUserAction6:
4312.0	60426	      // =======================================================================
4313.0	60426	      // This procedure is used as test what function key was pressed by the
4314.0	60426	      // user and to execute the corresponding action.
4315.0	60426	      // =======================================================================
4316.0	60426	     P testUserAction6...
4317.0	60426	     P                 B
4318.0	60426	     D testUserAction6...
4319.0	60426	     D                 PI
4320.0	60426	
4321.0	60426	      // - Local Variables -
4322.0	60426	
4323.0	60426	      /free
4324.0	60426	       resetErrors ();
4325.0	60426	
4326.0	61108	       IF noItemsEntered;
4327.0	60823	         select;
4328.0	60823	         when keyPressed = F_CANCEL;
4329.0	60823	            Screen = 3;
4330.0	60823	            returnToItems = True;
4331.0	60823	            errorFoundItem = True;
4332.0	60823	
4333.0	60823	         when keyPressed = F_ENTER and w6Accept = Yes;
4334.0	60823	            userAccepted = True;
4335.0	60823	            screen = 2;
4336.0	60823	            reset warningsFound;
4337.0	60823	
4338.0	60823	         when keyPressed = F_ENTER and w6Accept = No;
4339.0	60823	            keyPressed = F_Cancel;
4340.0	60823	            Screen = 3;
4341.0	60823	            returnToItems = True;
4342.0	60823	            errorFoundItem = True;
4343.0	60823	         endsl;
4344.0	60823	
4345.0	60823	       else;
4346.0	60823	
4347.0	60823	         select;
4348.0	60823	         when keyPressed = F_CANCEL;
4349.0	60822	            Screen = 2;
4350.0	60822	            errorFound = False;
4351.0	60822	            cancelWarnings = True;
4352.0	80916	            SetEnvironment(ROLLBACK);
4353.0	61108	            // Check IF any contracts should be deleted after rollback
4354.0	60822	            resetContracts(DltMode);
4355.0	60822	            reset warningsFound;
4356.0	60426	
4357.0	60823	         when keyPressed = F_ENTER and w6Accept = Yes;
4358.0	60823	            userAccepted = True;
4359.0	60823	            screen = 2;
4360.0	60823	            reset warningsFound;
4361.0	60822	
4362.0	60823	         when keyPressed = F_ENTER and w6Accept = No;
4363.0	60822	            keyPressed = F_Cancel;
4364.0	60822	            Screen = 2;
4365.0	60822	            errorFound = False;
4366.0	60822	            cancelWarnings = True;
4367.0	80916	            SetEnvironment(ROLLBACK);
4368.0	61108	            // Check IF any contracts should be deleted after rollback
4369.0	60822	            resetContracts(DltMode);
4370.0	60822	            reset warningsFound;
4371.0	60823	         endsl;
4372.0	61108	       ENDIF;
4373.0	60426	
4374.0	60426	       return;
4375.0	60426	      /end-free
4376.0	60426	     P testUserAction6...
4377.0	60426	     P                 E
4378.0	50825	
4379.0	50825	       //=========================================================================
4380.0	50825	       // Reset error variables prior to test / used by each screen              *
4381.0	50825	       //=========================================================================
4382.0	50825	     P resetErrors     B
4383.0	50825	     D resetErrors     PI
4384.0	50825	      /free
4385.0	50825	         Valid = TRUE;
4386.0	50825	         PCFirstFld = False;
4387.0	50825	
4388.0	50825	         // Clear any messages still on screen
4389.0	50825	         RmvMsgFromQ (SdPgm);
4390.0	50825	         // reset cursor position to use default
4391.0	50825	         SetCsrPos();
4392.0	50825	         // Clear Screen Error indicators
4393.0	50825	         ErrMsginds = *all'0';
4394.0	50825	
4395.0	50825	       return;
4396.0	50825	      /end-free
4397.0	50825	     P resetErrors     E
4398.0	50825	
4399.0	50825	       //========================================================================
4400.0	50825	       // End Program Process                                                   *
4401.0	50825	       //========================================================================
4402.0	50825	     P endProgram      B
4403.0	50825	     D endProgram      PI
4404.0	50825	      /free
4405.0	50825	
4406.0	50825	
4407.0	50825	         CLOSE OACP1010D;
4408.0	50825	
4409.0	50825	         IF wkParms > 0;
4410.0	50825	           // Transfer optional Parms back out
4411.0	50825	           EnFn = KeyPressed;
4412.0	61108	         ENDIF;
4413.0	50825	
4414.0	50825	         Select;
4415.0	61108	           // IF F3 (Exit) or Cancel (F12) is pressed
4416.0	50825	           When KeyPressed = F_Exit or KeyPressed = F_Cancel;
4417.0	50825	
4418.0	50825	           // Enter is pressed
4419.0	50825	           When KeyPressed = F_Enter;
4420.0	50825	              CommitChanges();
4421.0	61108	              IF EnOpt = OptAdd or EnOpt = OptCpy;
4422.0	50825	                 EnCpnID = c2CpnID;
4423.0	61108	              ENDIF;
4424.0	50825	              EnUpdFailedFlag = UpdFailedFlag;
4425.0	50825	         EndSl;
4426.0	250203	         resetRDBConnection ();
4427.0	50825	
4428.0	50825	       return;
4429.0	50825	      /end-free
4430.0	50825	     P endProgram      E
4431.0	50825	
4432.0	50825	       //========================================================================
4433.0	50825	       // Initialize program environment - reset each time starting             *
4434.0	50825	       //========================================================================
4435.0	50825	     P beginProgram    B
4436.0	50825	     D beginProgram    PI
4437.0	50825	
4438.0	50825	     D parameters      s             15s 5
4439.0	50825	
4440.0	50825	      /free
4441.0	50825	
4442.0	50908	         mc1pgmq = sdpgm;
4443.0	50908	
4444.0	50825	         // Get Job info
4445.0	50825	         JobWhse = GetJobLocn;
4446.0	50825	         JobRegn = GetJobRegn;
4447.0	50825	         JobLoct = GetJobLoct;
4448.0	50825	         JobCmpy = GetJobCmpy;
4449.0	50825	         JobLang = GetJobLang;
4450.0	90128	         WkRckAllowed = *Blank;
4451.0	90225	         wkMItemTax= *Blank;
4452.0	90622	         ViewCouponItm = False;
4453.0	50825	
4454.0	61108	         IF Not %Open(OACP1010D);
4455.0	50825	           Open OACP1010D;
4456.0	61108	         ENDIF;
4457.0	50825	
4458.0	50825	         EndPgm = False;
4459.0	50825	
4460.0	50825	         // reset error validation
4461.0	50825	         resetErrors ();
4462.0	50825	
4463.0	50825	         // reset fields for first screen
4464.0	50825	         PCFirstFld = True;
4465.0	50825	
4466.0	50825	         // Clear any Screens:
4467.0	50825	         Write R01;
4468.0	50825	         // Clear the subfile 01 - enter contract number/s
4469.0	50825	         clearScreen2 ();
4470.0	50825	         // Clear the subfile 02 - enter coupon data and maintain item rule
4471.0	50825	         clearScreen3 ();
4472.0	250205	         // Clear the subfile 03 - enter coupon data and maintain item rule
4473.0	250205	         clearScreen8 ();
4474.0	50825	         NDCpnNbrFld = False;
4475.0	50825	
4476.0	50825	         Clear CpnMasterDS;
4477.0	50825	         Clear CpnMasterDS2;
4478.0	61108	         IF EnOpt <> OptAdd and EnOpt <> OptCpy;
4479.0	50825	           NDCpnNbrFld = True;
4480.0	61108	         ENDIF;
4481.0	50825	         Reset UpdFailedFlag;
4482.0	51014	         Reset ReloadS02;
4483.0	51123	         Reset duplicateS02;
4484.0	51019	         Reset ReloadS02Mode;
4485.0	51123	         Reset errContract#;
4486.0	60223	         Reset rollbackCnt#;
4487.0	60223	         Reset rbkIndx;
4488.0	51018	         errorFound = False;
4489.0	51018	         errorFoundContract = False;
4490.0	60426	         allContractsInError = False;
4491.0	100309	         reset switch_F_Key;
4492.0	100309	         reset getItemFromContract;
4493.0	50825	
4494.0	50825	           Select;
4495.0	61108	             // IF all parameters are passed into the program, bypass the
4496.0	51102	             // first select screen and go directly to the subfile
4497.0	50825	           When wkParms = cMaxParms;
4498.0	50825	             Fill02YN = TRUE;
4499.0	61108	             //check IF coupon id exists
4500.0	50825	             wkCpnID = EnCpnID;
4501.0	61108	             IF EnOpt <> OptAdd;
4502.0	80916	              IF GetCoupon(EQUAL :wkCpnid)= 0;
4503.0	50825	                EndPgm = True;
4504.0	61108	              ELSE;
4505.0	50825	                %occur(CouponMasterDS) = 1;
4506.0	50825	                CpnMasterDS2 = CouponMasterDS;
4507.0	61108	              ENDIF;
4508.0	61108	             ENDIF;
4509.0	61108	             IF Not Valid;
4510.0	50825	               KeyPressed = F_Cancel;
4511.0	50825	               EndPgm = True;
4512.0	61108	             ENDIF;
4513.0	50825	
4514.0	50825	           Other;
4515.0	50825	
4516.0	50825	           EndSl;
4517.0	50825	
4518.0	50825	           ProtInpFlds = False;
4519.0	51108	           HighlightFlds = False;
4520.0	90622	           IF EnOpt = OptPOSMaint;
4521.0	50825	              Fill03YN = True;
4522.0	50825	              ProtInpFlds = True;
4523.0	51108	              HighlightFlds = True;
4524.0	50825	              Screen = 3;
4525.0	50825	              loadScreenFields2 ();
4526.0	61108	           ELSE;
4527.0	50825	              Screen = 2;
4528.0	50825	              Fill02YN = True;
4529.0	90622	
4530.0	90622	              if EnOpt = OptDlt or EnOpt = OptDsp or EnOpt = OptReactivate;
4531.0	90622	                ProtInpFlds = True;
4532.0	90622	                HighlightFlds = True;
4533.0	90622	              endif;
4534.0	61108	           ENDIF;
4535.0	50825	
4536.0	250203	           setRDBConnection ();
4537.0	250206	       %occur(cursorControl) = CURSOR_ITEM_CATEGORY_CURSOR;
4538.0	250206	       fetchFactor = %elem(itemCategoryBlock);
4539.0	50825	
4540.0	260623	       C2CPNTYP = *blanks;
4541.0	260623	       ProtCmyNbr = False;
4542.0	50825	       return;
4543.0	50825	      /end-free
4544.0	50825	     P beginProgram    E
4545.0	50825	
4546.0	50825	       //=========================================================================
4547.0	50825	       // Set Cursor position on Screen (current/default/error)                  *
4548.0	50825	       //=========================================================================
4549.0	50825	     P SetCsrPos       B
4550.0	50825	     D SetCsrPos       PI
4551.0	50825	     D  SetCsr                        2A   VALUE OPTIONS(*NOPASS)
4552.0	61108	      // IF a parm longer than 1 is passed then set error indicators
4553.0	61108	      // IF a parm of 1 char is passed then position cursor to current position
4554.0	61108	      // IF no parm is passed then use default display file positioning
4555.0	50825	      //   Uses variables that are defined in Display File
4556.0	50825	      //   Uses 2 indicators to position for errors on screen
4557.0	50825	     D  Errind         DS             2
4558.0	50825	     D    Err01                       2    Overlay(ErrInd:1) INZ('00')
4559.0	50825	     D    Err01N                      2  0 Overlay(ErrInd:1)
4560.0	50825	
4561.0	50825	      // This procedure takes a string of 2 char converts to a number
4562.0	50825	      //  to highlight a field on the screen
4563.0	50825	      // It is set to work with a block of display indicators
4564.0	50825	      //
4565.0	50825	      // Requires global variables:
4566.0	50825	      //             ErrMsgInds (Block of Indicators in INDDS)
4567.0	50825	      //             ErrIndStrt (1 less than starting position of ErrMsgInds in INDDS)
4568.0	50825	      //
4569.0	50825	
4570.0	50825	      /FREE
4571.0	50825	       IF %Parms > 0;
4572.0	50825	         IF %Len(%Trim(SetCsr))>1;
4573.0	50825	           // CALLP   SetCsrPos('50')  (Set Error Indicators for Field)
4574.0	50825	           Err01 = SetCsr;
4575.0	50825	
4576.0	50825	           IF Err01N > ErrIndStrt;
4577.0	50825	             Err01N = Err01N - ErrIndStrt;
4578.0	50825	             %SUBST(ErrMsgInds:Err01N:1) = True;
4579.0	61108	           ENDIF;
4580.0	50825	
4581.0	50825	         ELSE;
4582.0	50825	           //  CALLP   SetCsrPos('Y')  (Leave cursor in same place)
4583.0	50825	           CSRPOSROW = CSRROW;
4584.0	50825	           CSRPOSCOL = CSRCOL;
4585.0	61108	         ENDIF;
4586.0	50825	
4587.0	50825	       ELSE;
4588.0	50825	         //  CALLP   SetCsrPos   (Use default positioning)
4589.0	50825	         CSRPOSROW = 0;
4590.0	50825	         CSRPOSCOL = 0;
4591.0	61108	       ENDIF;
4592.0	50825	
4593.0	50825	       Return;
4594.0	50825	
4595.0	50825	      /END-FREE
4596.0	50825	     P SetCsrPos       E
4597.0	0	
4598.0	0	      //=========================================================================
4599.0	61108	      // IF prompt key hit, decide what should be done                          *
4600.0	0	      //=========================================================================
4601.0	50825	     P DisplayPrompt   B
4602.0	50825	     D DisplayPrompt   PI
4603.0	50825	     D  DSPRecord                          like(typeObjectName)  const
4604.0	50825	     D  DSPField                           like(typeObjectName)  const
4605.0	50728	
4606.0	51013	     D promptContractNumber...
4607.0	51013	     D                 PR                  extpgm('OARCPNCNTM')
4608.0	51013	     D  PrContractNumber...
4609.0	51013	     D                                     like(s2ContId)
4610.0	50824	     D promptCompanyNumber...
4611.0	50824	     D                 PR                  extpgm('GLRCMPY')
4612.0	50824	     D  PrCompanyNumber...
4613.0	50824	     D                                     like(typeCompany)
4614.0	50824	     D  PrCompanyCode                      like(typeCompanyCode)
4615.0	50824	
4616.0	50728	     D PromptDepartment...
4617.0	50728	     D                 PR                  ExtPgm('INRDDES')
4618.0	50728	     D PrDepartment                        Like(TypeDepartment)
4619.0	50728	
4620.0	50831	     D PromptCodeTable...
4621.0	51130	     D                 PR                  ExtPgm('OARCDPRMT')
4622.0	50831	     D PrCode                              Like(TypeCode)
4623.0	51130	     D PrDescription                 30A
4624.0	51130	     D PrTableId                     10A
4625.0	50728	
4626.0	50728	     D PromptTaxCode...
4627.0	80918	     D                 PR                  ExtPgm('OARTAXCODE')
4628.0	80918	     D PrNewCode                           like(WkNewTax)
4629.0	80918	     D PrTaxCode                           like(WkItemTax)
4630.0	0	
4631.0	50926	     D PromptContractItem...
4632.0	50926	     D                 PR                  ExtPgm('OARCPNITMM')
4633.0	50919	     D  PrCompanyNumber...
4634.0	50919	     D                                     like(typeCompany)
4635.0	50919	     D  PrCouponID                         like(wkCpnID) const
4636.0	50919	
4637.0	50926	     D PromptItem      PR                  ExtPgm('INRITMM')
4638.0	50926	     D PrLocation                          Like(TypeLocation)
4639.0	50926	     D PrDptNbr                            Like(TypeDepartment30)
4640.0	50926	     D PrVendor                       5  0
4641.0	50926	     D PrSuffix                            Like(TypeSuffix)
4642.0	50926	     D ProtIO                              Like(TypeotIO)
4643.0	50926	     D PrItemNumber                        Like(TypeItem)
4644.0	260623	
4645.0	260623	     D PromptCpnCodeTable...
4646.0	260623	     D                 PR                  ExtPgm('OARCDEPMT')
4647.0	260623	     D PrCode                              Like(C2CPNTYP)
4648.0	260623	     D PrTableName                   10A
4649.0	260623	     D PrTitleName                   40A
4650.0	50801	
4651.0	50824	     D wkCompanyNumber...
4652.0	50824	     D                 S                   Like(TypeCompany)
4653.0	50801	     D wkDepartment    S                   Like(TypeDepartment)
4654.0	50801	     D wkMarDistrCde   S                   Like(TypeMarginDistr)
4655.0	50801	     D wkMarDistrCdeDes...
4656.0	50801	     D                 S                   Like(TypeCodeDesc)
4657.0	50801	     D wkRedemptType   S                   Like(TypeRedempType)
4658.0	50801	     D wkRedemptTypeDes...
4659.0	50801	     D                 S                   Like(TypeCodeDesc)
4660.0	160321	     D wkItemTax       S             15a   Inz
4661.0	160321	     D wkNewTax        S             15a   Inz
4662.0	50801	     D wkLocation      S                   Like(TypeLocation)
4663.0	50802	     D wkDptNbr30      S                   Like(TypeDepartment30)
4664.0	50901	     D wkVendor        S              5  0
4665.0	50801	     D wkSuffix        S                   Like(TypeSuffix)
4666.0	50801	     D wkotIO          S                   Like(TypeotIO)
4667.0	50801	     D wkItemNumber    S                   Like(TypeItem)
4668.0	51013	     D wkContractNumber...
4669.0	51013	     D                 S                   like(s2ContId)
4670.0	50831	
4671.0	50831	     D wkTableName     S             10A   inz
4672.0	50831	     D wkTitleName     S             40A   inz
4673.0	260623	     D wkCouponType    S                   like(C2CPNTYP)
4674.0	260623	
4675.0	0	      /FREE
4676.0	0	       Monitor;
4677.0	0	         SELECT;
4678.0	50824	
4679.0	50728	         // Department Prompt
4680.0	50728	         When DspField = 'C3POSDEPT';
4681.0	50801	           CallP PromptDepartment(wkDepartment);
4682.0	61108	           IF WKDepartment <> 0;
4683.0	50801	             c3POSDEPT = wkDepartment;
4684.0	50906	             wkAct#ofRows = GetDepartmentDescription(c3POSDept);
4685.0	61108	             IF wkAct#ofRows > 0;
4686.0	51122	               c3POSDeptD = DeptDescDS.DGDESS;
4687.0	61108	             ENDIF;
4688.0	61108	           ENDIF;
4689.0	0	
4690.0	50728	         // Margin Distribution Code
4691.0	50831	         When DspField = 'C3MRGNDSTC';
4692.0	51130	           wkMarDistrCde = *blanks;
4693.0	51130	           wkMarDistrCdeDes = *blanks;
4694.0	50831	           wkTableName = tableDistributionCodes;
4695.0	51130	           promptCodeTable(wkMarDistrCde : wkMarDistrCdeDes :
4696.0	51130	                           wkTableName);
4697.0	61108	           IF wkMarDistrCde <> *Blanks;
4698.0	51130	             c3MrgnDstC = wkMarDistrCde;
4699.0	51130	             c3MrgnDstD = wkMarDistrCdeDes;
4700.0	61108	           ENDIF;
4701.0	50831	
4702.0	50831	         // Redemption Type Code
4703.0	50831	         When DspField = 'C3RDMPTNTY';
4704.0	51130	           wkRedemptType = *blanks;
4705.0	51130	           wkRedemptTypeDes = *blanks;
4706.0	50831	           wkTableName = tableRedemptionTypeCodes;
4707.0	51130	           CallP promptCodeTable(wkRedemptType : wkRedemptTypeDes :
4708.0	51130	                                 wkTableName);
4709.0	61108	           IF wkRedemptType <> *Blanks;
4710.0	51130	             C3RDMPTNTY = wkRedemptType;
4711.0	51130	             c3RdmptnTD = wkRedemptTypeDes;
4712.0	61108	           ENDIF;
4713.0	50728	
4714.0	50728	         // Coupon Tax Code
4715.0	50802	         When DspField = 'C3CPNTAXC';
4716.0	80918	           wkNewTax = *Blank;
4717.0	80918	           CallP PromptTaxCode(wkNewTax : wkItemTax);
4718.0	80918	           IF wkNewTax <> *Blanks;
4719.0	90313	             C3CpnTaxC = wkNewTax;
4720.0	90622	             C3CPNTAXCD = wkItemTax;
4721.0	91214	             select;
4722.0	260806	             when vendorFunded and c3Cmynbr <> CA_COMPANY;
4723.0	91214	               C3CpnTaxC = wkNewTax;
4724.0	91214	               C3CPNTAXCD = wkItemTax;
4725.0	91214	             other;
4726.0	91214	               C3CpnTaxC = wkItemTax;
4727.0	260806	               IF  c3Cmynbr = CA_COMPANY;
4728.0	260623	                   C3CPNTAXCD = *Blanks;
4729.0	260623	               Else;
4730.0	260623	                   C3CPNTAXCD = wkNewTax;
4731.0	260623	               ENDIF;
4732.0	91214	             endsl;
4733.0	80918	           ENDIF;
4734.0	50728	
4735.0	50728	         // Item Number
4736.0	50728	         When DspField = 'S3ITMNBR';
4737.0	61108	           IF ContractExists;
4738.0	50926	             wkCompanyNumber = c3CmyNbr;
4739.0	51101	             CallP PromptContractItem(wkCompanyNumber : c2CpnID);
4740.0	50926	             GetDtaQData() ;
4741.0	50926	           else;
4742.0	51010	             CallP PromptItem(wkLocation : wkDptNbr30 : wkVendor :
4743.0	51010	                              wkSuffix : wkotIO : wkItemNumber);
4744.0	61108	             IF wkItemNumber <> *Zeros;
4745.0	51010	               chain(e) csrrrn s03;
4746.0	61108	               IF %found();
4747.0	50926	                 s3ItmNbr   = wkItemNumber;
4748.0	50926	                 sflnxtchg2 = True;
4749.0	51104	                 wkAct#ofRows3c = GetItemDescription(c3CmyNbr :S3ItmNbr);
4750.0	61108	                 IF wkAct#ofRows3c > 0;
4751.0	51104	                    s3ItDes1 = ItemDescriptionDS.IMDES1;
4752.0	51104	                    s3ItDes2 = ItemDescriptionDS.IMDES2;
4753.0	51104	                    s3Dept   = ItemDescriptionDS.IMDEPT;
4754.0	61108	                 ENDIF;
4755.0	51104	                 c3Dspr = csrrrn;
4756.0	50926	                 update s03;
4757.0	61108	               ENDIF;
4758.0	61108	             ENDIF;
4759.0	61108	           ENDIF;
4760.0	51013	
4761.0	51013	         // Contract Number
4762.0	60221	         When DspField = 'S2CONTID' and screen = 2;
4763.0	51013	           CallP promptContractNumber(wkContractNumber);
4764.0	51013	           GetContractDtaQData() ;
4765.0	260623	
4766.0	260623	         // Coupon Type
4767.0	260623	         when DspField = 'C2CPNTYP';
4768.0	260623	           wkTableName = tableCouponTypeCodes;
4769.0	260623	           wkTitleName = titleCouponTypeCodes;
4770.0	260623	           CallP promptCpnCodeTable(wkCouponType
4771.0	260623	                                 :wkTableName
4772.0	260623	                                   :wkTitleName);
4773.0	260623	           If wkCoupontype <> *Blanks;
4774.0	260623	             C2CPNTYP  = wkCouponType;
4775.0	260623	           Endif;
4776.0	260623	
4777.0	0	         Other;
4778.0	0	           // Field has no prompt info
4779.0	50527	           PutErrMsg (NoPromptMsg: MsgF: SdPgm: JobLang);
4780.0	0	         ENDSL;
4781.0	0	
4782.0	0	       On-Error 00211;
4783.0	50527	         PutErrMsg (NoPromptMsg: MsgF:SdPgm: JobLang);
4784.0	0	       On-Error 00202;
4785.0	50527	         PutErrMsg (PromptParmMsg: MsgF: SdPgm: JobLang);
4786.0	0	       On-Error;
4787.0	50527	         PutErrMsg (NoPromptMsg: MsgF: SdPgm: JobLang);
4788.0	0	       EndMon;
4789.0	0	
4790.0	0	       Return;
4791.0	0	
4792.0	0	      /END-FREE
4793.0	50825	     P DisplayPrompt   E
4794.0	50602	
4795.0	50602	
4796.0	50602	      // =======================================================================
4797.0	50602	      // Put Coupon
4798.0	50602	      // =======================================================================
4799.0	50602	      // Calls Middleware to write a coupon
4800.0	50602	      // =======================================================================
4801.0	51020	     P PutCouponMaster...
4802.0	51020	     P                 B
4803.0	51020	     D PutCouponMaster...
4804.0	51020	     D                 PI             1n
4805.0	50602	     D  PrOperator                         Like(Operator)
4806.0	50602	     D                                     const
4807.0	50808	     D  PrCouponMasterDS...
4808.0	50808	     D                                     LikeDS(CouponMasterDS)
4809.0	50808	     D                                     const
4810.0	91214	     D  PrRecOption                        like(RecOption)
4811.0	91214	     D                                     const
4812.0	50602	      // =======================================================================
4813.0	50602	      // - Variables -
4814.0	50602	      // =======================================================================
4815.0	91214	     D  wkRecOption...
4816.0	91214	     D                 S                   like(RecOption) inz
4817.0	50602	
4818.0	50602	      /free
4819.0	50602	        clear function;
4820.0	50602	        clear Oar_ptra;
4821.0	50915	        errorFound = FALSE;
4822.0	91214	        wkRecOption = prRecOption;
4823.0	50808	        wkReq#ofrows = 0;
4824.0	50808	        wkAct#ofrows = 0;
4825.0	50808	
4826.0	50808	        for x = 1 to %elem(CouponMasterDS);
4827.0	50808	          %occur(CouponMasterDS)= x;
4828.0	50808	          clear CouponMasterDS;
4829.0	50808	        endfor;
4830.0	50808	
4831.0	50809	        %occur(CouponMasterDS)= 1;
4832.0	50808	        CouponMasterDS = prCouponMasterDS;
4833.0	50602	
4834.0	50602	        operator = prOperator;
4835.0	50808	
4836.0	50808	        Function = cCPNMaster;
4837.0	50808	
4838.0	50808	        Oar_ptra = %addr(CouponMasterDS);
4839.0	50830	
4840.0	50915	        %Occur(ErrorMsgDS) = 1;
4841.0	50830	        MsgDtaPtr = %addr(ErrorMsgDS);
4842.0	50915	        clear *all ErrorMsgDS;
4843.0	50808	
4844.0	50602	        SwCallStatus = CouponMWInterface(
4845.0	50602	                       Operator:
4846.0	50602	                       Function:
4847.0	50602	                       OAR_PTRA:
4848.0	91214	                       wkRecOption:
4849.0	50608	                       wkReq#ofrows:
4850.0	50608	                       wkAct#ofrows:
4851.0	50830	                       MsgdtaPtr);
4852.0	50602	
4853.0	50915	
4854.0	61108	       IF ErrorMsgds <> *Blank;
4855.0	50915	         Return Error;
4856.0	50915	       else;
4857.0	50915	         Return SwCallStatus;
4858.0	61108	       ENDIF;
4859.0	50602	
4860.0	50602	      /end-free
4861.0	51020	     P PutCouponMaster...
4862.0	51020	     P                 E
4863.0	161228	
4864.0	161228	      // =======================================================================
4865.0	161228	      // Put Coupon Disclaimer Data
4866.0	161228	      // =======================================================================
4867.0	161228	      // Calls Middleware to write/update Coupon Disclaimer information
4868.0	161228	      // =======================================================================
4869.0	161228	     P CallPutCouponDisclaimer...
4870.0	161228	     P                 B
4871.0	161228	     D CallPutCouponDisclaimer...
4872.0	161228	     D                 PI             1n
4873.0	161228	
4874.0	161228	      // =======================================================================
4875.0	161228	      // - Variables -
4876.0	161228	      // =======================================================================
4877.0	161228	     D  wkCpnDisclaimerDS...
4878.0	161228	     D                 DS                  LikeDS(CpnDisclaimerDS)
4879.0	161228	
4880.0	260623	     D couponCount     S              5P 0 INZ(0)
4881.0	260623	     D dataChanged     S              1A   inz(FALSE)
4882.0	161228	      /free
4883.0	161228	
4884.0	161228	
4885.0	161228	
4886.0	161228	        if couponDisclaimerExists = True;          //Update if already existing
4887.0	161228	
4888.0	260623	              %occur(CpnDisclaimerDS) = 1;
4889.0	260623	                      dataChanged = FALSE;
4890.0	260623	
4891.0	260623	              if (C3SDSCFLG = YES and CpnDisclaimerDS.SNGDSCFLG <> YES);
4892.0	260623	
4893.0	260623	                       CpnDisclaimerDS.COUPONID = c2CpnId;
4894.0	260623	                       CpnDisclaimerDS.SNGDSCFLG = YES;
4895.0	260623	               dataChanged = TRUE;
4896.0	260623	              endif;
4897.0	260623	
4898.0	260623	              if (C3SDSCFLG <>  YES and CpnDisclaimerDS.SNGDSCFLG = YES);
4899.0	260623	                          CpnDisclaimerDS.COUPONID = c2CpnId;
4900.0	260623	                          CpnDisclaimerDS.SNGDSCFLG = NO;
4901.0	260623	                          dataChanged = TRUE;
4902.0	260623	              endif;
4903.0	161228	
4904.0	260623	                 if (C3EXCPSGN = YES and
4905.0	260623	               CpnDisclaimerDS.TPDSGNCODE <> TPDSGNEXCP);
4906.0	260623	                  CpnDisclaimerDS.TPDSGNCODE = TPDSGNEXCP;
4907.0	260623	                 dataChanged = TRUE;
4908.0	260623	                 endif;
4909.0	260623	
4910.0	260623	               if (C3EXCPSGN <> YES and
4911.0	260623	                      CpnDisclaimerDS.TPDSGNCODE = TPDSGNEXCP);
4912.0	260623	                   CpnDisclaimerDS.TPDSGNCODE = *blanks;
4913.0	260623	                          dataChanged = TRUE;
4914.0	260623	               endif;
4915.0	260623	
4916.0	260623	             if C2CPNTYP = PAPER and C3CmyNbr = CA_COMPANY;
4917.0	260623	                CpnDisclaimerDS.RNCKUPCNBR= C3RCKUPC;
4918.0	260623	                dataChanged = TRUE;
4919.0	260623	             else;
4920.0	260623	                CpnDisclaimerDS.RNCKUPCNBR= 0;
4921.0	260623	                dataChanged = TRUE;
4922.0	260623	             endif;
4923.0	260623	
4924.0	260623	              // Single point of update and return
4925.0	260623	              if dataChanged = TRUE;
4926.0	260623	                 wkCpnDisclaimerDS = CpnDisclaimerDS;
4927.0	260623	                 if PutCouponDisclaimer(CHANGE : wkCpnDisclaimerDS : ' ');
4928.0	260623	                    return True;
4929.0	260623	                 else;
4930.0	260623	                    return False;
4931.0	260623	                 endif;
4932.0	260623	              endif;
4933.0	260623	
4934.0	260623	        elseif enOpt = OptChg and dataChanged = False;   // in case of Coupons that do not have
4935.0	260623	                                                    // option to update Sign Disclaimer
4936.0	260623	
4937.0	260623	           wkAct#ofRows3c = getCouponDisclaimerFlag(c3CpnId);
4938.0	260623	           if wkAct#ofRows3c > 0;
4939.0	260623	              c3SDSCFLG  = CpnDisclaimerDS.sngdscflg;
4940.0	260623	           endif;
4941.0	260623	
4942.0	260623	           if (C3EXCPSGN = YES and
4943.0	260623	            CpnDisclaimerDS.TPDSGNCODE <> TPDSGNEXCP);
4944.0	260623	              CpnDisclaimerDS.TPDSGNCODE = TPDSGNEXCP;
4945.0	260623	              dataChanged = TRUE;
4946.0	260623	           endif;
4947.0	260623	
4948.0	260623	           if (C3EXCPSGN <> YES and
4949.0	260623	            CpnDisclaimerDS.TPDSGNCODE = TPDSGNEXCP);
4950.0	260623	              CpnDisclaimerDS.TPDSGNCODE = *blanks;
4951.0	260623	              dataChanged = TRUE;
4952.0	260623	           endif;
4953.0	260623	
4954.0	260623	             if C2CPNTYP = PAPER and C3CmyNbr = CA_COMPANY;
4955.0	260623	                CpnDisclaimerDS.RNCKUPCNBR= C3RCKUPC;
4956.0	260623	                dataChanged = TRUE;
4957.0	260623	             else;
4958.0	260623	                CpnDisclaimerDS.RNCKUPCNBR= 0;
4959.0	260623	                dataChanged = TRUE;
4960.0	260623	             endif;
4961.0	260623	
4962.0	260623	              // Single point of update and return
4963.0	260623	              if dataChanged = TRUE;
4964.0	260623	                 wkCpnDisclaimerDS = CpnDisclaimerDS;
4965.0	260623	                 if PutCouponDisclaimer(CHANGE : wkCpnDisclaimerDS : ' ');
4966.0	260623	                    return True;
4967.0	260623	                 else;
4968.0	260623	                    return False;
4969.0	260623	                 endif;
4970.0	260623	              endif;
4971.0	260623	
4972.0	161228	        else;                        //create if doesn't exist already
4973.0	161228	
4974.0	161228	          %occur(CpnDisclaimerDS) = 1;
4975.0	161228	
4976.0	170127	          //Create Coupon disclaimer flag as 'Y' or 'N'
4977.0	161228	             CpnDisclaimerDS.COUPONID  = c2CpnId;
4978.0	161228	             CpnDisclaimerDS.SNGDSCFLG = C3SDSCFLG;
4979.0	260623	
4980.0	260623	             if C3EXCPSGN = YES;
4981.0	260623	                CpnDisclaimerDS.TPDSGNCODE = TPDSGNEXCP;
4982.0	260623	             else;
4983.0	260623	                CpnDisclaimerDS.TPDSGNCODE = *blanks;
4984.0	260623	             endif;
4985.0	260623	             if C2CPNTYP = PAPER and C3CmyNbr = CA_COMPANY;
4986.0	260623	                CpnDisclaimerDS.RNCKUPCNBR= C3RCKUPC;
4987.0	260623	             else;
4988.0	260623	                CpnDisclaimerDS.RNCKUPCNBR= 0;
4989.0	260623	             endif;
4990.0	161228	
4991.0	161228	             wkCpnDisclaimerDS = CpnDisclaimerDS;
4992.0	161228	
4993.0	161228	             if PutCouponDisclaimer(AddMode:wkCpnDisclaimerDS:' ');
4994.0	161228	                return True;
4995.0	161228	             else;
4996.0	161228	               return false;
4997.0	161228	             endif;
4998.0	161228	
4999.0	161228	        endif;
5000.0	161228	
5001.0	161228	        return True;
5002.0	161228	
5003.0	161228	      /end-free
5004.0	161228	     P CallPutCouponDisclaimer...
5005.0	161228	     P                 E
5006.0	161228	
5007.0	161228	
5008.0	161228	      // =======================================================================
5009.0	161228	      // Put Coupon Disclaimer Data
5010.0	161228	      // =======================================================================
5011.0	161228	      // Calls Middleware to write/update Coupon Disclaimer information
5012.0	161228	      // =======================================================================
5013.0	161228	     P PutCouponDisclaimer...
5014.0	161228	     P                 B
5015.0	161228	     D PutCouponDisclaimer...
5016.0	161228	     D                 PI             1n
5017.0	161228	     D  PrOperator                         Like(Operator)
5018.0	161228	     D                                     const
5019.0	161228	     D  PrCpnDisclaimerDS...
5020.0	161228	     D                                     LikeDS(CpnDisclaimerDS)
5021.0	161228	     D                                     const
5022.0	161228	     D  PrRecOption                        like(RecOption)
5023.0	161228	     D                                     const
5024.0	161228	      // =======================================================================
5025.0	161228	      // - Variables -
5026.0	161228	      // =======================================================================
5027.0	161228	     D  wkRecOption...
5028.0	161228	     D                 S                   like(RecOption) inz
5029.0	161228	
5030.0	161228	      /free
5031.0	161228	
5032.0	161228	        clear function;
5033.0	161228	        clear Oar_ptra;
5034.0	161228	        errorFound = FALSE;
5035.0	161228	        wkRecOption = prRecOption;
5036.0	161228	        wkReq#ofrows = 0;
5037.0	161228	        wkAct#ofrows = 0;
5038.0	161228	
5039.0	161228	        for x = 1 to %elem(CpnDisclaimerDS);
5040.0	161228	          %occur(CpnDisclaimerDS) = x;
5041.0	161228	          clear CpnDisclaimerDS;
5042.0	161228	        endfor;
5043.0	161228	
5044.0	161228	        %occur(CpnDisclaimerDS) = 1;
5045.0	161228	        CpnDisclaimerDS = prCpnDisclaimerDS;
5046.0	161228	
5047.0	161228	        operator = prOperator;
5048.0	161228	
5049.0	161228	        Function = 'CPNDSCFLG';
5050.0	161228	
5051.0	161228	        Oar_ptra = %addr(CpnDisclaimerDS);
5052.0	161228	
5053.0	161228	        %Occur(ErrorMsgDS) = 1;
5054.0	161228	        MsgDtaPtr = %addr(ErrorMsgDS);
5055.0	161228	        clear *all ErrorMsgDS;
5056.0	161228	
5057.0	161228	        SwCallStatus = CouponMWInterface(
5058.0	161228	                       Operator:
5059.0	161228	                       Function:
5060.0	161228	                       OAR_PTRA:
5061.0	161228	                       wkRecOption:
5062.0	161228	                       wkReq#ofrows:
5063.0	161228	                       wkAct#ofrows:
5064.0	161228	                       MsgdtaPtr);
5065.0	161228	
5066.0	161228	
5067.0	161228	       IF ErrorMsgds <> *Blank;
5068.0	161228	         Return Error;
5069.0	161228	       else;
5070.0	161228	         Return SwCallStatus;
5071.0	161228	       ENDIF;
5072.0	161228	
5073.0	161228	      /end-free
5074.0	161228	     P PutCouponDisclaimer...
5075.0	161228	     P                 E
5076.0	170516	
5077.0	170516	      // =======================================================================
5078.0	170516	      // Put Coupon TPD Data
5079.0	170516	      // =======================================================================
5080.0	170516	      // Calls Middleware to write/update Coupon TPD information
5081.0	170516	      // =======================================================================
5082.0	170516	     P CallPutCouponTPD...
5083.0	170516	     P                 B
5084.0	170516	     D CallPutCouponTPD...
5085.0	170516	     D                 PI             1n
5086.0	170516	
5087.0	170516	      // =======================================================================
5088.0	170516	      // - Variables -
5089.0	170516	      // =======================================================================
5090.0	170516	     D  wkCpnTPDds...
5091.0	170516	     D                 DS                  LikeDS(CpnTPDDS)
5092.0	170516	
5093.0	170516	      /free
5094.0	170516	
5095.0	170516	
5096.0	170516	
5097.0	170516	        if CouponTPDExists = True;          //Update if already existing
5098.0	170516	
5099.0	170516	          select;
5100.0	170516	          when C3TPDFLG = 'Y'
5101.0	170516	          and  CpnTPDds.CPNTPDFLG <> 'Y';
5102.0	170516	             %occur(CpnTPDds) = 1;
5103.0	170516	
5104.0	170516	             //update coupon TPD flag as 'Y'
5105.0	170516	             CpnTPDds.COUPONID  = c2CpnId;
5106.0	170516	             CpnTPDds.CPNTPDFLG = 'Y';
5107.0	170516	
5108.0	170516	             wkCpnTPDds = CpnTPDds;
5109.0	170516	
5110.0	170516	             if PutCouponTPD(CHANGE:wkCpnTPDds:' ');
5111.0	170516	                return True;
5112.0	170516	             else;
5113.0	170516	               return false;
5114.0	170516	             endif;
5115.0	170516	          when C3TPDFLG <>  'Y'
5116.0	170516	          and  CpnTPDds.CPNTPDFLG = 'Y';
5117.0	170516	             %occur(CpnTPDds) = 1;
5118.0	170516	
5119.0	170516	             //update coupon TPD flag as 'N'
5120.0	170516	             CpnTPDds.COUPONID  = c2CpnId;
5121.0	170516	             CpnTPDds.CPNTPDFLG = 'N';
5122.0	170516	
5123.0	170516	             wkCpnTPDds = CpnTPDds;
5124.0	170516	
5125.0	170516	             if PutCouponTPD(CHANGE:wkCpnTPDds:' ');
5126.0	170516	                return True;
5127.0	170516	             else;
5128.0	170516	               return false;
5129.0	170516	             endif;
5130.0	170516	          other;
5131.0	170516	            //do nothing
5132.0	170516	          endsl;
5133.0	170516	
5134.0	170516	        else;                        //create if TPD doesn't exist already
5135.0	170516	
5136.0	170516	          %occur(CpnTPDds) = 1;
5137.0	170516	
5138.0	170516	          //Create TPD record when TPD flag is 'N'
5139.0	170516	          if C3TPDFLG = 'N';
5140.0	170516	             CpnTPDds.COUPONID  = c2CpnId;
5141.0	170516	             CpnTPDds.CPNTPDFLG = C3TPDFLG;
5142.0	170516	
5143.0	170516	             wkCpnTPDds = CpnTPDds;
5144.0	170516	
5145.0	170516	             if PutCouponTPD(AddMode:wkCpnTPDds:' ');
5146.0	170516	                return True;
5147.0	170516	             else;
5148.0	170516	               return false;
5149.0	170516	             endif;
5150.0	170516	          endif ;
5151.0	170516	
5152.0	170516	        endif;
5153.0	170516	
5154.0	170516	        return True;
5155.0	170516	
5156.0	170516	      /end-free
5157.0	170516	     P CallPutCouponTPD...
5158.0	170516	     P                 E
5159.0	170516	
5160.0	170516	
5161.0	170516	      // =======================================================================
5162.0	170516	      // Put Coupon TPD Data
5163.0	170516	      // =======================================================================
5164.0	170516	      // Calls Middleware to write/update Coupon TPD information
5165.0	170516	      // =======================================================================
5166.0	170516	     P PutCouponTPD...
5167.0	170516	     P                 B
5168.0	170516	     D PutCouponTPD...
5169.0	170516	     D                 PI             1n
5170.0	170516	     D  PrOperator                         Like(Operator)
5171.0	170516	     D                                     const
5172.0	170516	     D  PrCpnTPDds...
5173.0	170516	     D                                     LikeDS(CpnTPDds)
5174.0	170516	     D                                     const
5175.0	170516	     D  PrRecOption                        like(RecOption)
5176.0	170516	     D                                     const
5177.0	170516	      // =======================================================================
5178.0	170516	      // - Variables -
5179.0	170516	      // =======================================================================
5180.0	170516	     D  wkRecOption...
5181.0	170516	     D                 S                   like(RecOption) inz
5182.0	170516	
5183.0	170516	      /free
5184.0	170516	
5185.0	170516	        clear function;
5186.0	170516	        clear Oar_ptra;
5187.0	170516	        errorFound = FALSE;
5188.0	170516	        wkRecOption = prRecOption;
5189.0	170516	        wkReq#ofrows = 0;
5190.0	170516	        wkAct#ofrows = 0;
5191.0	170516	
5192.0	170516	        for x = 1 to %elem(CpnTPDds);
5193.0	170516	          %occur(CpnTPDds) = x;
5194.0	170516	          clear CpnTPDds;
5195.0	170516	        endfor;
5196.0	170516	
5197.0	170516	        %occur(CpnTPDds) = 1;
5198.0	170516	        CpnTPDds = prCpnTPDds;
5199.0	170516	
5200.0	170516	        operator = prOperator;
5201.0	170516	
5202.0	170516	        Function = 'CPNTPDFLG';
5203.0	170516	
5204.0	170516	        Oar_ptra = %addr(CpnTPDds);
5205.0	170516	
5206.0	170516	        %Occur(ErrorMsgDS) = 1;
5207.0	170516	        MsgDtaPtr = %addr(ErrorMsgDS);
5208.0	170516	        clear *all ErrorMsgDS;
5209.0	170516	
5210.0	170516	        SwCallStatus = CouponMWInterface(
5211.0	170516	                       Operator:
5212.0	170516	                       Function:
5213.0	170516	                       OAR_PTRA:
5214.0	170516	                       wkRecOption:
5215.0	170516	                       wkReq#ofrows:
5216.0	170516	                       wkAct#ofrows:
5217.0	170516	                       MsgdtaPtr);
5218.0	170516	
5219.0	170516	
5220.0	170516	       IF ErrorMsgds <> *Blank;
5221.0	170516	         Return Error;
5222.0	170516	       else;
5223.0	170516	         Return SwCallStatus;
5224.0	170516	       ENDIF;
5225.0	170516	
5226.0	170516	      /end-free
5227.0	170516	     P PutCouponTPD...
5228.0	170516	     P                 E
5229.0	50602	
5230.0	50602	
5231.0	50602	      // =======================================================================
5232.0	50602	      // Load Default Coupon Data
5233.0	50602	      // =======================================================================
5234.0	50602	     P LoadDftCpnData  B
5235.0	50602	
5236.0	50602	      /free
5237.0	50808	
5238.0	50808	        clear CpnMasterDS;
5239.0	50808	
5240.0	50808	        cpnMasterDS
5241.0	50808	          .AllowRandomValueIndicator  = No;
5242.0	50808	        cpnMasterDS
5243.0	50808	          .MinimumPurchaseCount       = 1;
5244.0	50808	        cpnMasterDS
5245.0	50808	          .PromptPriceInd             = No;
5246.0	50808	        cpnMasterDS
5247.0	50808	          .AllowSoftWeekIndicator     = No;
5248.0	50916	        cpnMasterDS
5249.0	51027	          .StatusCode                 = cActive;
5250.0	50602	
5251.0	50602	      /end-free
5252.0	50602	
5253.0	50607	     P LoadDftCpnData  E
5254.0	50602	
5255.0	50602	
5256.0	50602	      // =======================================================================
5257.0	51125	      // Prepare Coupon Data
5258.0	50602	      // =======================================================================
5259.0	50602	     P PrepCpnData     B
5260.0	50602	
5261.0	50602	      /free
5262.0	50808	
5263.0	50808	        clear CpnMasterDS;
5264.0	50602	
5265.0	51027	        cpnMasterDS.StatusCode             = cActive;
5266.0	50810	        cpnMasterDS.CouponID               = c2CpnId;
5267.0	51117	        cpnMasterDS.CompanyNumber          = c3Cmynbr;
5268.0	50810	        cpnMasterDS.longdescription        = c3Cpndes1 + c3CpnDes2;
5269.0	50810	        cpnMasterDS.registerDescription    = c3RDes;
5270.0	51117	        cpnMasterDS.posDepartmentNumber    = c3POSDEPT;
5271.0	50810	        cpnMasterDS.minimumPurchaseCount   = c3MinCnt;
5272.0	50810	        cpnMasterDS.posFamilyCode          = c3POSFmCd;
5273.0	50810	        cpnMasterDS.getFreeCount           = c3FreeCnt;
5274.0	50810	        cpnMasterDS.promptPriceInd         = c3PPFLG;
5275.0	50811	        cpnMasterDS.MarginDistributionCode = c3MrgnDstc;
5276.0	50810	        cpnMasterDS.maximumPurchaseCount   = c3MaxCnt;
5277.0	50810	        cpnMasterDS.allowSoftWeekIndicator = c3SoftWkIn;
5278.0	50811	        cpnMasterDS.RedemptionType         = c3RdmpTnTy;
5279.0	50811	        cpnMasterDS.upcNumber              = c3UPCNbr;
5280.0	90130	
5281.0	50811	        cpnMasterDS.CouponTaxCode          = c3CpnTaxC;
5282.0	260623	        cpnMasterDS
5283.0	260623	          .AllowRandomValueIndicator       = c3execcpn;
5284.0	50810	
5285.0	50602	      /end-free
5286.0	50602	
5287.0	50602	     P PrepCpnData     E
5288.0	50606	
5289.0	50606	      // =======================================================================
5290.0	50606	      // Put Coupon-Coupon Contract Association
5291.0	50606	      // =======================================================================
5292.0	50606	      // Calls Middleware to write a Coupon-Coupon Contract Association
5293.0	50606	      // =======================================================================
5294.0	50804	     P PutCouponContractAssoc...
5295.0	50804	     P                 B
5296.0	50804	     D PutCouponContractAssoc...
5297.0	50804	     D                 PI             1n
5298.0	50606	     D  PrOperator                         Like(Operator)
5299.0	50606	     D                                     const
5300.0	51025	     D  PrRecOption                        Like(RecOption)
5301.0	51025	     D                                     const
5302.0	50813	     D  PrCpnCntAscDS                      LikeDS(CouponContracAsscDS)
5303.0	50813	     D                                     const
5304.0	50606	      // =======================================================================
5305.0	50606	      // - Variables -
5306.0	50606	      // =======================================================================
5307.0	51025	     D  RecOption      S             10A   Inz
5308.0	51025	
5309.0	50606	      /free
5310.0	50606	        clear function;
5311.0	50606	        clear Oar_ptra;
5312.0	50915	        errorFound = FALSE;
5313.0	50808	        wkReq#ofrows = 0;
5314.0	50808	        wkAct#ofrows = 0;
5315.0	51025	        RecOption = PrRecoption;
5316.0	51025	        Operator = prOperator;
5317.0	50810	        Function  = 'CPNCONTASC';
5318.0	80815	
5319.0	50813	        for x = 1 to %elem(CouponContracAsscDS);
5320.0	50813	          %occur(CouponContracAsscDS) = x;
5321.0	50813	          clear CouponContracAsscDS;
5322.0	50808	        endfor;
5323.0	80815	
5324.0	50813	        %occur(CouponContracAsscDS) = 1;
5325.0	80815	
5326.0	50813	        CouponContracAsscDS = prCpnCntAscDS;
5327.0	80827	        CouponContracAsscDS.swAdd = False;
5328.0	50808	
5329.0	50813	        Oar_ptra = %addr(CouponContracAsscDS);
5330.0	50830	
5331.0	51025	        clear *all ErrorMsgDS;
5332.0	50914	        %Occur(ErrorMsgDS) = 1;
5333.0	50830	        MsgDtaPtr = %addr(ErrorMsgDS);
5334.0	50808	
5335.0	50606	        SwCallStatus = CouponMWInterface(
5336.0	50606	                       Operator:
5337.0	50606	                       Function:
5338.0	50606	                       OAR_PTRA:
5339.0	51025	                       RecOption:
5340.0	50608	                       wkReq#ofrows:
5341.0	50608	                       wkAct#ofrows:
5342.0	50830	                       MsgdtaPtr);
5343.0	50606	
5344.0	50914	       Return SwCallStatus;
5345.0	50606	
5346.0	50606	      /end-free
5347.0	50804	     P PutCouponContractAssoc...
5348.0	50804	     P                 E
5349.0	50914	
5350.0	50914	
5351.0	50914	      // =======================================================================
5352.0	50914	      // Check Business Rules for Coupon Contract Association
5353.0	50914	      // =======================================================================
5354.0	50914	      // Calls Middleware to write a Coupon-Coupon Contract Association
5355.0	50914	      // =======================================================================
5356.0	50914	     P CheckCouponContractAssoc...
5357.0	50914	     P                 B
5358.0	50914	     D CheckCouponContractAssoc...
5359.0	50914	     D                 PI             1n
5360.0	50914	     D  PrOperator                         Like(Operator)
5361.0	50914	     D                                     const
5362.0	50914	     D  PrCpnCntAscDS                      LikeDS(CouponContracAsscDS)
5363.0	50914	     D                                     const
5364.0	50914	      // =======================================================================
5365.0	50914	      // - Variables -
5366.0	50914	      // =======================================================================
5367.0	50914	      /free
5368.0	50914	        clear function;
5369.0	50914	        clear Oar_ptra;
5370.0	50915	        errorFound = FALSE;
5371.0	50914	        wkReq#ofrows = 0;
5372.0	50914	        wkAct#ofrows = 0;
5373.0	50914	        prRecOption = cApplyBR;
5374.0	50914	
5375.0	50914	        operator = prOperator;
5376.0	50914	
5377.0	50914	        Function  = 'CPNCONTASC';
5378.0	50914	
5379.0	50914	        for x = 1 to %elem(CouponContracAsscDS);
5380.0	50914	          %occur(CouponContracAsscDS) = x;
5381.0	50914	          clear CouponContracAsscDS;
5382.0	50914	        endfor;
5383.0	50914	
5384.0	50914	        %occur(CouponContracAsscDS) = 1;
5385.0	50914	        CouponContracAsscDS = prCpnCntAscDS;
5386.0	50914	
5387.0	50914	        Oar_ptra = %addr(CouponContracAsscDS);
5388.0	50914	
5389.0	51107	        %Occur(ErrorMsgDS) = 1;
5390.0	51107	        MsgDtaPtr = %addr(ErrorMsgDS);
5391.0	51107	        clear *all ErrorMsgDS;
5392.0	50914	
5393.0	50914	        SwCallStatus = CouponMWInterface(
5394.0	50914	                       Operator:
5395.0	50914	                       Function:
5396.0	50914	                       OAR_PTRA:
5397.0	50914	                       PrRecOption:
5398.0	50914	                       wkReq#ofrows:
5399.0	50914	                       wkAct#ofrows:
5400.0	50914	                       MsgdtaPtr);
5401.0	50914	
5402.0	61108	       IF ErrorMsgds <> *Blank;
5403.0	50915	         Return Error;
5404.0	50915	       else;
5405.0	50915	         Return Success;
5406.0	61108	       ENDIF;
5407.0	50914	
5408.0	50914	      /end-free
5409.0	50914	     P CheckCouponContractAssoc...
5410.0	50914	     P                 E
5411.0	50606	
5412.0	50606	
5413.0	50606	      // =======================================================================
5414.0	50606	      // Put Coupon-Item Association
5415.0	50606	      // =======================================================================
5416.0	50606	      // Calls Middleware to write a Coupon-Item Association
5417.0	50606	      // =======================================================================
5418.0	50803	     P PutCouponItemAssoc...
5419.0	50803	     P                 B
5420.0	50803	     D PutCouponItemAssoc...
5421.0	50803	     D                 PI             1n
5422.0	50606	     D  PrOperator                         Like(Operator)
5423.0	50606	     D                                     const
5424.0	50811	     D  PrCouponItmAscDS...
5425.0	50811	     D                                     LikeDS(CouponItmAscDS)
5426.0	50811	     D                                     const
5427.0	50606	      // =======================================================================
5428.0	50606	      // - Variables -
5429.0	50606	      // =======================================================================
5430.0	50606	
5431.0	50606	      /free
5432.0	50606	        clear function;
5433.0	50606	        clear Oar_ptra;
5434.0	51013	        clear *all ErrorMsgDS;
5435.0	50914	        PrRecOption = *blanks;
5436.0	50808	        wkReq#ofrows = 0;
5437.0	50808	        wkAct#ofrows = 0;
5438.0	50606	
5439.0	50606	        operator = prOperator;
5440.0	50808	
5441.0	50811	        Function = cCpnItmAscW;
5442.0	50811	
5443.0	50811	        for x = 1 to %elem(CouponItmAscDS);
5444.0	50811	          %occur(CouponItmAscDS) = x;
5445.0	50811	          clear CouponItmAscDS;
5446.0	50811	        endfor;
5447.0	50811	
5448.0	50811	        %occur(CouponItmAscDS) = 1;
5449.0	50811	        CouponItmAscDS = prCouponItmAscDS;
5450.0	50808	
5451.0	50811	        Oar_ptra = %addr(CouponItmAscDS);
5452.0	50830	
5453.0	50830	        MsgDtaPtr = %addr(ErrorMsgDS);
5454.0	50808	
5455.0	50606	        SwCallStatus = CouponMWInterface(
5456.0	50606	                       Operator:
5457.0	50606	                       Function:
5458.0	50606	                       OAR_PTRA:
5459.0	50914	                       PrRecOption:
5460.0	50608	                       wkReq#ofrows:
5461.0	50608	                       wkAct#ofrows:
5462.0	50830	                       MsgdtaPtr);
5463.0	50606	
5464.0	50812	       Return SwCallStatus;
5465.0	50606	
5466.0	50606	      /end-free
5467.0	50803	     P PutCouponItemAssoc...
5468.0	50803	     P                 E
5469.0	51103	
5470.0	100309	
5471.0	100309	      // =======================================================================
5472.0	100309	      // Put Coupon-Item Association Auto
5473.0	100309	      // =======================================================================
5474.0	100309	      // Calls Middleware to write a Coupon-Item Association
5475.0	100309	      // =======================================================================
5476.0	100309	     P PutCouponItemAssocAuto...
5477.0	100309	     P                 B
5478.0	100309	     D PutCouponItemAssocAuto...
5479.0	100309	     D                 PI
5480.0	100309	      // =======================================================================
5481.0	100309	      // - Variables -
5482.0	100309	      // =======================================================================
5483.0	100309	
5484.0	100309	      /free
5485.0	100309	        clear function;
5486.0	100309	        clear Oar_ptra;
5487.0	100309	        clear *all ErrorMsgDS;
5488.0	100309	        PrRecOption = *blanks;
5489.0	100309	        wkReq#ofrows = 0;
5490.0	100309	        wkAct#ofrows = 0;
5491.0	100309	
5492.0	100309	        operator = 'ADD';
5493.0	100309	
5494.0	100309	        Function = 'ALLCPNITEM';
5495.0	100309	
5496.0	100309	        for x = 1 to %elem(CouponItmAscDS);
5497.0	100309	          %occur(CouponItmAscDS) = x;
5498.0	100309	          clear CouponItmAscDS;
5499.0	100309	        endfor;
5500.0	100309	
5501.0	100309	        %occur(CouponItmAscDS) = 1;
5502.0	100309	        CouponItmAscDS.couponID = c3CpnId;
5503.0	100309	
5504.0	100309	        Oar_ptra = %addr(CouponItmAscDS);
5505.0	100309	
5506.0	100309	        MsgDtaPtr = %addr(ErrorMsgDS);
5507.0	100309	
5508.0	100309	        SwCallStatus = CouponMWInterface(
5509.0	100309	                       Operator:
5510.0	100309	                       Function:
5511.0	100309	                       OAR_PTRA:
5512.0	100309	                       PrRecOption:
5513.0	100309	                       wkReq#ofrows:
5514.0	100309	                       wkAct#ofrows:
5515.0	100309	                       MsgdtaPtr);
5516.0	100309	
5517.0	100309	       Return;
5518.0	100309	
5519.0	100309	      /end-free
5520.0	100309	     P PutCouponItemAssocAuto...
5521.0	100309	     P                 E
5522.0	51103	
5523.0	51103	      // =======================================================================
5524.0	51103	      // Put POS Maintenance Data
5525.0	51103	      // =======================================================================
5526.0	51103	     P PutPOSMaintenance...
5527.0	51103	     P                 B
5528.0	51103	     D PutPOSMaintenance...
5529.0	51103	     D                 PI             1n
5530.0	51103	     D  PrOperator                         Like(Operator)
5531.0	51103	     D                                     const
5532.0	51103	     D  PrCouponPOSReqDS...
5533.0	51103	     D                                     LikeDS(CouponPOSReqDS)
5534.0	51103	     D                                     const
5535.0	51103	      // =======================================================================
5536.0	51103	      // - Variables -
5537.0	51103	      // =======================================================================
5538.0	51103	
5539.0	51103	      /free
5540.0	51103	
5541.0	51103	        clear function;
5542.0	51103	        clear Oar_ptra;
5543.0	51103	        errorFound = FALSE;
5544.0	51103	        PrRecOption = *blanks;
5545.0	51103	        wkReq#ofrows = 0;
5546.0	51103	        wkAct#ofrows = 0;
5547.0	51103	
5548.0	51103	        for x = 1 to %elem(CouponPOSReqDS);
5549.0	51103	          %occur(CouponPOSReqDS)= x;
5550.0	51103	          clear CouponPOSReqDS;
5551.0	51103	        endfor;
5552.0	51103	
5553.0	51103	        %occur(CouponPOSReqDS)= 1;
5554.0	51103	        CouponPOSReqDS = prCouponPOSReqDS;
5555.0	51103	
5556.0	51103	        operator = prOperator;
5557.0	51103	
5558.0	51103	        Function = cPOSMaint;
5559.0	51103	
5560.0	51103	        Oar_ptra = %addr(CouponPOSReqDS);
5561.0	51103	
5562.0	51103	        %Occur(ErrorMsgDS) = 1;
5563.0	51103	        MsgDtaPtr = %addr(ErrorMsgDS);
5564.0	51103	        clear *all ErrorMsgDS;
5565.0	51103	
5566.0	51103	        SwCallStatus = CouponMWInterface(
5567.0	51103	                       Operator:
5568.0	51103	                       Function:
5569.0	51103	                       OAR_PTRA:
5570.0	51103	                       PrRecOption:
5571.0	51103	                       wkReq#ofrows:
5572.0	51103	                       wkAct#ofrows:
5573.0	51103	                       MsgdtaPtr);
5574.0	51103	
5575.0	51103	
5576.0	61108	       IF ErrorMsgds <> *Blank;
5577.0	51103	         Return Error;
5578.0	51103	       else;
5579.0	51103	         Return SwCallStatus;
5580.0	61108	       ENDIF;
5581.0	51103	
5582.0	51103	      /end-free
5583.0	51103	     P PutPOSMaintenance...
5584.0	51103	     p                 E
5585.0	50602	
5586.0	50602	
5587.0	50602	      // =======================================================================
5588.0	50804	      // Commit Table Changes
5589.0	50602	      // =======================================================================
5590.0	50804	     P CommitChanges...
5591.0	50602	     P                 B
5592.0	50804	     D CommitChanges...
5593.0	50804	     D                 PI             1n
5594.0	50602	      // =======================================================================
5595.0	50602	      // - Variables -
5596.0	50602	      // =======================================================================
5597.0	50602	      /free
5598.0	50602	
5599.0	50602	       clear Oar_ptra;
5600.0	50602	
5601.0	50804	       Operator  = *Blanks;
5602.0	80916	       Function  = COMMIT;
5603.0	50602	       clear Oar_ptra;
5604.0	51018	       clear *all ErrorMsgDS;
5605.0	50830	
5606.0	50830	       MsgDtaPtr = %addr(ErrorMsgDS);
5607.0	50804	
5608.0	50804	       SwCallStatus = CouponMWInterface(
5609.0	50602	                       Operator:
5610.0	50602	                       Function:
5611.0	50602	                       Oar_Ptra:
5612.0	50914	                       PrRecOption:
5613.0	50608	                       wkReq#ofrows:
5614.0	50608	                       wkAct#ofrows:
5615.0	50830	                       MsgdtaPtr);
5616.0	50602	
5617.0	50602	        return TRUE;
5618.0	50602	      /end-free
5619.0	50602	
5620.0	50804	     P CommitChanges...
5621.0	50602	     P                 E
5622.0	50606	
5623.0	50606	      // =======================================================================
5624.0	50701	      // Get Contract Item Association
5625.0	50606	      // =======================================================================
5626.0	50803	     P GetContractItemAssoc...
5627.0	50803	     P                 B
5628.0	50803	     D GetContractItemAssoc...
5629.0	50803	     D                 PI                  Like(wkAct#ofrows)
5630.0	50808	     D  PrCpnId                            Like(wkCpnId) const
5631.0	50606	      // =======================================================================
5632.0	50606	      // - Variables -
5633.0	50606	      // =======================================================================
5634.0	50608	     D  WkRows         S                   Like(wkAct#ofrows)
5635.0	50606	
5636.0	50606	      /free
5637.0	50606	
5638.0	50606	       // Pick up the coupon contract being changed.
5639.0	50606	        clear function;
5640.0	50606	        clear Oar_ptra;
5641.0	50914	        PrRecOption = *blanks;
5642.0	50809	        wkRows = 0;
5643.0	51018	        clear *all ErrorMsgDS;
5644.0	50809	
5645.0	50808	        Function = cCntItmAsc;
5646.0	50809	
5647.0	50701	        wkReq#ofrows = cReqRowsCntItmAsc;
5648.0	50830	
5649.0	50830	        MsgDtaPtr = %addr(ErrorMsgDS);
5650.0	50809	
5651.0	50606	        SwCallStatus = CouponMWInterface(
5652.0	50606	                       Operator:
5653.0	50606	                       Function:
5654.0	50606	                       OAR_PTRA:
5655.0	50914	                       PrRecOption:
5656.0	50608	                       wkReq#ofrows:
5657.0	50701	                       wkRows:
5658.0	50830	                       MsgdtaPtr);
5659.0	50606	
5660.0	50701	        return wkRows;
5661.0	50701	
5662.0	50606	      /end-free
5663.0	50803	     P GetContractItemAssoc...
5664.0	50803	     P                 E
5665.0	50701	
5666.0	80916	      // =======================================================================
5667.0	80916	      // Display Contract
5668.0	80916	      // =======================================================================
5669.0	80916	     P DisplayContract...
5670.0	80916	     P                 B
5671.0	80916	     D DisplayContract...
5672.0	80916	     D                 PI
5673.0	80916	     D pContractID                   10I 0
5674.0	80916	     D pOpt                          10a    value
5675.0	80916	
5676.0	80916	     D pSqlFilterDS    DS                   LikeDS(SQLFilter)
5677.0	80916	     D pSqlSortDS      Ds                   likeDS(SQLSort)
5678.0	80916	      // =======================================================================
5679.0	80916	      // - Variables -
5680.0	80916	      // =======================================================================
5681.0	80916	
5682.0	80916	        // Local variables
5683.0	80916	     D pDesc           S             40a
5684.0	80916	     D pType           S              5A
5685.0	80916	     D pStartDate      S               d
5686.0	80916	     D pEndDate        S               d
5687.0	80916	     D pCompany        S              3p 0
5688.0	80916	     D currentStatus   S             20a
5689.0	80916	     D rtKeyPressed    S                   like(typeFunctionKey)
5690.0	80916	
5691.0	80916	     D cDisplay        C                   'DISPLAY   '
5692.0	80916	     D cErrorType      C                   'E'
5693.0	80916	      /free
5694.0	80916	        // redo read contract at display contract
5695.0	80916	
5696.0	80916	       Clear pSQLFilterDS;
5697.0	80916	       pSqlFilterDS.Filter = cDefault;
5698.0	80916	       pSQLFilterDS.Value(1) = %Char(pcontractID);
5699.0	80916	
5700.0	80916	       currentStatus = pOpt;
5701.0	80916	
5702.0	80916	       // If not display then assume re-active or delete
5703.0	80916	       If pOpt = cDisplay;
5704.0	80916	         GetContract(cGetOneContractHeader
5705.0	80916	                    :EQUAL
5706.0	80916	                    :1
5707.0	80916	                    :*omit
5708.0	80916	                    :pSQLFilterDS
5709.0	80916	                    :*omit);
5710.0	80916	       else;
5711.0	80916	          GetContract(cSetContractHeader
5712.0	80916	           :cLock
5713.0	80916	           :1
5714.0	80916	           :currentStatus
5715.0	80916	           :pSQLFilterDS
5716.0	80916	           :*omit);
5717.0	80916	       endif;
5718.0	80916	
5719.0	80916	       Select;
5720.0	80916	       When GeneralResponseXMLDS.STATUS = 'MWM0010   ';
5721.0	80916	         wkMsgDta = 'Contract';
5722.0	80916	         %Subst(wkMsgDta: 31: 10) = %Char(pcontractID);
5723.0	80916	         putErrMsg (CONTRACTINUSE : MsgF : SDPgm :
5724.0	80916	                JobLang : wkMsgDta);
5725.0	80916	       When GeneralResponseXMLDS.STATUS <> '       ';
5726.0	80916	         x = 1;
5727.0	80916	         dow generalResponseXMLDS.sqlErrorMsg(x).field <> *blanks;
5728.0	80916	            if generalResponseXMLDS.sqlErrorMsg(x).messageType  = cErrorType;
5729.0	80916	               putErrMsg(
5730.0	80916	                 generalResponseXMLDS.SQLErrorMsg(x).ID
5731.0	80916	                 : wkMsgDta
5732.0	80916	                 : sdPgm
5733.0	80916	                 : JobLang
5734.0	80916	                 : generalResponseXMLDS.SQLErrorMsg(x).message);
5735.0	80916	               //setCursorPosition(GeneralResponseXMLDS.SQLErrorMsg(x).Field);
5736.0	80916	               errorFound = True;
5737.0	80916	            endif;
5738.0	80916	            x += 1;
5739.0	80916	         enddo;
5740.0	80916	
5741.0	80916	         if not errorFound;
5742.0	80916	            wkMsgDta = GetContractheaderRsp.Status;
5743.0	80916	            putErrMsg (PrcsError : MsgF : SDPgm :
5744.0	80916	                       JobLang : wkMsgDta);
5745.0	80916	         endif;
5746.0	80916	
5747.0	80916	       When GetContractHeaderRsp.NumberReturned > 0;
5748.0	80916	
5749.0	80916	       pDesc = GetContractHeaderRsp.
5750.0	80916	               ContractHdrRsp(1).Desc;
5751.0	80916	       pType = GetContractHeaderRsp.
5752.0	80916	               ContractHdrRsp(1).Type;
5753.0	80916	       pStartDate
5754.0	80916	             = GetContractHeaderRsp.
5755.0	80916	               ContractHdrRsp(1).StartDate;
5756.0	80916	       pEndDate
5757.0	80916	             = GetContractHeaderRsp.
5758.0	80916	               ContractHdrRsp(1).EndDate;
5759.0	80916	       pCompany
5760.0	80916	             = %Dec(GetContractHeaderRsp.
5761.0	80916	               ContractHdrRsp(1).CompanyNumber:3:0);
5762.0	80916	
5763.0	80916	       callp DspCpnContract (RtKeyPressed
5764.0	80916	                            :pOpt
5765.0	80916	                            :pContractId
5766.0	80916	                            :pDesc
5767.0	80916	                            :pType
5768.0	80916	                            :PStartDate
5769.0	80916	                            :PEndDate
5770.0	80916	                            :pCompany);
5771.0	80916	          keyPressed = RtKeyPressed;
5772.0	80916	       endsl;
5773.0	80916	
5774.0	80916	       return;
5775.0	80916	      /end-free
5776.0	80916	     P DisplayContract...
5777.0	80916	     P                 E
5778.0	80916	
5779.0	80916	      // =======================================================================
5780.0	80916	      // GetContract:
5781.0	80916	      // =======================================================================
5782.0	80916	      // This procedure is used to get Contract Header Data.
5783.0	80916	      // =======================================================================
5784.0	80916	     P GetContract     B
5785.0	80916	     D GetContract     PI            10I 0
5786.0	80916	     D  pFunction                    20a   value
5787.0	80916	     D  pOperator                    20a   value
5788.0	80916	     D  pNumberRequested...
5789.0	80916	     D                               10I 0 value
5790.0	80916	     D  pRecOption                   20a   Options(*nopass:*omit)
5791.0	80916	     D  pSQLFilter                         LikeDS(SQLFilter)
5792.0	80916	     D                                     Options(*nopass:*omit)
5793.0	80916	     D  pSqlSortDS                         LikeDs(SQLSort)
5794.0	80916	     D                                     Options(*nopass:*omit)
5795.0	80916	
5796.0	80916	      // =======================================================================
5797.0	80916	      // - Variables -
5798.0	80916	      // =======================================================================
5799.0	80916	     D  WkRows         S                   Like(Wkact#ofrows)
5800.0	80916	     D  PrSort         S             20a
5801.0	80916	     D  PrFilter       S             20a
5802.0	80916	     D  ResponseString...
5803.0	80916	     D                 s          32767a
5804.0	80916	     D  XmlOpt         s            100a
5805.0	80916	     D  WkReturn       s             10I 0
5806.0	80916	
5807.0	80916	      /free
5808.0	80916	
5809.0	80916	       Reset GeneralResponseXMLDS;
5810.0	80916	       Reset GeneralRequestXMLDS;
5811.0	80916	       Reset GetContractHeaderRsp;
5812.0	80916	       GeneralRequestXMLDS.Function = pFunction;
5813.0	80916	       GeneralRequestXMLDS.Operator = pOperator;
5814.0	80916	       GeneralRequestXMLDS.NumberRequested = pNumberRequested;
5815.0	80916	
5816.0	80916	       if %parms() >  3;
5817.0	80916	          if %addr(pRecOption) <> *null;
5818.0	80916	             GeneralRequestXMLDS.recOption = pRecOption;
5819.0	80916	           endif;
5820.0	80916	       endif;
5821.0	80916	
5822.0	80916	       If %Parms() >  3;
5823.0	80916	           If %Addr(pSQLFilter) <> *null;
5824.0	80916	               GeneralRequestXMLDS.SQLFilter = pSqlFilter;
5825.0	80916	           ENDIF;
5826.0	80916	           If %Addr(pSQLSortDS) <> *null;
5827.0	80916	               GeneralRequestXMLDS.SQLSort = pSQLSortDS;
5828.0	80916	           ENDIF;
5829.0	80916	       ENDIF;
5830.0	80916	
5831.0	80916	       GetContractInterface(GeneralRequestXMLDS
5832.0	80916	                        :ResponseString);
5833.0	80916	
5834.0	80916	       XmlOpt =  'case=any allowmissing=yes allowextra=yes';
5835.0	80916	
5836.0	80916	       If GeneralRequestXMLDS.Operator <> *blanks;
5837.0	80916	          monitor;
5838.0	80916	             XML-Into GetContractHeaderRsp
5839.0	80916	                %Xml(ResponseString:XmlOpt);
5840.0	80916	             WkReturn = GetContractHeaderRsp.NumberReturned;
5841.0	80916	          on-error;
5842.0	80916	             XML-Into GeneralResponseXMLDS
5843.0	80916	               %xml(ResponseString:XMLOpt);
5844.0	80916	             WkReturn = 0;
5845.0	80916	          endmon;
5846.0	80916	
5847.0	80916	       else;
5848.0	80916	         XML-Into GeneralResponseXMLDS
5849.0	80916	           %xml(ResponseString:XMLOpt);
5850.0	80916	           WkReturn = 0;
5851.0	80916	        endif;
5852.0	80916	
5853.0	80916	       return WkReturn;
5854.0	80916	      /end-free
5855.0	80916	     P GetContract     E
5856.0	50701	
5857.0	50701	      // =======================================================================
5858.0	50701	      // Get Coupon-Coupon Contract Association
5859.0	50701	      // =======================================================================
5860.0	51014	     P GetCouponContract...
5861.0	50701	     P                 B
5862.0	51014	     D GetCouponContract...
5863.0	50701	     D                 PI                  Like(wkAct#ofrows)
5864.0	50808	     D  PrCpnId                            Like(wkCpnId)  const
5865.0	50811	     D  PrOperator                         Like(Operator) const
5866.0	50701	      // =======================================================================
5867.0	50701	      // - Variables -
5868.0	50701	      // =======================================================================
5869.0	50701	
5870.0	50701	      /free
5871.0	50701	
5872.0	50701	       // Pick up the coupon contract being changed.
5873.0	50701	        clear function;
5874.0	50701	        clear Oar_ptra;
5875.0	50914	        PrRecOption = *blanks;
5876.0	50809	        wkAct#ofRows = 0;
5877.0	51018	        clear *all ErrorMsgDS;
5878.0	50808	
5879.0	50809	        for x = 1 to %elem(CouponContractDS);
5880.0	50809	          %occur(CouponContractDS) = x;
5881.0	50809	          clear CouponContractDS;
5882.0	50808	        endfor;
5883.0	50808	
5884.0	50809	        %occur(CouponContractDS) = 1;
5885.0	50809	        CouponContractDS.CouponId   = prCpnID;
5886.0	50808	
5887.0	50811	        Operator = prOperator;
5888.0	50808	
5889.0	50809	        Function = 'CPNCONT';
5890.0	50808	
5891.0	51019	        wkReq#ofrows = 10;
5892.0	50808	
5893.0	50809	        Oar_ptra = %addr(CouponContractDS);
5894.0	50830	
5895.0	50830	        MsgDtaPtr = %addr(ErrorMsgDS);
5896.0	50808	
5897.0	50701	        SwCallStatus = CouponMWInterface(
5898.0	50701	                       Operator:
5899.0	50701	                       Function:
5900.0	50701	                       OAR_PTRA:
5901.0	50914	                       PrRecOption:
5902.0	50701	                       wkReq#ofrows:
5903.0	50809	                       wkAct#ofRows:
5904.0	50830	                       MsgdtaPtr);
5905.0	50701	
5906.0	50809	        return wkAct#ofRows;
5907.0	50701	
5908.0	50701	      /end-free
5909.0	51014	     P GetCouponContract...
5910.0	50701	     P                 E
5911.0	50811	
5912.0	50811	
5913.0	50811	      // =======================================================================
5914.0	50811	      // Get Coupon-Item Association
5915.0	50811	      // =======================================================================
5916.0	50811	     P GetCouponItemAssoc...
5917.0	50811	     P                 B
5918.0	50811	     D GetCouponItemAssoc...
5919.0	50811	     D                 PI                  Like(wkAct#ofrows)
5920.0	50811	     D  PrCpnId                            Like(wkCpnId)  const
5921.0	50811	     D  PrOperator                         Like(Operator) const
5922.0	50811	      // =======================================================================
5923.0	50811	      // - Variables -
5924.0	50811	      // =======================================================================
5925.0	50811	
5926.0	50811	      /free
5927.0	50811	
5928.0	50811	       // Pick up the coupon contract being changed.
5929.0	50811	        clear function;
5930.0	50811	        clear Oar_ptra;
5931.0	50914	        PrRecOption = *blanks;
5932.0	51018	        wkAct#ofRows = 0;
5933.0	51018	        clear *all ErrorMsgDS;
5934.0	50811	
5935.0	50811	        for x = 1 to %elem(CouponItmAscDS);
5936.0	50811	          %occur(CouponItmAscDS) = x;
5937.0	50811	          clear CouponItmAscDS;
5938.0	50811	        endfor;
5939.0	50811	
5940.0	50811	        %occur(CouponItmAscDS) = 1;
5941.0	50811	        CouponItmAscDS.CouponId   = prCpnID;
5942.0	50811	
5943.0	50811	        Operator = prOperator;
5944.0	50811	
5945.0	50811	        Function = cCpnItmAscW;
5946.0	50811	
5947.0	90622	        wkReq#ofrows = cReqRowsCntItmAsc;
5948.0	50811	
5949.0	50811	        Oar_ptra = %addr(CouponItmAscDS);
5950.0	50830	
5951.0	50830	        MsgDtaPtr = %addr(ErrorMsgDS);
5952.0	50811	
5953.0	50811	        SwCallStatus = CouponMWInterface(
5954.0	50811	                       Operator:
5955.0	50811	                       Function:
5956.0	50811	                       OAR_PTRA:
5957.0	50914	                       PrRecOption:
5958.0	50811	                       wkReq#ofrows:
5959.0	50811	                       wkAct#ofRows:
5960.0	50830	                       MsgdtaPtr);
5961.0	50811	
5962.0	50811	        return wkAct#ofRows;
5963.0	50811	
5964.0	50811	      /end-free
5965.0	50811	     P GetCouponItemAssoc...
5966.0	50811	     P                 E
5967.0	50701	
5968.0	50701	
5969.0	50701	      // =======================================================================
5970.0	50701	      // Update S02 fields from Contract
5971.0	50701	      // =======================================================================
5972.0	50808	     P UpdContractS02Flds...
5973.0	50807	     P                 B
5974.0	50807	     D UpdContractS02Flds...
5975.0	50807	     D                 PI
5976.0	50701	      // =======================================================================
5977.0	50701	      // - Variables -
5978.0	50701	      // =======================================================================
5979.0	51019	     D wkBuyerNumber   S                   like(CouponContractDS.BuyerNumber)
5980.0	50919	     D wkCompanyNumber...
5981.0	50919	     D                 S                   like(typeCompany)
5982.0	50701	
5983.0	50701	      /free
5984.0	50701	
5985.0	50926	         ContractExists = True;
5986.0	51025	         s2CpnCntID = CouponContractDS.ContCpnAssocId;
5987.0	50810	         s2contid   = CouponContractDS.ContractID;
5988.0	50809	         s2STRDATE  = CvtISOtoDT6(CouponContractDS.StartDate:'*MDY');
5989.0	61108	         IF s2STRDATE = -1;
5990.0	50818	           s2STRDATE  = 0;
5991.0	61108	         ENDIF;
5992.0	50809	         s2ENDDATE  = CvtISOtoDT6(CouponContractDS.EndDate:'*MDY');
5993.0	61108	         IF s2ENDDATE = -1;
5994.0	50818	           s2ENDDATE  = 0;
5995.0	61108	         ENDIF;
5996.0	51017	         s2CPYC     = CouponContractDS.CompanyNumber;
5997.0	51017	         s2DEPT     = CouponContractDS.DepartmentNumber;
5998.0	50809	         s2CPTY     = CouponContractDS.CouponTypeCode;
5999.0	50809	         s2BBAVNDNB = CouponContractDS.BbaVendorNumber;
6000.0	50809	         s2BBAVNDSF = CouponContractDS.BbaVendorSuffix;
6001.0	51019	         s2RAINCHEC = CouponContractDS.RainCheckAllowed;
6002.0	260423	         EnContID = S2ContID;
6003.0	90127	
6004.0	90127	          //One contract found with Rain Check flag YES
6005.0	90127	
6006.0	90127	         If WkRckAllowed = *Blank and s2RAINCHEC = Yes;
6007.0	90127	           WkRckAllowed = Yes;
6008.0	90127	         endif;
6009.0	51025	         s2STATDESC = CouponContractDS.StatusCode;
6010.0	51025	         s2STAT     = CouponContractDS.StatusCode;
6011.0	51019	
6012.0	50919	         // BBA Vendor Name
6013.0	51019	         wkAct#ofRows4 = GetBBAVendorName(s2BBAVndNb :s2BBAVndSf);
6014.0	61108	         IF wkAct#ofRows4 > 0;
6015.0	50919	           s2VndNam = BBAVendNameDS.VMNAME;
6016.0	61108	         ENDIF;
6017.0	50916	
6018.0	51017	         // Department name
6019.0	51019	         wkAct#ofRows4 = GetDepartmentDescription(s2Dept);
6020.0	61108	         IF wkAct#ofRows4 > 0;
6021.0	51122	           s2DeptDes = DeptDescDS.DGDESS;
6022.0	61108	         ENDIF;
6023.0	50916	
6024.0	51017	         // Coupon type description
6025.0	61108	         IF GetCodeDescription(s2CPTY :
6026.0	51019	                             tableCouponTypeCodes) = True;
6027.0	51019	           s2cptd = TableDS.LDESC;
6028.0	61108	         ENDIF;
6029.0	50919	
6030.0	50919	         // Buyer Name
6031.0	51019	         wkBuyerNumber   = CouponContractDS.BuyerNumber;
6032.0	51019	         wkCompanyNumber = CouponContractDS.CompanyNumber;
6033.0	51019	         wkAct#ofRows4 = GetBuyerName(wkBuyerNumber :wkCompanyNumber);
6034.0	61108	         IF wkAct#ofRows4 > 0;
6035.0	51019	           s2BuyerID = BuyerNameDS.BUBNAM;
6036.0	61108	         ENDIF;
6037.0	91214	
6038.0	160421	         // Assign Coupon tax code only for 100% vendor funded coupons.
6039.0	160421	         // Assign Item tax code for split funded coupon (Acts like Costco funded)
6040.0	160421	         if CouponContractDS.fundingFactor = 1 and
6041.0	100524	            CouponContractDS.tpPartyRole <> 'COST' and
6042.0	100524	            CouponContractDS.tpPartyRole <> 'CRPID';
6043.0	91214	           vendorFunded = TRUE;
6044.0	91214	         endif;
6045.0	51017	
6046.0	50701	      /end-free
6047.0	50701	
6048.0	50807	     P UpdContractS02Flds...
6049.0	50807	     P                 E
6050.0	50819	
6051.0	50810	
6052.0	50810	      // =======================================================================
6053.0	50810	      // Get Coupon
6054.0	50810	      // =======================================================================
6055.0	50810	     P GetCoupon       B
6056.0	50810	     D GetCoupon       PI                  Like(WkAct#ofrows)
6057.0	50810	     D  PrOperator                         like(Operator)  const
6058.0	50810	     D  PrCpnId                            like(wkCpnID) const
6059.0	50810	      // =======================================================================
6060.0	50810	      // - Variables -
6061.0	50810	      // =======================================================================
6062.0	50810	     D  WkRows         S                   Like(Wkact#ofrows)
6063.0	50810	
6064.0	50810	     D
6065.0	50810	      /free
6066.0	50810	
6067.0	50810	       // Pick up the coupon contract being changed.
6068.0	50810	        clear function;
6069.0	50810	        clear Oar_ptra;
6070.0	50810	        WkAct#ofRows = 0;
6071.0	50914	        PrRecOption = *blanks;
6072.0	51018	        clear *all ErrorMsgDS;
6073.0	50810	
6074.0	50810	        Function = cCpnMaster;
6075.0	50810	
6076.0	50810	        operator = prOperator;
6077.0	50810	
6078.0	50810	        WkReq#ofRows = 1;
6079.0	50810	
6080.0	50810	        for x = 1 to %elem(CouponMasterDS);
6081.0	50810	           %occur(CouponMasterDS) = x;
6082.0	50810	           clear CouponMasterDS;
6083.0	50810	        endfor;
6084.0	50810	
6085.0	50810	        %occur(CouponMasterDS) = 1;
6086.0	50810	        CouponMasterDS.CouponId = prCpnId;
6087.0	50810	
6088.0	50810	        Oar_ptra = %addr(couponMasterDS);
6089.0	50830	
6090.0	50830	        MsgDtaPtr = %addr(ErrorMsgDS);
6091.0	50810	
6092.0	50810	        SwCallStatus = CouponMWInterface(
6093.0	50810	                       Operator:
6094.0	50810	                       Function:
6095.0	50810	                       OAR_PTRA:
6096.0	50914	                       PrRecOption:
6097.0	50810	                       WkReq#ofRows:
6098.0	50810	                       WkAct#ofRows:
6099.0	50830	                       MsgdtaPtr);
6100.0	50810	
6101.0	50810	        return WkAct#ofrows;
6102.0	50810	      /end-free
6103.0	50810	     P GetCoupon       E
6104.0	50819	
6105.0	50812	
6106.0	50819	      // =======================================================================
6107.0	50819	      // Get Coupon Location Association
6108.0	50819	      // =======================================================================
6109.0	50819	     P GetCouponLocAsc...
6110.0	50819	     P                 B
6111.0	50819	     D GetCouponLocAsc...
6112.0	50819	     D                 PI                  like(wkAct#ofrows)
6113.0	50819	     D prOperator                          Like(Operator) const
6114.0	50819	     D prCpnId                             like(wkCpnId) const
6115.0	50819	      // =======================================================================
6116.0	50819	      // - Variables -
6117.0	50819	      // =======================================================================
6118.0	50819	
6119.0	50819	      /free
6120.0	50819	
6121.0	50819	       // Pick up the coupon contract being changed.
6122.0	50819	        clear function;
6123.0	50819	        clear Oar_ptra;
6124.0	50819	        WkReq#ofRows = 0;
6125.0	50819	        WkAct#ofRows = 0;
6126.0	50914	        PrRecOption = *blanks;
6127.0	51018	        clear *all ErrorMsgDS;
6128.0	50819	
6129.0	50819	        Function = 'CPNLOCASC';
6130.0	50819	
6131.0	50819	        operator = prOperator;
6132.0	50819	        WkReq#ofRows = 20;
6133.0	50819	
6134.0	50819	        for x = 1 to %elem(CouponLocAscDS);
6135.0	50819	           %occur(CouponLocAscDS) = x;
6136.0	50819	           clear CouponLocAscDS;
6137.0	50819	        endfor;
6138.0	50819	
6139.0	50819	        %occur(CouponLocAscDS) = 1;
6140.0	50819	        CouponLocAscDS.CouponId = prCpnID;
6141.0	50819	
6142.0	50819	        Oar_ptra = %addr(CouponLocAscDS);
6143.0	50830	
6144.0	50830	        MsgDtaPtr = %addr(ErrorMsgDS);
6145.0	50819	
6146.0	50819	        SwCallStatus = CouponMWInterface(
6147.0	50819	                       Operator:
6148.0	50819	                       Function:
6149.0	50819	                       OAR_PTRA:
6150.0	50914	                       PrRecOption:
6151.0	50819	                       WkReq#ofRows:
6152.0	50819	                       WkAct#ofRows:
6153.0	50830	                       MsgdtaPtr);
6154.0	50819	
6155.0	50819	        return wkact#ofRows;
6156.0	50819	      /end-free
6157.0	50819	     P GetCouponLocAsc...
6158.0	50819	     p                 E
6159.0	50819	
6160.0	50819	      // =======================================================================
6161.0	50819	      // Delete all Coupon Data
6162.0	50819	      // =======================================================================
6163.0	50819	     P DeleteCoupon...
6164.0	50819	     P                 B
6165.0	50819	     D DeleteCoupon...
6166.0	50819	     D                 PR
6167.0	50819	      // =======================================================================
6168.0	50819	      // - Variables -
6169.0	50819	      // =======================================================================
6170.0	161228	     D  wkCpnDisclaimerDS...
6171.0	161228	     D                 DS                  LikeDS(CpnDisclaimerDS)
6172.0	170516	     D  wkCpnTPDds...
6173.0	170516	     D                 DS                  LikeDS(CpnTPDds)
6174.0	50819	
6175.0	50819	      /free
6176.0	50819	
6177.0	50819	           Clear CpnMasterDS;
6178.0	50819	           CpnMasterDS.CouponId = c2CpnID;
6179.0	91214	           IF not PutCouponMaster(DELETE :CpnMasterDS :' ');
6180.0	50819	             UpdFailedFlag = True;
6181.0	161228	           ELSE;
6182.0	161228	
6183.0	161228	              //Delete Coupon disclaimer data
6184.0	161228	              if couponDisclaimerExists = True;
6185.0	161228	                 CpnDisclaimerDS.COUPONID  = c2CpnId;
6186.0	161228	                 wkCpnDisclaimerDS = CpnDisclaimerDS;
6187.0	161228	                 PutCouponDisclaimer(DELETE:wkCpnDisclaimerDS:' ');
6188.0	161228	              endif;
6189.0	170516	
6190.0	170516	              //Delete Coupon TPD data
6191.0	170516	              if couponTPDExists = True;
6192.0	170516	                 CpnTPDds.COUPONID  = c2CpnId;
6193.0	170516	                 wkCpnTPDds = CpnTPDds;
6194.0	170516	                 PutCouponTPD(DELETE:wkCpnTPDds:' ');
6195.0	170516	              endif;
6196.0	170516	
6197.0	61108	           ENDIF;
6198.0	50819	           EndPgm = True;
6199.0	50819	
6200.0	50819	      /end-free
6201.0	50819	     P DeleteCoupon...
6202.0	50819	     p                 E
6203.0	51103	
6204.0	51103	
6205.0	51103	      // =======================================================================
6206.0	51103	      // Send POS Maintenance Data
6207.0	51103	      // =======================================================================
6208.0	51103	     P SendPOSMaintenance...
6209.0	51103	     P                 B
6210.0	51103	     D SendPOSMaintenance...
6211.0	51103	     D                 PR
6212.0	51103	      // =======================================================================
6213.0	51103	      // - Variables -
6214.0	51103	      // =======================================================================
6215.0	51103	
6216.0	51103	      /free
6217.0	51103	
6218.0	51103	         CpnPOSReqDS.CouponId = c2CpnID;
6219.0	61108	         IF not PutPOSMaintenance(addMode :CpnPOSReqDS);
6220.0	51103	           UpdFailedFlag = True;
6221.0	61108	         ENDIF;
6222.0	51103	         EndPgm = True;
6223.0	51103	
6224.0	51103	
6225.0	51103	      /end-free
6226.0	51103	     P SendPOSMaintenance...
6227.0	51103	     p                 E
6228.0	50831	
6229.0	50928	
6230.0	50928	      // =======================================================================
6231.0	50928	      // Reactivate Coupon Data
6232.0	50928	      // =======================================================================
6233.0	50928	     P ReactivateCoupon...
6234.0	50928	     P                 B
6235.0	50928	     D ReactivateCoupon...
6236.0	50928	     D                 PR
6237.0	50928	      // =======================================================================
6238.0	50928	      // - Variables -
6239.0	50928	      // =======================================================================
6240.0	50928	
6241.0	50928	      /free
6242.0	50928	
6243.0	51027	         Clear CpnMasterDS;
6244.0	51027	         CpnMasterDS.CouponId = c2CpnID;
6245.0	51027	         CpnMasterDS.StatusCode = cActive;
6246.0	91214	         IF not PutCouponMaster(ReActivateMode :CpnMasterDS :' ');
6247.0	51027	           UpdFailedFlag = True;
6248.0	61108	         ENDIF;
6249.0	51027	         EndPgm = True;
6250.0	50928	
6251.0	50928	      /end-free
6252.0	50928	     P ReactivateCoupon...
6253.0	50928	     p                 E
6254.0	50928	
6255.0	50831	
6256.0	50831	      // =======================================================================
6257.0	50831	      // Get Company Description
6258.0	50831	      // =======================================================================
6259.0	50831	     P GetCompanyDescription...
6260.0	50831	     P                 B
6261.0	50831	     D GetCompanyDescription...
6262.0	50831	     D                 PI                  like(wkAct#ofrows)
6263.0	50831	     D prCompany#                          like(typeCompany) const
6264.0	50831	      // =======================================================================
6265.0	50831	      // - Variables -
6266.0	50831	      // =======================================================================
6267.0	51006	     D wkAct#ofRowsCmpy...
6268.0	51006	     D                 S                   like(wkAct#ofRows) Inz
6269.0	50831	      /free
6270.0	50831	
6271.0	50901	         For x = 1 to 27;
6272.0	50901	            %occur(CompanyDescDS) = x;
6273.0	50901	            Clear CompanyDescDS;
6274.0	50901	         endfor;
6275.0	50831	
6276.0	51018	         clear *all ErrorMsgDS;
6277.0	50901	         %occur(CompanyDescDS) = 1;
6278.0	51125	         CompanyDescDS.CMCMPY = prCompany#;
6279.0	50831	         OAR_PTRA = %addr(CompanyDescDS);
6280.0	50914	         PrRecOption = 'COMPANY';
6281.0	50831	         operator = 'EQUAL   ';
6282.0	50831	         WkReq#ofrows =  1;
6283.0	50831	         clear function;
6284.0	50831	         function    = 'MISCDESC ';
6285.0	50901	         MsgDtaPtr = %addr(ErrorMsgDS);
6286.0	50831	
6287.0	50831	         SwCallStatus = CouponMWInterface(
6288.0	50831	                        Operator:
6289.0	50831	                        Function:
6290.0	50831	                        OAR_PTRA:
6291.0	50914	                        PrRecOption:
6292.0	50831	                        WkReq#ofrows:
6293.0	51006	                        WkAct#ofrowsCmpy:
6294.0	50831	                        MsgDtaPtr);
6295.0	50831	
6296.0	51006	         return wkact#ofRowsCmpy;
6297.0	50831	      /end-free
6298.0	50831	     P GetCompanyDescription...
6299.0	50831	     p                 E
6300.0	50831	
6301.0	50831	
6302.0	50831	      // =======================================================================
6303.0	51104	      // Get Department Description
6304.0	50831	      // =======================================================================
6305.0	50831	     P GetDepartmentDescription...
6306.0	50831	     P                 B
6307.0	50831	     D GetDepartmentDescription...
6308.0	50831	     D                 PI                  like(wkAct#ofrows)
6309.0	51107	     D prDepartment#                       like(c3POSDept) const
6310.0	50831	      // =======================================================================
6311.0	50831	      // - Variables -
6312.0	50831	      // =======================================================================
6313.0	51003	     D wkAct#ofRowsDept...
6314.0	51003	     D                 S                   like(wkAct#ofRows) Inz
6315.0	50831	      /free
6316.0	50831	
6317.0	50831	         For x = 1 to 27;
6318.0	50831	            %occur(DeptDescDS) = x;
6319.0	50831	            Clear DeptDescDS;
6320.0	50831	         endfor;
6321.0	50831	
6322.0	51018	         clear *all ErrorMsgDS;
6323.0	50901	         %occur(DeptDescDS) = 1;
6324.0	61108	         IF prDepartment# < 99 and prDepartment# >=0 ;
6325.0	51122	            DeptDescDS.DGGDPT = prDepartment#;
6326.0	61108	         ENDIF;
6327.0	50831	         OAR_PTRA = %addr(DeptDescDS);
6328.0	50914	         PrRecOption = 'DEPT';
6329.0	50831	         operator = 'EQUAL   ';
6330.0	50831	         WkReq#ofrows =  1;
6331.0	50831	         clear function;
6332.0	50831	         function    = 'MISCDESC ';
6333.0	50901	         MsgDtaPtr = %addr(ErrorMsgDS);
6334.0	50831	
6335.0	50831	         SwCallStatus = CouponMWInterface(
6336.0	50831	                        Operator:
6337.0	50831	                        Function:
6338.0	50831	                        OAR_PTRA:
6339.0	50914	                        PrRecOption:
6340.0	50831	                        WkReq#ofrows:
6341.0	51003	                        WkAct#ofrowsDept:
6342.0	50831	                        MsgDtaPtr);
6343.0	50831	
6344.0	51003	         return wkact#ofRowsDept;
6345.0	50831	      /end-free
6346.0	50831	     P GetDepartmentDescription...
6347.0	50831	     p                 E
6348.0	50919	
6349.0	50919	
6350.0	50919	      // =======================================================================
6351.0	50919	      // Get BBA Vendor Name
6352.0	50919	      // =======================================================================
6353.0	50919	     P GetBBAVendorName...
6354.0	50919	     P                 B
6355.0	50919	     D GetBBAVendorName...
6356.0	50919	     D                 PI                  like(wkAct#ofrows)
6357.0	50919	     D prVendor#                           like(typeVendor#) const
6358.0	50919	     D prVendorSuffix                      like(typeVendorSuffix) const
6359.0	50919	      // =======================================================================
6360.0	50919	      // - Variables -
6361.0	50919	      // =======================================================================
6362.0	51003	     D wkAct#ofRowsBBA...
6363.0	51003	     D                 S                   like(wkAct#ofRows) Inz
6364.0	50919	      /free
6365.0	50919	
6366.0	50919	         For x = 1 to 27;
6367.0	50919	            %occur(BBAVendNameDS) = x;
6368.0	50919	            Clear BBAVendNameDS;
6369.0	50919	         endfor;
6370.0	50919	
6371.0	51018	         clear *all ErrorMsgDS;
6372.0	50919	         %occur(BBAVendNameDS) = 1;
6373.0	50919	         BBAVendNameDS.VMVEND = prVendor#;
6374.0	50919	         BBAVendNameDS.VMSUFF = prVendorSuffix;
6375.0	50919	         OAR_PTRA = %addr(BBAVendNameDS);
6376.0	50923	         PrRecOption = 'BBAVEN';
6377.0	50919	         operator = 'EQUAL   ';
6378.0	50919	         WkReq#ofrows =  1;
6379.0	50919	         clear function;
6380.0	50919	         function    = 'MISCDESC ';
6381.0	50919	         MsgDtaPtr = %addr(ErrorMsgDS);
6382.0	50919	
6383.0	50919	         SwCallStatus = CouponMWInterface(
6384.0	50919	                        Operator:
6385.0	50919	                        Function:
6386.0	50919	                        OAR_PTRA:
6387.0	50919	                        PrRecOption:
6388.0	50919	                        WkReq#ofrows:
6389.0	51003	                        WkAct#ofrowsBBA:
6390.0	50919	                        MsgDtaPtr);
6391.0	50919	
6392.0	51003	         return wkact#ofRowsBBA;
6393.0	50919	      /end-free
6394.0	50919	     P GetBBAVendorName...
6395.0	50919	     p                 E
6396.0	50919	
6397.0	50919	
6398.0	50919	      // =======================================================================
6399.0	50919	      // Get Buyer Name
6400.0	50919	      // =======================================================================
6401.0	50919	     P GetBuyerName    B
6402.0	50919	     D GetBuyerName    PI                  like(wkAct#ofrows)
6403.0	50919	     D prBuyerNumber                       like(typeBuyerNumber) const
6404.0	50919	     D prCompany#                          like(typeCompany) const
6405.0	50919	      // =======================================================================
6406.0	50919	      // - Variables -
6407.0	50919	      // =======================================================================
6408.0	51003	     D wkAct#ofRowsBuy...
6409.0	51003	     D                 S                   like(wkAct#ofRows) Inz
6410.0	50919	      /free
6411.0	50919	
6412.0	50919	         For x = 1 to 27;
6413.0	50919	            %occur(BuyerNameDS) = x;
6414.0	50919	            Clear BuyerNameDS;
6415.0	50919	         endfor;
6416.0	50919	
6417.0	51018	         clear *all ErrorMsgDS;
6418.0	50919	         %occur(BuyerNameDS) = 1;
6419.0	50919	         BuyerNameDS.BUBUYR = prBuyerNumber;
6420.0	61108	         IF prCompany# < 9 and prCompany# >=0 ;
6421.0	51108	            BuyerNameDS.BUCMPY = prCompany#;
6422.0	61108	         ENDIF;
6423.0	50919	         OAR_PTRA = %addr(BuyerNameDS);
6424.0	51019	         PrRecOption = 'BUYER';
6425.0	50919	         operator = 'EQUAL   ';
6426.0	50919	         WkReq#ofrows =  1;
6427.0	50919	         clear function;
6428.0	50919	         function    = 'MISCDESC ';
6429.0	50919	         MsgDtaPtr = %addr(ErrorMsgDS);
6430.0	50919	
6431.0	50919	         SwCallStatus = CouponMWInterface(
6432.0	50919	                        Operator:
6433.0	50919	                        Function:
6434.0	50919	                        OAR_PTRA:
6435.0	50919	                        PrRecOption:
6436.0	50919	                        WkReq#ofrows:
6437.0	51003	                        WkAct#ofrowsBuy:
6438.0	50919	                        MsgDtaPtr);
6439.0	50919	
6440.0	51003	         return wkact#ofRowsBuy;
6441.0	50919	      /end-free
6442.0	50919	     P GetBuyerName    E
6443.0	50831	
6444.0	50831	
6445.0	50831	      // ============================================================================
6446.0	50831	      // Procedure getCodeDescription:
6447.0	50831	      // ============================================================================
6448.0	50916	      // This procedure is used to get descriptions for certain codes.
6449.0	50831	      // ============================================================================
6450.0	50831	     P getCodeDescription...
6451.0	50831	     P                 B
6452.0	50831	     D getCodeDescription...
6453.0	50831	     D                 PI              N
6454.0	50831	     D  PrCode                             like(TableDS.Code) const
6455.0	50831	     D  PrTableName                  10a   const
6456.0	50831	      // =======================================================================
6457.0	50831	      // - Variables -
6458.0	50831	      // =======================================================================
6459.0	50831	     D  c1First        C                   'EQUAL'
6460.0	50831	     D  cType          C                   'CODETABLE'
6461.0	51003	     D wkAct#ofRowsDesc...
6462.0	51003	     D                 S                   like(wkAct#ofRows) Inz
6463.0	50831	      /free
6464.0	50831	
6465.0	50831	
6466.0	50914	       PrRecOption = %trim(PrTableName);
6467.0	50831	       operator = c1First;
6468.0	50831	       function = cType;
6469.0	51018	       clear *all ErrorMsgDS;
6470.0	50831	
6471.0	51010	       WkReq#ofrows =  1;
6472.0	51010	       For X = 1 to 27 by 1;
6473.0	51010	          %Occur(TableDS) =x ;
6474.0	51010	          clear TableDS;
6475.0	51010	       endfor;
6476.0	51010	       %occur(TableDS)   = 1;
6477.0	50831	
6478.0	51003	       WkAct#ofrowsDesc = 0;
6479.0	50831	
6480.0	50831	       OAR_PTRA     = %addr(TableDS);
6481.0	50901	       MsgDtaPtr = %addr(ErrorMsgDS);
6482.0	50901	
6483.0	50831	       TableDS.Code = PrCode;
6484.0	50831	       SwCallStatus = CouponMWInterface(Operator:
6485.0	50831	                                        Function:
6486.0	50831	                                        OAR_PTRA:
6487.0	50914	                                        PrRecOption:
6488.0	50831	                                        wkReq#ofrows:
6489.0	51003	                                        WkAct#ofrowsDesc:
6490.0	50831	                                        MsgDtaPtr);
6491.0	50831	
6492.0	50831	       return SwCallStatus;
6493.0	50831	      /end-free
6494.0	50831	     P getCodeDescription...
6495.0	50831	     P                 E
6496.0	51011	
6497.0	51011	
6498.0	51011	      // =======================================================================
6499.0	51011	      // Get Tax Code Description
6500.0	51011	      // =======================================================================
6501.0	51011	     P GetTaxCodeDescription...
6502.0	51011	     P                 B
6503.0	51011	     D GetTaxCodeDescription...
6504.0	51011	     D                 PI                  like(wkAct#ofrows)
6505.0	51011	     D prTaxCode                           like(C3CPNTAXC) const
6506.0	51011	      // =======================================================================
6507.0	51011	      // - Variables -
6508.0	51011	      // =======================================================================
6509.0	51011	     D wkAct#ofRowsTaxCd...
6510.0	51011	     D                 S                   like(wkAct#ofRows) Inz
6511.0	51011	      /free
6512.0	80919	
6513.0	80919	          //Clear Data Structure.
6514.0	80919	       clear function;
6515.0	80919	       clear Oar_ptra;
6516.0	80919	       for x = 1 to 27;
6517.0	80919	          %occur(TaxCodeDS) = x;
6518.0	80919	          clear TaxCodeDS;
6519.0	80919	       endfor;
6520.0	80919	       %occur(TaxCodeDS) = 1;
6521.0	51011	
6522.0	80919	       clear *all ErrorMsgDS;
6523.0	80919	       Oar_ptra = %addr(TaxCodeDS);
6524.0	80919	       TaxCodeDS.ItemTaxCode = prTaxCode;
6525.0	80919	       PrRecOption = 'TAXCODES';
6526.0	80919	       function    = 'MISCDESC ';
6527.0	80919	       operator = 'EQUAL   ';
6528.0	80919	       WkReq#ofrows = 1;
6529.0	80919	       MsgDtaPtr = %addr(ErrorMsgDS);
6530.0	51011	
6531.0	51011	         SwCallStatus = CouponMWInterface(
6532.0	51011	                        Operator:
6533.0	51011	                        Function:
6534.0	51011	                        OAR_PTRA:
6535.0	51011	                        PrRecOption:
6536.0	51011	                        WkReq#ofrows:
6537.0	51011	                        WkAct#ofrowsTaxCd:
6538.0	51011	                        MsgDtaPtr);
6539.0	51011	
6540.0	80924	       if wkact#ofRowsTaxCd > 0;
6541.0	80924	         WkNewTax = TaxCodeDS.NewTaxCode;
6542.0	80924	       endif;
6543.0	51011	         return wkact#ofRowsTaxCd;
6544.0	51011	      /end-free
6545.0	51011	     P GetTaxCodeDescription...
6546.0	51011	     p                 E
6547.0	51104	
6548.0	51104	
6549.0	51104	      // =======================================================================
6550.0	51104	      // Get Item Description
6551.0	51104	      // =======================================================================
6552.0	51104	     P GetItemDescription...
6553.0	51104	     P                 B
6554.0	51104	     D GetItemDescription...
6555.0	51104	     D                 PI                  like(wkAct#ofrows)
6556.0	51104	     D prCompanyNumber...
6557.0	51104	     D                                     like(c3CmyNbr) const
6558.0	51104	     D prItemNumber                        like(s3ItmNbr) const
6559.0	51104	      // =======================================================================
6560.0	51104	      // - Variables -
6561.0	51104	      // =======================================================================
6562.0	51104	     D wkAct#ofRowsDept...
6563.0	51104	     D                 S                   like(wkAct#ofRows) Inz
6564.0	51104	      /free
6565.0	51104	
6566.0	51104	         For x = 1 to 27;
6567.0	51104	            %occur(ItemDescriptionDS) = x;
6568.0	51104	            Clear ItemDescriptionDS;
6569.0	51104	         endfor;
6570.0	51104	
6571.0	51104	         clear *all ErrorMsgDS;
6572.0	51104	         %occur(ItemDescriptionDS) = 1;
6573.0	51104	         ItemDescriptionDS.IMCMPY = prCompanyNumber;
6574.0	51104	         ItemDescriptionDS.IMITEM = prItemNumber;
6575.0	51104	         OAR_PTRA = %addr(ItemDescriptionDS);
6576.0	51104	         PrRecOption = 'ITEMDES';
6577.0	51104	         operator = 'EQUAL   ';
6578.0	51104	         WkReq#ofrows =  1;
6579.0	51104	         clear function;
6580.0	51104	         function    = 'MISCDESC ';
6581.0	51104	         MsgDtaPtr = %addr(ErrorMsgDS);
6582.0	51104	
6583.0	51104	         SwCallStatus = CouponMWInterface(
6584.0	51104	                        Operator:
6585.0	51104	                        Function:
6586.0	51104	                        OAR_PTRA:
6587.0	51104	                        PrRecOption:
6588.0	51104	                        WkReq#ofrows:
6589.0	51104	                        WkAct#ofrowsDept:
6590.0	51104	                        MsgDtaPtr);
6591.0	90130	          //Get Merch. item Tax
6592.0	90130	         If enOpt = OptAdd and
6593.0	90130	           wkact#ofRowsDept > 0 and wkMItemTax = *blank and
6594.0	90130	           ItemDescriptionDS.IMtaxcd <> *Blank;
6595.0	90130	           wkMItemTax= ItemDescriptionDS.IMtaxcd;
6596.0	90130	         Endif;
6597.0	51104	
6598.0	51104	         return wkact#ofRowsDept;
6599.0	51104	      /end-free
6600.0	51104	     P GetItemDescription...
6601.0	51104	     p                 E
6602.0	50907	
6603.0	50907	
6604.0	50907	      // =======================================================================
6605.0	50907	      // Put Coupon Group
6606.0	50907	      // =======================================================================
6607.0	50907	     P PutCouponGroup...
6608.0	50907	     P                 B
6609.0	50907	     D PutCouponGroup...
6610.0	50907	     D                 PI              n
6611.0	50907	     D prOperator                          like(Operator) const
6612.0	50907	     D prCouponGroupDS...
6613.0	50907	     D                                     likeds(CouponGroupDS) const
6614.0	50907	      // =======================================================================
6615.0	50907	      // - Variables -
6616.0	50907	      // =======================================================================
6617.0	50907	
6618.0	50907	      /free
6619.0	50907	
6620.0	50907	       // Pick up the coupon contract being changed.
6621.0	50907	        clear function;
6622.0	50907	        clear Oar_ptra;
6623.0	50907	        WkReq#ofRows = 0;
6624.0	50907	        WkAct#ofRows = 0;
6625.0	50914	        PrRecOption = *blanks;
6626.0	51018	        clear *all ErrorMsgDS;
6627.0	50907	
6628.0	50907	        Function = 'COUPONGRP';
6629.0	50907	
6630.0	50907	        operator = prOperator;
6631.0	50907	
6632.0	50908	        for x = 1 to %elem(CouponGroupDS);
6633.0	50908	           %occur(CouponGroupDS) = x;
6634.0	50908	           clear CouponGroupDS;
6635.0	50907	        endfor;
6636.0	50907	
6637.0	50908	        %occur(CouponGroupDS) = 1;
6638.0	50908	        CouponGroupDS = prCouponGroupDS;
6639.0	50907	
6640.0	50908	        Oar_ptra = %addr(CouponGroupDS);
6641.0	50907	
6642.0	50907	        MsgDtaPtr = %addr(ErrorMsgDS);
6643.0	50907	
6644.0	50907	        SwCallStatus = CouponMWInterface(
6645.0	50907	                       Operator:
6646.0	50907	                       Function:
6647.0	50907	                       OAR_PTRA:
6648.0	50914	                       PrRecOption:
6649.0	50907	                       WkReq#ofRows:
6650.0	50907	                       WkAct#ofRows:
6651.0	50907	                       MsgDtaPtr);
6652.0	50907	
6653.0	50907	        return SwCallStatus;
6654.0	50907	      /end-free
6655.0	50907	     P PutCouponGroup...
6656.0	50907	     P                 E
6657.0	50907	
6658.0	50907	
6659.0	50907	      // =======================================================================
6660.0	50908	      // Get Coupon Group
6661.0	50907	      // =======================================================================
6662.0	50907	     P GetCouponGroup...
6663.0	50907	     P                 B
6664.0	50907	     D GetCouponGroup...
6665.0	50907	     D                 PI                  like(wkAct#ofRows)
6666.0	51026	     D prCouponId...
6667.0	51026	     D                                     like(typeCouponId) const
6668.0	50907	     D prOperator                          like(Operator) const
6669.0	50907	      // =======================================================================
6670.0	50907	      // - Variables -
6671.0	50907	      // =======================================================================
6672.0	50907	
6673.0	50907	      /free
6674.0	50907	
6675.0	50907	       // Pick up the coupon contract being changed.
6676.0	50907	        clear function;
6677.0	50907	        clear Oar_ptra;
6678.0	51026	        WkReq#ofRows = cReqRows;
6679.0	50907	        WkAct#ofRows = 0;
6680.0	50914	        PrRecOption = *blanks;
6681.0	51018	        clear *all ErrorMsgDS;
6682.0	50907	
6683.0	50907	        Function = 'COUPONGRP';
6684.0	50907	
6685.0	50907	        operator = prOperator;
6686.0	50907	
6687.0	50907	        for x = 1 to %elem(CouponGroupDS);
6688.0	50907	           %occur(CouponGroupDS) = x;
6689.0	50907	           clear CouponGroupDS;
6690.0	50907	        endfor;
6691.0	50907	
6692.0	50907	        %occur(CouponGroupDS) = 1;
6693.0	51026	        CouponGroupDS.CouponId = prCouponId;
6694.0	50907	
6695.0	50907	        Oar_ptra = %addr(CouponGroupDS);
6696.0	50907	
6697.0	50907	        MsgDtaPtr = %addr(ErrorMsgDS);
6698.0	50907	
6699.0	50907	        SwCallStatus = CouponMWInterface(
6700.0	50907	                       Operator:
6701.0	50907	                       Function:
6702.0	50907	                       OAR_PTRA:
6703.0	50914	                       PrRecOption:
6704.0	50907	                       WkReq#ofRows:
6705.0	50907	                       WkAct#ofRows:
6706.0	50907	                       MsgDtaPtr);
6707.0	50907	
6708.0	50907	        return wkAct#ofRows;
6709.0	50907	      /end-free
6710.0	50907	     P GetCouponGroup...
6711.0	50907	     P                 E
6712.0	161228	
6713.0	161228	      // =======================================================================
6714.0	161228	      // Get Coupon Disclaimer Compliance Flag
6715.0	161228	      // =======================================================================
6716.0	161228	     P getCouponDisclaimerFlag...
6717.0	161228	     P                 B
6718.0	161228	     D getCouponDisclaimerFlag...
6719.0	161228	     D                 PI                  like(wkAct#ofrows)
6720.0	161228	     D prCouponId                          like(typeCouponId) const
6721.0	161228	      // =======================================================================
6722.0	161228	      // - Variables -
6723.0	161228	      // =======================================================================
6724.0	161228	     D wkAct#ofRowsDscFlg...
6725.0	161228	     D                 S                   like(wkAct#ofRows) Inz
6726.0	161228	      /free
6727.0	161228	
6728.0	161228	          //Clear Data Structure.
6729.0	161228	       clear function;
6730.0	161228	       clear Oar_ptra;
6731.0	161228	       for x = 1 to 27;
6732.0	161228	          %occur(CpnDisclaimerDS) = x;
6733.0	161228	          clear CpnDisclaimerDS;
6734.0	161228	       endfor;
6735.0	161228	       %occur(CpnDisclaimerDS) = 1;
6736.0	161228	
6737.0	161228	       clear *all ErrorMsgDS;
6738.0	161228	       Oar_ptra = %addr(CpnDisclaimerDS);
6739.0	161228	       CpnDisclaimerDS.CouponId = prCouponId;
6740.0	161228	       PrRecOption = *Blanks;
6741.0	161228	       function    = 'CPNDSCFLG';
6742.0	161228	       operator = 'EQUAL   ';
6743.0	161228	       WkReq#ofrows = 1;
6744.0	161228	       MsgDtaPtr = %addr(ErrorMsgDS);
6745.0	161228	
6746.0	161228	         SwCallStatus = CouponMWInterface(
6747.0	161228	                        Operator:
6748.0	161228	                        Function:
6749.0	161228	                        OAR_PTRA:
6750.0	161228	                        PrRecOption:
6751.0	161228	                        WkReq#ofrows:
6752.0	161228	                        wkAct#ofRowsDscFlg:
6753.0	161228	                        MsgDtaPtr);
6754.0	161228	
6755.0	161228	         return wkAct#ofRowsDscFlg;
6756.0	161228	      /end-free
6757.0	161228	     P getCouponDisclaimerFlag...
6758.0	161228	     p                 E
6759.0	161228	
6760.0	170516	
6761.0	170516	      // =======================================================================
6762.0	170516	      // Get Coupon TPD Flag
6763.0	170516	      // =======================================================================
6764.0	170516	     P getCouponTPDFlag...
6765.0	170516	     P                 B
6766.0	170516	     D getCouponTPDFlag...
6767.0	170516	     D                 PI                  like(wkAct#ofrows)
6768.0	170516	     D prCouponId                          like(typeCouponId) const
6769.0	170516	      // =======================================================================
6770.0	170516	      // - Variables -
6771.0	170516	      // =======================================================================
6772.0	170516	     D wkAct#ofRowsDscFlg...
6773.0	170516	     D                 S                   like(wkAct#ofRows) Inz
6774.0	170516	      /free
6775.0	170516	
6776.0	170516	          //Clear Data Structure.
6777.0	170516	       clear function;
6778.0	170516	       clear Oar_ptra;
6779.0	170516	       for x = 1 to 27;
6780.0	170516	          %occur(CpnTPDds) = x;
6781.0	170516	          clear CpnTPDds;
6782.0	170516	       endfor;
6783.0	170516	       %occur(CpnTPDds) = 1;
6784.0	170516	
6785.0	170516	       clear *all ErrorMsgDS;
6786.0	170516	       Oar_ptra = %addr(CpnTPDds);
6787.0	170516	       CpnTPDds.CouponId = prCouponId;
6788.0	170516	       PrRecOption = *Blanks;
6789.0	170516	       function    = 'CPNTPDFLG';
6790.0	170516	       operator = 'EQUAL   ';
6791.0	170516	       WkReq#ofrows = 1;
6792.0	170516	       MsgDtaPtr = %addr(ErrorMsgDS);
6793.0	170516	
6794.0	170516	         SwCallStatus = CouponMWInterface(
6795.0	170516	                        Operator:
6796.0	170516	                        Function:
6797.0	170516	                        OAR_PTRA:
6798.0	170516	                        PrRecOption:
6799.0	170516	                        WkReq#ofrows:
6800.0	170516	                        wkAct#ofRowsDscFlg:
6801.0	170516	                        MsgDtaPtr);
6802.0	170516	
6803.0	170516	         return wkAct#ofRowsDscFlg;
6804.0	170516	      /end-free
6805.0	170516	     P getCouponTPDFlag...
6806.0	170516	     p                 E
6807.0	170516	
6808.0	50914	
6809.0	50914	      // =======================================================================
6810.0	50914	      // Procedure CheckContractMsgs:
6811.0	50914	      // =======================================================================
6812.0	50914	      // This procedure is used to check mid-ware validation messages.
6813.0	50914	      // =======================================================================
6814.0	50914	     P CheckContractmsgs...
6815.0	50914	     P                 B
6816.0	50914	     D CheckContractMsgs...
6817.0	50914	     D                 PI
6818.0	60426	
6819.0	60426	      // - Local Variables -
6820.0	60426	     D wkWarning       S                   like(msgSeverity) Inz(10)
6821.0	60426	
6822.0	60426	     D MsgInfo         DS          3000
6823.0	60426	     D  BytesRtn                     10I 0 Overlay(MsgInfo :1)
6824.0	60426	     D  BytesAvl                     10I 0 Overlay(MsgInfo :*next)
6825.0	60426	     D  MsgSeverity                  10I 0 Overlay(MsgInfo :*next)
6826.0	60426	     D  AlertIdx                     10I 0 Overlay(MsgInfo :*next)
6827.0	60426	     D  AlertOpt                      9    Overlay(MsgInfo :*next)
6828.0	60426	     D  LogInd                        1    Overlay(MsgInfo :*next)
6829.0	60426	     D  Reserved                      2    Overlay(MsgInfo :*next)
6830.0	60426	     D  DftRplyRtn                   10I 0 Overlay(MsgInfo :*next)
6831.0	60426	     D  DftRplyAvl                   10I 0 Overlay(MsgInfo :*next)
6832.0	60426	     D  MsgLenRtn                    10I 0 Overlay(MsgInfo :*next)
6833.0	60426	     D  MsgLenAvl                    10I 0 Overlay(MsgInfo :*next)
6834.0	60426	     D  MsgHlpLenRtn                 10I 0 Overlay(MsgInfo :*next)
6835.0	60426	     D  MsgHlpLenAvl                 10I 0 Overlay(MsgInfo :*next)
6836.0	60426	     D  RtnInfo                    1000    Overlay(MsgInfo :*next)
6837.0	60426	
6838.0	60426	     D MsgfLibFile     DS            20
6839.0	60426	     D  MsgFile                      10a   INZ(MsgF)
6840.0	60426	     D                                     OVERLAY(MsgfLibFile :1)
6841.0	60426	     D  MsgLib                       10a   INZ('*LIBL')
6842.0	60426	     D                                     OVERLAY(MsgfLibFile :*next)
6843.0	51018	
6844.0	50914	      /free
6845.0	51108	
6846.0	51125	        // ---------------------------------------------------------
6847.0	51125	        // Move saved error messages to error message data structure
6848.0	51125	        // ---------------------------------------------------------
6849.0	51125	        indxHld = 1;
6850.0	51125	        %occur(ErrorMsgDS) = indxHld;
6851.0	51125	        DoW errorMsgDS <> *blank and indxHld < 10000;
6852.0	51125	          indxHld += 1;
6853.0	51125	          %occur(ErrorMsgDS) = indxHld;
6854.0	51125	        enddo;
6855.0	51108	
6856.0	51125	        indx = 1;
6857.0	51125	        %occur(wkErrorMsgDS) = indx;
6858.0	51108	
6859.0	51125	        DoW wkErrorMsgDS <> *blank and indx < 10000;
6860.0	51125	          ErrorMsgDS = wkErrorMsgDS;
6861.0	51125	          indx += 1;
6862.0	51125	          indxHld += 1;
6863.0	51125	          %occur(ErrorMsgDS) = indxHld;
6864.0	51125	          %occur(wkErrorMsgDS) = indx;
6865.0	51125	        enddo;
6866.0	51108	
6867.0	51125	        %occur(ErrorMsgDS) = 1;
6868.0	51108	        //----------------------------------------------------------
6869.0	51017	
6870.0	51107	        indx = 1;
6871.0	50914	        %occur(ErrorMsgDS) = indx;
6872.0	50914	
6873.0	50914	        DoW ErrorMsgDS <> *blank and indx < 10000;
6874.0	50914	
6875.0	60426	          // Retrieve message severity, check for warning
6876.0	60426	          CallP  QMHRTVM(MsgInfo : %Size(MsgInfo) :'RTVM0200'
6877.0	60426	                          :ErrorMsgDS.errMessagID :MsgfLibFile
6878.0	60426	                          :' ' :0  :'*YES' :'*YES' :APIErr);
6879.0	60426	
6880.0	60427	          // Check severity of messages for warnings
6881.0	61108	          IF MsgSeverity = wkWarning;
6882.0	60427	            warningsFound = True;
6883.0	60427	            %occur(warningMessagesDS) = wkWarningIndex;
6884.0	60427	            wkMessage = %subst(RtnInfo :(dftRplyRtn + 1) :MsgLenRtn);
6885.0	60427	            wkMsgId   = ErrorMsgDS.errMessagID;
6886.0	60427	            wkWarningIndex += 1;
6887.0	61108	          ENDIF;
6888.0	60426	
6889.0	50915	        Select;
6890.0	70108	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6891.0	70108	             ErrorMsgDS.ErrMessagID = cCouponTypenottheSame;
6892.0	70108	
6893.0	70108	             ErrorFoundContract = True;
6894.0	70108	             %Subst(wkMsgDta :01 :30) = 'Contract Number';
6895.0	70108	             %Subst(wkMsgDta :31 :30) = %SUBST(errorMsgDS.errMsgData :1:30);
6896.0	70108	
6897.0	70108	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
6898.0	70108	                        :sdPgm :JobLang :wkMsgDta);
6899.0	70108	             setCsrPos (PosS2CONTID);
6900.0	70312	
6901.0	70312	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6902.0	70312	             ErrorMsgDS.ErrMessagID = cCouponAmountnottheSame;
6903.0	70312	
6904.0	70312	             ErrorFoundContract = True;
6905.0	70312	             %Subst(wkMsgDta :01 :30) = 'Contract Number';
6906.0	70312	             %Subst(wkMsgDta :31 :30) = %SUBST(errorMsgDS.errMsgData :1:30);
6907.0	70312	
6908.0	70312	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
6909.0	70312	                        :sdPgm :JobLang :wkMsgDta);
6910.0	70312	             setCsrPos (PosS2CONTID);
6911.0	70108	
6912.0	60919	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6913.0	60919	             ErrorMsgDS.ErrMessagID = cContractNotValid;
6914.0	60919	
6915.0	60919	             ErrorFoundContract = True;
6916.0	60919	             %Subst(wkMsgDta :01 :30) = 'Contract Number';
6917.0	60919	             %Subst(wkMsgDta :31 :30) = %SUBST(errorMsgDS.errMsgData :1:30);
6918.0	60919	
6919.0	60919	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
6920.0	60919	                        :sdPgm :JobLang :wkMsgDta);
6921.0	60919	             setCsrPos (PosS2CONTID);
6922.0	60919	
6923.0	50915	             // Not allowed to delete coupon that is already Cancelled
6924.0	51110	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6925.0	50915	             ErrorMsgDS.ErrMessagID = cNotCouponType;
6926.0	50915	
6927.0	50915	             ErrorFoundContract = True;
6928.0	50915	             PutErrMsg (cNotCouponType :MsgF
6929.0	50915	                        :sdPgm :JobLang :wkMsgDta);
6930.0	50915	
6931.0	50915	
6932.0	50915	             // Only allowed to re-activate coupon with status Cancelled
6933.0	51110	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6934.0	50915	             ErrorMsgDS.ErrMessagID = cCouponNotAct;
6935.0	50915	
6936.0	50915	             ErrorFoundContract = True;
6937.0	50915	             PutErrMsg (cCouponNotAct :MsgF
6938.0	50915	                        :sdPgm :JobLang :wkMsgDta);
6939.0	50915	
6940.0	50915	
6941.0	51109	             // Company not equal to coupon company
6942.0	51110	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6943.0	50915	             ErrorMsgDS.ErrMessagID = cNotCmpyEqual;
6944.0	50915	
6945.0	50915	             ErrorFoundContract = True;
6946.0	60427	             AllContractsInError = True;
6947.0	50915	             PutErrMsg (cNotCmpyEqual :MsgF
6948.0	50915	                        :sdPgm :JobLang :wkMsgDta);
6949.0	51109	             setCsrPos (PosS2CONTID);
6950.0	51026	
6951.0	51026	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6952.0	51026	             ErrorMsgDS.ErrMessagID = RcdNotFound;
6953.0	51026	
6954.0	51026	             ErrorFoundContract = True;
6955.0	51026	             %Subst(wkMsgDta :01 :30) = 'Contract Number';
6956.0	51123	             %Subst(wkMsgDta :31 :30) =
6957.0	51123	                %trim(%editc(%dec(%trim(
6958.0	51123	                %SUBST(errorMsgDS.errMsgData :1:10)):9:0):'Z'));
6959.0	51123	
6960.0	51026	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
6961.0	51026	                        :sdPgm :JobLang :wkMsgDta);
6962.0	51026	             setCsrPos (PosS2CONTID);
6963.0	51025	
6964.0	51107	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6965.0	51107	             ErrorMsgDS.ErrMessagID = cContractIsExpired;
6966.0	51025	
6967.0	51025	             ErrorFoundContract = True;
6968.0	51026	             wkMsgDta = ErrorMsgDS.ErrMsgData;
6969.0	51025	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
6970.0	51025	                        :sdPgm :JobLang :wkMsgDta);
6971.0	51107	             setCsrPos (PosS2CONTID);
6972.0	51110	
6973.0	51110	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6974.0	51110	             ErrorMsgDS.ErrMessagID = cDuplicateContract;
6975.0	51110	
6976.0	51110	             ErrorFoundContract = True;
6977.0	51110	             wkMsgDta = ErrorMsgDS.ErrMsgData;
6978.0	51110	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
6979.0	51110	                        :sdPgm :JobLang :wkMsgDta);
6980.0	51125	             setCsrPos (PosS2CONTID);
6981.0	60426	
6982.0	60426	             // Total funding percentage of contracts exceeds 100
6983.0	60426	        When ErrorMsgDS.ErrFieldName = 'ContractID' and
6984.0	60426	             ErrorMsgDS.ErrMessagID = cHighFundingPct;
6985.0	60426	
6986.0	60426	             ErrorFoundContract = True;
6987.0	60426	             AllContractsInError = True;
6988.0	60426	             PutErrMsg (cHighFundingPct :MsgF
6989.0	60426	                        :sdPgm :JobLang :wkMsgDta);
6990.0	51107	
6991.0	60427	        When ErrorMsgDS.ErrFieldName = 'ContractID'
6992.0	60427	             and not warningsFound;
6993.0	51107	
6994.0	51107	             ErrorFoundContract = True;
6995.0	51107	             wkMsgDta = ErrorMsgDS.ErrMsgData;
6996.0	51107	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
6997.0	51107	                        :sdPgm :JobLang :wkMsgDta);
6998.0	51107	             setCsrPos (PosS2Opt);
6999.0	50915	
7000.0	50915	        endsl;
7001.0	51017	
7002.0	61108	        IF errorFoundContract and errorMsgDS.errMsgData <> *blanks;
7003.0	51109	          wkContract# =
7004.0	51109	               %dec(%trim(%SUBST(errorMsgDS.errMsgData :1:10)):9:0);
7005.0	51109	          x = %lookup(wkContract# :errContract# :1);
7006.0	61108	          IF x = 0;
7007.0	51109	            wkErrIndex += 1;
7008.0	51109	            errContract#(wkErrIndex) =
7009.0	51109	               %dec(%trim(%SUBST(errorMsgDS.errMsgData :1:10)):9:0);
7010.0	61108	          ENDIF;
7011.0	61108	        ENDIF;
7012.0	50914	
7013.0	50914	        indx += 1;
7014.0	50914	        %occur(ErrorMsgDS) = indx;
7015.0	50914	
7016.0	50914	        enddo;
7017.0	51018	
7018.0	51107	        %occur(ErrorMsgDS) = 1;
7019.0	60926	
7020.0	61108	        IF ErrorFoundContract;
7021.0	60926	          reset warningsFound;
7022.0	61108	        ENDIF;
7023.0	51025	
7024.0	50914	        return;
7025.0	50914	      /end-free
7026.0	50914	     P CheckContractmsgs...
7027.0	50914	     P                 E
7028.0	50914	
7029.0	50914	
7030.0	50914	      // =======================================================================
7031.0	50914	      // Procedure CheckItemAssocMsgs:
7032.0	50914	      // =======================================================================
7033.0	50914	      // This procedure is used to check mid-ware validation messages.
7034.0	50914	      // =======================================================================
7035.0	50914	     P CheckItemAssocMsgs...
7036.0	50914	     P                 B
7037.0	50914	     D CheckItemAssocMsgs...
7038.0	50914	     D                 PI
7039.0	50914	      /free
7040.0	51013	
7041.0	50914	        indx = 1;
7042.0	50914	        %occur(ErrorMsgDS) = indx;
7043.0	50914	
7044.0	50914	        DoW ErrorMsgDS <> *blank and indx < 10000;
7045.0	50914	
7046.0	50915	        Select;
7047.0	50929	
7048.0	50929	             // Item must exist in buying system
7049.0	50929	        When ErrorMsgDS.ErrFieldName = 'itemNumber' and
7050.0	50929	             ErrorMsgDS.ErrMessagID = Err_BadOpt;
7051.0	50929	
7052.0	51013	             ErrorFoundItem = True;
7053.0	50929	             wkMsgDta = 'Item Number';
7054.0	50929	             %Subst(wkMsgDta: 31: 7) = %char(S3ITMNBR);
7055.0	50929	             setCsrPos (PosS3ItmNbr);
7056.0	50929	             PutErrMsg (Err_BadOpt :MsgF
7057.0	50929	                        :sdPgm :JobLang :wkMsgDta);
7058.0	50929	
7059.0	50929	
7060.0	60106	        When ErrorMsgDS.ErrFieldName = 'itemNumber';
7061.0	60106	
7062.0	60106	             ErrorFoundItem = True;
7063.0	60106	             wkMsgDta = 'Item Number';
7064.0	60106	             setCsrPos (PosS3ItmNbr);
7065.0	60106	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
7066.0	60106	                        :sdPgm :JobLang :wkMsgDta);
7067.0	60106	
7068.0	60106	
7069.0	51012	             // Item Number must be active
7070.0	51012	        When ErrorMsgDS.ErrFieldName = 'cntItems' and
7071.0	51013	             ErrorMsgDS.ErrMessagID = cItemNotActive;
7072.0	50929	
7073.0	51013	             ErrorFoundItem = True;
7074.0	51012	             wkMsgDta = 'Item Number';
7075.0	50929	             %Subst(wkMsgDta: 31: 7) = %char(S3ItmNbr);
7076.0	50929	             setCsrPos (PosS3ItmNbr);
7077.0	51013	             PutErrMsg (cItemNotActive :MsgF
7078.0	50929	                        :sdPgm :JobLang :wkMsgDta);
7079.0	50929	
7080.0	50929	
7081.0	50929	             // Presale indicator must be valid
7082.0	50929	        When ErrorMsgDS.ErrFieldName = 'associationCode' and
7083.0	51013	             ErrorMsgDS.ErrMessagID = cInvalidFlag;
7084.0	50929	
7085.0	51013	             ErrorFoundItem = True;
7086.0	50929	             wkMsgDta = 'Free Item Indicator';
7087.0	50929	             %Subst(wkMsgDta: 31: 1) = S3FITF;
7088.0	50929	             setCsrPos (PosS3FITF);
7089.0	51013	             PutErrMsg (cInvalidFlag :MsgF
7090.0	50929	                        :sdPgm :JobLang :wkMsgDta);
7091.0	50929	
7092.0	51107	        When ErrorMsgDS.ErrFieldName = 'itemNumber' and
7093.0	51107	             ErrorMsgDS.ErrMessagID = cItemNotExistInContract;
7094.0	51027	
7095.0	51027	             ErrorFoundItem = True;
7096.0	51027	             setCsrPos (PosS3ItmNbr);
7097.0	51027	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
7098.0	51027	                        :sdPgm :JobLang);
7099.0	51107	
7100.0	51107	        When ErrorMsgDS.ErrFieldName = 'itemnumber' and
7101.0	51107	             ErrorMsgDS.ErrMessagID = cDuplicateItem;
7102.0	51107	
7103.0	51107	             ErrorFoundItem = True;
7104.0	51107	             setCsrPos (PosS3ItmNbr);
7105.0	51107	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
7106.0	51107	                        :sdPgm :JobLang);
7107.0	51027	
7108.0	51027	        When ErrorMsgDS.ErrFieldName = 'StatusCode';
7109.0	51027	
7110.0	51027	             ErrorFoundItem = True;
7111.0	51027	             setCsrPos (PosS3Opt);
7112.0	51027	             PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
7113.0	51027	                        :sdPgm :JobLang);
7114.0	50929	
7115.0	50915	        endsl;
7116.0	50914	
7117.0	50914	        indx += 1;
7118.0	50914	        %occur(ErrorMsgDS) = indx;
7119.0	50914	
7120.0	50914	        enddo;
7121.0	50914	
7122.0	50914	        return;
7123.0	50914	      /end-free
7124.0	50914	     P CheckItemAssocMsgs...
7125.0	50914	     P                 E
7126.0	50914	
7127.0	50914	
7128.0	50914	      // =======================================================================
7129.0	50914	      // Procedure CheckCouponMsgs:
7130.0	50914	      // =======================================================================
7131.0	50914	      // This procedure is used to check mid-ware validation messages.
7132.0	50914	      // =======================================================================
7133.0	50914	     P CheckCouponMsgs...
7134.0	50914	     P                 B
7135.0	50914	     D CheckCouponMsgs...
7136.0	50914	     D                 PI
7137.0	50914	      /free
7138.0	50914	
7139.0	50915	        ErrorFound = False;
7140.0	50914	        indx = 1;
7141.0	50914	        %occur(ErrorMsgDS) = indx;
7142.0	50914	
7143.0	50914	        DoW ErrorMsgDS <> *blank and indx < 10000;
7144.0	50914	
7145.0	51125	          Select;
7146.0	50915	
7147.0	51125	               // Company Number must be entered.
7148.0	51125	          When ErrorMsgDS.ErrFieldName = 'companyNumber' and
7149.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7150.0	50915	
7151.0	51125	               ErrorFound = True;
7152.0	51125	               wkMsgDta = 'Company Number';
7153.0	51125	               setCsrPos (PosC3CMYNBR);
7154.0	51125	               PutErrMsg (Is_Required :MsgF
7155.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7156.0	50915	
7157.0	50915	
7158.0	51125	               // Company Number must exist in buying system.
7159.0	51125	          When ErrorMsgDS.ErrFieldName = 'companyNumber' and
7160.0	51125	               ErrorMsgDS.ErrMessagID = Err_BadOpt;
7161.0	50915	
7162.0	51125	               ErrorFound = True;
7163.0	51125	               wkMsgDta = 'Company Number';
7164.0	51125	               %Subst(wkMsgDta: 31: 3) = %char(C3CMYNBR);
7165.0	51125	               setCsrPos (PosC3CMYNBR);
7166.0	51125	               PutErrMsg (Err_BadOpt :MsgF
7167.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7168.0	51024	
7169.0	51024	
7170.0	51125	               // Company Number of Coupon and Coupon Contract must be the same
7171.0	51125	          When ErrorMsgDS.ErrFieldName = 'companyNumber' and
7172.0	51125	               ErrorMsgDS.ErrMessagID = cCpnCntCpmyNotEqual;
7173.0	51024	
7174.0	51125	               ErrorFound = True;
7175.0	51125	               wkMsgDta = 'Company Number';
7176.0	51125	               setCsrPos (PosC3CMYNBR);
7177.0	51125	               PutErrMsg (cCpnCntCpmyNotEqual :MsgF
7178.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7179.0	50915	
7180.0	50915	
7181.0	51125	               // Coupon description must be entered.
7182.0	51125	          When ErrorMsgDS.ErrFieldName = 'longdescription' and
7183.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7184.0	50915	
7185.0	51125	               ErrorFound = True;
7186.0	51125	               wkMsgDta = 'Coupon Description';
7187.0	61108	               IF c3CpnDes1 = *blanks;
7188.0	51125	                 setCsrPos (PosC3CPNDES1);
7189.0	61108	               ENDIF;
7190.0	61108	               IF c3CpnDes2 = *blanks;
7191.0	51125	                 setCsrPos (PosC3CPNDES2);
7192.0	61108	               ENDIF;
7193.0	51125	               PutErrMsg (Is_Required :MsgF
7194.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7195.0	50915	
7196.0	50915	
7197.0	51125	               // Register description must be entered.
7198.0	51125	          When ErrorMsgDS.ErrFieldName = 'registerDescription' and
7199.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7200.0	50915	
7201.0	51125	               ErrorFound = True;
7202.0	51125	               wkMsgDta = 'Register Description';
7203.0	51125	               setCsrPos (PosC3RDESC);
7204.0	51125	               PutErrMsg (Is_Required :MsgF
7205.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7206.0	50915	
7207.0	50915	
7208.0	51125	               // POS Department Number must be entered.
7209.0	51125	          When ErrorMsgDS.ErrFieldName = 'posDepartmentNumber' and
7210.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7211.0	50915	
7212.0	51125	               ErrorFound = True;
7213.0	51125	               wkMsgDta = 'POS Department Number';
7214.0	51125	               setCsrPos (PosC3POSDEPT);
7215.0	51125	               PutErrMsg (Is_Required :MsgF
7216.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7217.0	50915	
7218.0	50915	
7219.0	51125	               // POS Department Number must be valid based on coupon contract department.
7220.0	51125	          When ErrorMsgDS.ErrFieldName = 'posDepartmentNumber' and
7221.0	51125	               ErrorMsgDS.ErrMessagID =  InvldPOSCpnDeptdBasedOnCpnCntDept;
7222.0	51011	
7223.0	51125	               ErrorFound = True;
7224.0	51125	               wkMsgDta = 'POS Department Number';
7225.0	51125	               %Subst(wkMsgDta: 31: 3) = %EditC(C3POSDEPT:'X');
7226.0	51125	               setCsrPos (PosC3POSDEPT);
7227.0	51125	               PutErrMsg (InvldPOSCpnDeptdBasedOnCpnCntDept :MsgF
7228.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7229.0	51028	
7230.0	51125	               // POS Department Number must be greater than zero
7231.0	51125	          When ErrorMsgDS.ErrFieldName = 'posDepartmentNumber' ;
7232.0	51125	
7233.0	51125	               ErrorFound = True;
7234.0	51125	               wkMsgDta = errorMsgDS.ErrMsgData;
7235.0	51125	               %Subst(wkMsgDta: 31: 3) = %char(C3POSDEPT);
7236.0	51125	               setCsrPos (PosC3POSDEPT);
7237.0	51125	               PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
7238.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7239.0	50915	
7240.0	51125	               // Coupon Minimum Purchase Count must be entered.
7241.0	51125	          When ErrorMsgDS.ErrFieldName = 'minimumPurchaseCount' and
7242.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7243.0	50915	
7244.0	51125	               ErrorFound = True;
7245.0	60601	               wkMsgDta = ErrorMsgDS.ErrMsgData ;
7246.0	51125	               setCsrPos (PosC3MINCNT);
7247.0	51125	               PutErrMsg (Is_Required :MsgF
7248.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7249.0	100421	
7250.0	100421	               // item count is invalid
7251.0	100421	          When ErrorMsgDS.ErrFieldName = 'minimumPurchaseCount' and
7252.0	100421	               ErrorMsgDS.ErrMessagID = cItemsCount;
7253.0	100421	
7254.0	100421	               ErrorFound = True;
7255.0	100421	               wkMsgDta = ErrorMsgDS.ErrMsgData ;
7256.0	100421	               //setCsrPos (PosC3MINCNT);
7257.0	100421	               PutErrMsg (cItemsCount  :MsgF
7258.0	100421	                          :sdPgm :JobLang :wkMsgDta);
7259.0	50915	
7260.0	50915	
7261.0	51125	               // Minimum Purchase Quantity must be > free item quantity.
7262.0	51125	          When ErrorMsgDS.ErrFieldName = 'minimumPurchaseCount' and
7263.0	51125	               ErrorMsgDS.ErrMessagID = cInvMinPurchCnt;
7264.0	50915	
7265.0	51125	               ErrorFound = True;
7266.0	60601	               wkMsgDta = ErrorMsgDS.ErrMsgData ;
7267.0	51125	               %Subst(wkMsgDta: 31: 2) = %char(C3MINCNT);
7268.0	51125	               setCsrPos (PosC3MINCNT);
7269.0	51125	               putErrMsg (cInvMinPurchCnt : Msgf : sdPgm :
7270.0	51125	                             JobLang : wkmsgdta);
7271.0	50915	
7272.0	50915	
7273.0	51125	               // Total group minimum purchase qty cannot exceed minimum purchase qty of coupon.
7274.0	51125	          When ErrorMsgDS.ErrFieldName = 'minimumPurchaseCount' and
7275.0	51125	               ErrorMsgDS.ErrMessagID = cInvMinPurchCnt2;
7276.0	50915	
7277.0	51125	               ErrorFound = True;
7278.0	60601	               wkMsgDta = ErrorMsgDS.ErrMsgData ;
7279.0	51125	               %Subst(wkMsgDta: 31: 2) = %char(C3MINCNT);
7280.0	51125	               setCsrPos (PosC3MINCNT);
7281.0	51125	               putErrMsg (cInvMinPurchCnt2 : Msgf : sdPgm :
7282.0	51125	                             JobLang : wkmsgdta);
7283.0	50915	
7284.0	51028	
7285.0	51125	               // Coupon Minimum Purchase Count must be entered.
7286.0	51125	          When ErrorMsgDS.ErrFieldName = 'minimumPurchaseCount' ;
7287.0	51028	
7288.0	51125	               ErrorFound = True;
7289.0	51125	               wkMsgDta = ErrorMsgDS.ErrMsgData ;
7290.0	51125	               setCsrPos (PosC3MINCNT);
7291.0	51125	               PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
7292.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7293.0	50915	
7294.0	51125	               // Get free quantity must be valid.
7295.0	51125	          When ErrorMsgDS.ErrFieldName = 'getFreeCount' and
7296.0	51125	               ErrorMsgDS.ErrMessagID = cInvGetFreeCnt;
7297.0	50915	
7298.0	51125	               ErrorFound = True;
7299.0	51125	               wkMsgDta = 'Get Free Item Quantity';
7300.0	51125	               %Subst(wkMsgDta: 31: 2) = %char(C3FREECNT);
7301.0	51125	               setCsrPos (PosC3FREECNT);
7302.0	51125	               putErrMsg (cInvGetFreeCnt : Msgf : sdPgm :
7303.0	51125	                             JobLang : wkmsgdta);
7304.0	51028	
7305.0	51028	
7306.0	51125	               // Get free quantity must be valid.
7307.0	51125	          When ErrorMsgDS.ErrFieldName = 'getFreeCount' ;
7308.0	51028	
7309.0	51125	               ErrorFound = True;
7310.0	51125	               wkMsgDta = ErrorMsgDS.ErrMsgData ;
7311.0	51125	               setCsrPos (PosC3FREECNT);
7312.0	51125	               putErrMsg (ErrorMsgDS.ErrMessagID :Msgf : sdPgm :
7313.0	51125	                             JobLang : wkmsgdta);
7314.0	51006	
7315.0	51006	
7316.0	51125	               // Family Code must be valid.
7317.0	51125	          When ErrorMsgDS.ErrFieldName = 'posFamilyCode' and
7318.0	51125	               ErrorMsgDS.ErrMessagID = cInvFamilyCode;
7319.0	51006	
7320.0	51125	               ErrorFound = True;
7321.0	51125	               wkMsgDta = 'Family Code';
7322.0	51125	               %Subst(wkMsgDta: 31: 3) = %char(C3POSFMCD);
7323.0	51125	               setCsrPos (PosC3POSFMCD);
7324.0	51125	               PutErrMsg (cInvFamilyCode :MsgF
7325.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7326.0	51028	
7327.0	51028	
7328.0	51125	               // Family Code must be greater than zero
7329.0	51125	          When ErrorMsgDS.ErrFieldName = 'posFamilyCode';
7330.0	51028	
7331.0	51125	               ErrorFound = True;
7332.0	51125	               wkMsgDta = ErrorMsgDS.ErrMsgData ;
7333.0	51125	               setCsrPos (PosC3POSFMCD);
7334.0	51125	               PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
7335.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7336.0	50915	
7337.0	50915	
7338.0	51125	               // Coupon Margin Distribution Code must be entered.
7339.0	51125	          When ErrorMsgDS.ErrFieldName = 'marginDistributionCode' and
7340.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7341.0	50915	
7342.0	51125	               ErrorFound = True;
7343.0	51125	               wkMsgDta = 'Margin Distribution Code';
7344.0	51125	               setCsrPos (PosC3MRGNDSTCDE);
7345.0	51125	               PutErrMsg (Is_Required :MsgF
7346.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7347.0	50915	
7348.0	50915	
7349.0	51125	               // Coupon Margin Distribution Code must exist in OAR system.
7350.0	51125	          When ErrorMsgDS.ErrFieldName = 'marginDistributionCode' and
7351.0	51125	               ErrorMsgDS.ErrMessagID = Err_BadOpt;
7352.0	50915	
7353.0	51125	               ErrorFound = True;
7354.0	51125	               wkMsgDta = 'Margin Distribution Code';
7355.0	51125	               %Subst(wkMsgDta: 31: 5) = C3MRGNDSTC;
7356.0	51125	               setCsrPos (PosC3MRGNDSTCDE);
7357.0	51125	               PutErrMsg (Err_BadOpt :MsgF
7358.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7359.0	50915	
7360.0	50915	
7361.0	51125	               // Coupon Quantity Limit must be entered.
7362.0	51125	          When ErrorMsgDS.ErrFieldName = 'maximumPurchaseCount' and
7363.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7364.0	50915	
7365.0	51125	               ErrorFound = True;
7366.0	51125	               wkMsgDta = 'Quantity Limit';
7367.0	51125	               setCsrPos (PosC3MAXCNT);
7368.0	51125	               PutErrMsg (Is_Required :MsgF
7369.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7370.0	51028	
7371.0	51028	
7372.0	51125	               // Coupon Quantity Limit must greater than zero
7373.0	51125	          When ErrorMsgDS.ErrFieldName = 'maximumPurchaseCount' ;
7374.0	51028	
7375.0	51125	               ErrorFound = True;
7376.0	51125	               wkMsgDta = ErrorMsgDS.ErrMsgData ;
7377.0	51125	               setCsrPos (PosC3MAXCNT);
7378.0	51125	               PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
7379.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7380.0	50915	
7381.0	50915	
7382.0	51125	               // Coupon Allow Soft Week Indicator must be entered.
7383.0	51125	          When ErrorMsgDS.ErrFieldName = 'allowSoftWeekInd' and
7384.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7385.0	50915	
7386.0	51125	               ErrorFound = True;
7387.0	51125	               wkMsgDta = 'Allow SoftWeek';
7388.0	51125	               setCsrPos (PosC3SOFTWEEKIND);
7389.0	51125	               PutErrMsg (Is_Required :MsgF
7390.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7391.0	51017	
7392.0	51017	
7393.0	51125	               // Coupon Allow Soft Week Indicator must be valid.
7394.0	51125	          When ErrorMsgDS.ErrFieldName = 'allowSoftWeekInd' and
7395.0	51125	               ErrorMsgDS.ErrMessagID = cInvalidFlag;
7396.0	51017	
7397.0	51125	               ErrorFound = True;
7398.0	51125	               wkMsgDta = 'Allow SoftWeek';
7399.0	51125	               %Subst(wkMsgDta: 31: 1) = C3SOFTWKIN;
7400.0	51125	               setCsrPos (PosC3SOFTWEEKIND);
7401.0	51125	               putErrMsg (cInvalidFlag : Msgf : sdPgm :
7402.0	51125	                             JobLang : wkmsgdta);
7403.0	50915	
7404.0	50915	
7405.0	51125	               // Redemption Type must be entered.
7406.0	51125	          When ErrorMsgDS.ErrFieldName = 'redemptionType' and
7407.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7408.0	50915	
7409.0	51125	               ErrorFound = True;
7410.0	51125	               wkMsgDta = 'Redemption Type';
7411.0	51125	               setCsrPos (Posc3RdmpTnTyp);
7412.0	51125	               PutErrMsg (Is_Required :MsgF
7413.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7414.0	50915	
7415.0	50915	
7416.0	51125	               // Redemption Type must exist in the OAR system.
7417.0	51125	          When ErrorMsgDS.ErrFieldName = 'redemptionType' and
7418.0	51125	               ErrorMsgDS.ErrMessagID = Err_BadOpt;
7419.0	50915	
7420.0	51125	               ErrorFound = True;
7421.0	51125	               wkMsgDta = 'Redemption Type';
7422.0	51125	               %Subst(wkMsgDta: 31: 5) = C3RDMPTNTY;
7423.0	51125	               setCsrPos (PosC3RDMPTNTYP);
7424.0	51125	               PutErrMsg (Err_BadOpt :MsgF
7425.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7426.0	50915	
7427.0	50915	
7428.0	51125	               // Coupon tax code must be entered.
7429.0	51125	          When ErrorMsgDS.ErrFieldName = 'couponTaxCode' and
7430.0	51125	               ErrorMsgDS.ErrMessagID = Is_Required;
7431.0	50915	
7432.0	51125	               ErrorFound = True;
7433.0	51125	               wkMsgDta = 'Coupon Tax Code';
7434.0	51125	               setCsrPos (PosC3CPNTAXC);
7435.0	51125	               PutErrMsg (Is_Required :MsgF
7436.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7437.0	50915	
7438.0	50915	
7439.0	51125	               // Coupon Tax Code must exist in the OAR system.
7440.0	51125	          When ErrorMsgDS.ErrFieldName = 'couponTaxCode' and
7441.0	51125	               ErrorMsgDS.ErrMessagID = Err_BadOpt;
7442.0	50915	
7443.0	51125	               ErrorFound = True;
7444.0	60427	               wkMsgDta = ErrorMsgDS.ErrMsgData;
7445.0	60427	             //wkMsgDta = 'Coupon Tax Code';
7446.0	60427	             //%Subst(wkMsgDta: 31: 15) = C3CPNTAXC;
7447.0	51125	               setCsrPos (PosC3CPNTAXC);
7448.0	51125	               PutErrMsg (Err_BadOpt :MsgF
7449.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7450.0	50915	
7451.0	50915	
7452.0	51125	               // Coupon UPC must be valid in OAR system.
7453.0	51125	          When ErrorMsgDS.ErrFieldName = 'upcNumber' and
7454.0	51125	               ErrorMsgDS.ErrMessagID = Err_BadOpt;
7455.0	50915	
7456.0	51125	               ErrorFound = True;
7457.0	51125	               wkMsgDta = 'Coupon UPC Number';
7458.0	51125	               %Subst(wkMsgDta: 31: 13) = %char(C3UPCNBR);
7459.0	51125	               setCsrPos (PosC3UPCNBR);
7460.0	51125	               PutErrMsg (Err_BadOpt :MsgF
7461.0	51125	                          :sdPgm :JobLang :wkMsgDta);
7462.0	50915	
7463.0	60109	
7464.0	60109	               // Item entered for coupon is already linked to a coupon.
7465.0	60109	          When ErrorMsgDS.ErrFieldName = 'itemNumber' and
7466.0	60109	               ErrorMsgDS.ErrMessagID = cItemLinkedToCoupon ;
7467.0	60109	
7468.0	60110	               ErrorFound = True;
7469.0	60109	               %Subst(wkMsgDta :1 :30) =
7470.0	60109	                  %trim(errorMsgDS.errMsgData);
7471.0	60109	               itemInError =
7472.0	60109	                %dec(%trim(%SUBST(errorMsgDS.errMsgData :1:10)):9:0);
7473.0	60109	               PutErrMsg (ErrorMsgDS.ErrMessagID :MsgF
7474.0	60109	                          :sdPgm :JobLang :wkMsgDta);
7475.0	60511	               updateSubfile3 ();
7476.0	60109	
7477.0	51125	          endsl;
7478.0	50914	
7479.0	51125	          indx += 1;
7480.0	51125	          %occur(ErrorMsgDS) = indx;
7481.0	50914	
7482.0	50914	        enddo;
7483.0	60109	
7484.0	50914	        return;
7485.0	50914	      /end-free
7486.0	50914	     P CheckCouponMsgs...
7487.0	50914	     P                 E
7488.0	50914	
7489.0	50914	
7490.0	50916	      // =======================================================================
7491.0	50916	      // Setup Environment
7492.0	50916	      // =======================================================================
7493.0	50916	     P SetEnvironment...
7494.0	50916	     P                 B
7495.0	50916	     D SetEnvironment...
7496.0	50916	     D                 PI             1n
7497.0	50916	     D   PrFunction                        Like(Function) const
7498.0	50916	      // =======================================================================
7499.0	50916	      // - Variables -
7500.0	50916	      // =======================================================================
7501.0	50916	      /free
7502.0	50916	
7503.0	50916	       clear function;
7504.0	50916	       clear Oar_ptra;
7505.0	51018	       clear *all ErrorMsgDS;
7506.0	50916	
7507.0	50916	       Operator  = *Blanks;
7508.0	50916	       Function  = prFunction;
7509.0	50916	       clear Oar_ptra;
7510.0	50916	       MsgDtaPtr = %addr(ErrorMsgDS);
7511.0	50916	
7512.0	50916	       SwCallStatus = CouponMWInterface(
7513.0	50916	                       Operator:
7514.0	50916	                       Function:
7515.0	50916	                       Oar_Ptra:
7516.0	50916	                       PrRecOption:
7517.0	50916	                       wkReq#ofrows:
7518.0	50916	                       wkAct#ofrows:
7519.0	50916	                       MsgDtaPtr);
7520.0	50916	
7521.0	50916	        return TRUE;
7522.0	50916	      /end-free
7523.0	50916	
7524.0	50916	     P SetEnvironment...
7525.0	50916	     P                 E
7526.0	50920	
7527.0	50920	
7528.0	50920	       //========================================================================
7529.0	50920	       // Get the data from the dtaq input from the prompt program              *
7530.0	50920	       //========================================================================
7531.0	50920	     P getDtaQData     B
7532.0	50921	     D getDtaQData     PI
7533.0	50920	
7534.0	50921	     D firstRec        S              1n   INZ(True)
7535.0	50921	     D wkCsrRrn        S                   like(csrRrn) Inz
7536.0	50921	
7537.0	50920	      /free
7538.0	50921	
7539.0	51013	       dqName = 'CPNITMDTAQ';
7540.0	51013	
7541.0	61108	       IF CheckObject(dqName + dqLibrary) <> ObjNotFound;
7542.0	50921	         wkCsrRrn = csrRrn;
7543.0	50921	
7544.0	50921	         DoU dqData = *blanks and
7545.0	50921	             RrnS03 < cMaxRRN;
7546.0	50921	
7547.0	50921	           clear dqData;
7548.0	50921	
7549.0	50921	           CallP QRCVDTAQ(dqName: dqLibrary: dqRcvLen:
7550.0	50921	                          dqData: *Zero);
7551.0	50921	
7552.0	61108	           IF dqData <> *blanks;
7553.0	50921	
7554.0	61108	             IF wkCsrRrn <= svRrnS03;
7555.0	51010	               chain(e) wkCsrRrn s03;
7556.0	50922	               s3ItmNbr = %dec(%trim(%SUBST(dqData :1:9)):9:0);
7557.0	50922	               s3itdes1 = %SUBST(dqData :10 :40);
7558.0	61108	               IF firstRec;
7559.0	50921	                 SetCsrPos(PosS3ItmPmt);
7560.0	50921	                 firstRec = FALSE;
7561.0	50921	                 C3DSPR = CsrRrn;
7562.0	61108	               ENDIF;
7563.0	50921	               update s03;
7564.0	50921	             else;
7565.0	50921	               RrnS03 += 1;
7566.0	50921	               CntLnesS03 += 1;
7567.0	61108	               IF CntLnesS03 = 1;
7568.0	50921	                 CsrStart=RrnS03;
7569.0	61108	               ENDIF;
7570.0	50921	               //  Load SFL fields
7571.0	50921	               CLEAR S03;
7572.0	50921	               ProtItmNbr = FALSE;
7573.0	61108	               IF firstRec;
7574.0	50921	                 SetCsrPos(PosS3ItmPmt);
7575.0	50921	                 firstRec = FALSE;
7576.0	50921	                 C3DSPR = CsrRrn;
7577.0	61108	               ENDIF;
7578.0	50921	               s3Mode   = AddMode;
7579.0	50922	               s3ItmNbr = %dec(%trim(%SUBST(dqData :1:9)):9:0);
7580.0	50922	               s3itdes1 = %SUBST(dqData :10 :40);
7581.0	50922	               s3FITF = No;
7582.0	50921	
7583.0	50921	               Write S03;
7584.0	61108	             ENDIF;
7585.0	50921	
7586.0	50921	             wkCsrRrn += 1;
7587.0	61108	           ENDIF;
7588.0	50921	
7589.0	50921	         EndDo;
7590.0	50922	
7591.0	61108	         // Add one blank subfile line IF page hasn't been filled
7592.0	61108	         IF %Rem(RrnS03:2) <> *zeros
7593.0	50922	           and RrnS03 > SvRrnS03;
7594.0	50922	           RrnS03 = RrnS03 + 1;
7595.0	50922	           CLEAR S03;
7596.0	50922	           s3Mode = AddMode;
7597.0	50922	           s3FITF = No;
7598.0	50922	           Write S03;
7599.0	61108	         ENDIF;
7600.0	50922	
7601.0	61108	         IF RrnS03 > SvRrnS03;
7602.0	50922	           SvRrnS03 = RrnS03;
7603.0	61108	         ENDIF;
7604.0	61108	       ENDIF;
7605.0	50921	
7606.0	50920	      /end-free
7607.0	50920	     P getDtaQData     E
7608.0	51013	
7609.0	51013	
7610.0	51013	       //========================================================================
7611.0	51013	       // Get the data from the dtaq input from the prompt program              *
7612.0	51013	       //========================================================================
7613.0	51013	     P getContractDtaQData...
7614.0	51013	     P                 B
7615.0	51013	     D getContractDtaQData...
7616.0	51013	     D                 PI
7617.0	51013	
7618.0	51013	     D firstRec        S              1n   INZ(True)
7619.0	51013	     D wkCsrRrn        S                   like(csrRrn) Inz
7620.0	51013	
7621.0	51013	      /free
7622.0	51013	
7623.0	51013	       dqName = 'CPNCNTDTAQ';
7624.0	51013	
7625.0	61108	       IF CheckObject(dqName + dqLibrary) <> ObjNotFound;
7626.0	51013	         wkCsrRrn = csrRrn;
7627.0	51013	
7628.0	51013	         DoU dqData = *blanks and
7629.0	51013	             RrnS03 < cMaxRRN;
7630.0	51013	
7631.0	51013	           clear dqData;
7632.0	51013	
7633.0	51013	           CallP QRCVDTAQ(dqName: dqLibrary: dqRcvLen:
7634.0	51013	                          dqData: *Zero);
7635.0	51013	
7636.0	61108	           IF dqData <> *blanks;
7637.0	51013	
7638.0	61108	             IF wkCsrRrn <= svRrnS02;
7639.0	51013	               chain(e) wkCsrRrn s02;
7640.0	51013	               s2ContId = %dec(%trim(%SUBST(dqData :1:9)):9:0);
7641.0	51014	               sflNxtChg1 = True;
7642.0	61108	               IF firstRec;
7643.0	51013	                 SetCsrPos(PosS3ItmPmt);
7644.0	51013	                 firstRec = FALSE;
7645.0	51013	                 C2DSPR = CsrRrn;
7646.0	61108	               ENDIF;
7647.0	51013	               update s02;
7648.0	51026	               RrnS02 = SvRrnS02;
7649.0	51013	             else;
7650.0	51013	               RrnS02 += 1;
7651.0	51013	               CntLnesS02 += 1;
7652.0	61108	               IF CntLnesS02 = 1;
7653.0	51013	                 CsrStart=RrnS02;
7654.0	61108	               ENDIF;
7655.0	51013	               //  Load SFL fields
7656.0	51013	               CLEAR S02;
7657.0	61108	               IF firstRec;
7658.0	51013	                 SetCsrPos(PosS2ContId);
7659.0	51013	                 firstRec = FALSE;
7660.0	51013	                 C2DSPR = CsrRrn;
7661.0	61108	               ENDIF;
7662.0	51013	               s2Mode   = AddMode;
7663.0	51013	               s2ContId = %dec(%trim(%SUBST(dqData :1:9)):9:0);
7664.0	51014	               sflNxtChg1 = True;
7665.0	51013	
7666.0	51013	               Write S02;
7667.0	61108	             ENDIF;
7668.0	51013	
7669.0	51013	             wkCsrRrn += 1;
7670.0	61108	           ENDIF;
7671.0	51013	
7672.0	51013	         EndDo;
7673.0	51020	
7674.0	61108	         // Add one blank subfile line IF page hasn't been filled
7675.0	61108	         IF %Rem(RrnS02:2) <> *zeros
7676.0	51026	           and RrnS02 > SvRrnS02;
7677.0	51020	           RrnS02 = RrnS02 + 1;
7678.0	51020	           CLEAR S02;
7679.0	51020	           s2Mode = AddMode;
7680.0	51020	           Write S02;
7681.0	61108	         ENDIF;
7682.0	51020	
7683.0	61108	         IF RrnS02 > SvRrnS02;
7684.0	51020	           SvRrnS02 = RrnS02;
7685.0	61108	         ENDIF;
7686.0	51013	
7687.0	61108	       ENDIF;
7688.0	51013	
7689.0	51013	      /end-free
7690.0	51013	     P getContractDtaQData...
7691.0	51013	     P                 E
7692.0	50916	
7693.0	50921	
7694.0	50921	      // Procedure CheckObject:
7695.0	50921	      // =======================================================================
7696.0	50921	      // This procedure is used to check existence of Data Queue object.
7697.0	50921	      // =======================================================================
7698.0	50921	     P CheckObject     B
7699.0	50921	     D CheckObject     PI             7                                         Check Object
7700.0	61108	     D  Object                       20    CONST                                   QualIFied object
7701.0	50921	      * Stand alone field
7702.0	61108	     D wkObject        S                   LIKE(Object)                         QualIFied object
7703.0	50921	      /free
7704.0	50921	
7705.0	50921	        wkObject = Object;
7706.0	50921	
7707.0	61108	        IF %SUBST(Object :11 :10) = *Blank;
7708.0	50921	            %SUBST(wkObject :11 :5) = '*LIBL';
7709.0	61108	        ENDIF;
7710.0	50921	
7711.0	50921	        Return  ProcessCmd('CHKOBJ OBJ(' +
7712.0	50921	                %TRIM(%SUBST(wkObject :11 :10)) +
7713.0	50921	                '/' + %TRIM(%SUBST(wkObject :1 :10))
7714.0	50921	                  + ') OBJTYPE(*DTAQ)');
7715.0	50921	
7716.0	50921	      /end-free
7717.0	50921	     P CheckObject     E
7718.0	50921	
7719.0	50921	
7720.0	50921	      // =======================================================================
7721.0	50921	      // Procedure ProcessCmd:
7722.0	50921	      // =======================================================================
7723.0	50921	      // This procedure is used to invoke the API to create Data Queue.
7724.0	50921	      // =======================================================================
7725.0	50921	     P ProcessCmd      B
7726.0	50921	     D ProcessCmd      PI             7                                         Process command
7727.0	50921	     D  Command                     100    CONST                                   Command string
7728.0	50921	      *-----------------
7729.0	50921	      * Data structures
7730.0	50921	      *     Options control block for QCAPCMD
7731.0	50921	     D ocBlock         DS            20                                         Option control block
7732.0	50921	     D  ocBType                      10I 0 INZ(*ZERO)     OVERLAY(ocBlock :1)    Type of cmd process
7733.0	50921	     D  ocBOptions                    7    INZ('020    ') OVERLAY(ocBlock :5)    Ctrl block options
7734.0	50921	     D  ocBRsrvd                      9    INZ(*LoVal)    OVERLAY(ocBlock :12)   Reserved
7735.0	50921	      *------------------
7736.0	50921	      * Stand alone fields
7737.0	50921	      *     Character
7738.0	50921	     D FCommand        S            100    INZ                                  Command string
7739.0	50921	     D FCmdLen         S             10I 0 INZ(*ZERO)                           Command length
7740.0	50921	     D FocBLen         S             10I 0 INZ(*ZERO)                           Opt Ctl Block length
7741.0	50921	     D FFormat         S              8A   INZ('CPOP0100')                      Format
7742.0	50921	     D ChgCmdStr       S            100                                         Changed cmd string
7743.0	50921	      *     Numeric
7744.0	50921	     D AvalChgCmd      S             10I 0 INZ(*ZERO)                           Cmd length to return
7745.0	50921	     D LenChgCmd       S             10I 0                                      Cmd length returned
7746.0	50921	      *-------------------------------------------------------------------------
7747.0	50921	      /free
7748.0	50921	
7749.0	50921	       APIErr.ErrMsg = *Blank;
7750.0	50921	       FCommand = Command;
7751.0	50921	       FCmdLen = %Len(FCommand);
7752.0	50921	       FocBLen = %Len(ocBlock);
7753.0	50921	       CALLP     QCapCmd(FCommand :FCmdLen :ocBlock
7754.0	50921	                         :FocBLen :FFormat :ChgCmdStr
7755.0	50921	                         :AvalChgCmd :LenChgCmd :APIErr);
7756.0	50921	       Return APIErr.ErrMsg;
7757.0	50921	
7758.0	50921	      /end-free
7759.0	50921	     P ProcessCmd      E
7760.0	50921	
7761.0	51026	
7762.0	51026	      // =======================================================================
7763.0	51026	      // Procedure Load Coupon Group:
7764.0	51026	      // =======================================================================
7765.0	51026	      // This procedure will load Coupon Group
7766.0	51026	      // =======================================================================
7767.0	51026	     P LoadCouponGroup...
7768.0	51026	     P                 B
7769.0	51026	     D LoadCouponGroup...
7770.0	51026	     D                 PI
7771.0	51118	
7772.0	51118	     D GrpCpnId        S                   like(wkCpnId) Inz
7773.0	51026	      /free
7774.0	51026	
7775.0	51026	         reset w4GrpId;
7776.0	51026	         Reset w4Grp#;
7777.0	51026	         Reset w4POSGrp#;
7778.0	51026	         Clear w4gmpq;
7779.0	61108	         Clear w4gmpq2;
7780.0	61108	         Clear w4OldRcd;
7781.0	51026	         Clear w4Mode;
7782.0	51026	         Clear w4GrpIndex;
7783.0	51026	
7784.0	51026	         //  Load subfile a page at a time   bernie-change move constat
7785.0	51026	         DoU cReqRows <> wkAct#ofrows;
7786.0	51026	
7787.0	61108	           IF EnOpt = OptCpy;
7788.0	51118	             grpCpnId = wkCpnId;
7789.0	51118	           else;
7790.0	51118	             grpCpnId = c2CpnId;
7791.0	61108	           ENDIF;
7792.0	51118	
7793.0	61108	           IF w4GrpIndex = 0;
7794.0	80916	             wkAct#ofRows = GetCouponGroup(grpCpnId :EQUALG);
7795.0	51118	           else;
7796.0	80916	             wkAct#ofRows = GetCouponGroup(grpCpnId :NEXT);
7797.0	61108	           ENDIF;
7798.0	51026	
7799.0	51026	           For wkINDEX = 1 to wkAct#ofrows;
7800.0	51026	             %occur(CouponGroupDS) = wkINDEX;
7801.0	51026	             w4GrpIndex += 1;
7802.0	61108	             IF EnOpt = OptCpy;
7803.0	51118	               w4Mode(w4GrpIndex)  = AddMode;
7804.0	51118	             else;
7805.0	51118	               w4Mode(w4GrpIndex)  = ChgMode;
7806.0	61108	             ENDIF;
7807.0	51118	             w4GrpID(w4GrpIndex)   = CouponGroupDS.CouponGroupID;
7808.0	61108	             w4Gmpq(w4GrpIndex)    = CouponGroupDS.GroupMinPurQuantity;
7809.0	61108	             w4Gmpq2(w4GrpIndex)   = CouponGroupDS.GroupMinPurQuantity;
7810.0	51118	             w4POSGrp#(w4GrpIndex) = CouponGroupDS.CouponGroupNumber;
7811.0	51118	             w4Grp#(w4GrpIndex)    = w4GrpIndex;
7812.0	61108	             w4OldRcd(w4GrpIndex)  = True;
7813.0	51026	           EndFor;
7814.0	51026	
7815.0	51026	         EndDo;
7816.0	51026	
7817.0	51026	      /end-free
7818.0	51026	
7819.0	51026	     P LoadCouponGroup...
7820.0	51026	     P                 E
7821.0	60223	
7822.0	60223	
7823.0	60223	      // =======================================================================
7824.0	60223	      // Procedure Reset Contracts:
7825.0	60223	      // =======================================================================
7826.0	60223	      // This procedure will reset the contracts after a rollback
7827.0	60223	      // =======================================================================
7828.0	60223	     P resetContracts  B
7829.0	60223	     D resetContracts  PI
7830.0	60223	     D   PrMode                            Like(s2Mode) const
7831.0	60223	
7832.0	60223	     D chkIndx         S                   like(typeIndex) Inz
7833.0	60223	      /free
7834.0	60223	
7835.0	60223	       chkIndx = 1;
7836.0	60223	       dow rollbackCnt#(chkIndx) <> *hival;
7837.0	61108	         IF rollbackCnt#(chkIndx) <> *loval and
7838.0	60223	            rollbackMode(chkIndx) = DltMode;
7839.0	60223	           Clear CpnCntAscDS;
7840.0	60223	           CpnCntAscDS.KeyFieldId = rollbackCnt#(chkIndx);
7841.0	60223	           RecOption = cApplyBR;
7842.0	80916	           IF not PutCouponContractAssoc(DELETE:
7843.0	60223	                                         RecOption:
7844.0	60223	                                         CpnCntAscDS);
7845.0	60223	             UpdFailedFlag = True;
7846.0	61108	           ENDIF;
7847.0	61108	         ENDIF;
7848.0	60223	
7849.0	61108	         IF rollbackCnt#(chkIndx) <> *loval and
7850.0	60223	            rollbackMode(chkIndx) = AddMode and
7851.0	60223	            prMode <> DltMode;
7852.0	60223	           Clear CpnCntAscDS;
7853.0	60223	           CpnCntAscDS.CouponId = c2CpnId;
7854.0	60223	           CpnCntAscDS.ContractId = rollbackCnt#(chkIndx);
7855.0	60223	           CpnCntAscDS.StatusCode = cActive;
7856.0	60223	           RecOption = cApplyBR;
7857.0	61108	           IF not PutCouponContractAssoc(AddMode:
7858.0	60223	                                         RecOption:
7859.0	60223	                                         CpnCntAscDS);
7860.0	60223	              UpdFailedFlag = True;
7861.0	61108	           ENDIF;
7862.0	60503	         //rollbackCnt#(chkIndx) = *loval;
7863.0	60503	         //rollbackMode(chkIndx) = *blanks;
7864.0	61108	         ENDIF;
7865.0	60223	         chkIndx += 1;
7866.0	60223	       Enddo;
7867.0	60223	
7868.0	60223	      /end-free
7869.0	60223	
7870.0	60223	     P resetContracts  E
7871.0	91215	
7872.0	91215	      // =======================================================================
7873.0	91215	      // get tax code
7874.0	91215	      // =======================================================================
7875.0	91215	      // Calls Middleware to get default Tax Code
7876.0	91215	      // =======================================================================
7877.0	91215	     P getDefaultTaxCode...
7878.0	91215	     P                 B
7879.0	91215	     D getDefaultTaxCode...
7880.0	91216	     D                 PI
7881.0	91215	      // =======================================================================
7882.0	91215	      // - Variables -
7883.0	91215	      // =======================================================================
7884.0	91215	
7885.0	91215	      /free
7886.0	91215	        clear function;
7887.0	91215	        clear Oar_ptra;
7888.0	91215	        clear *all ErrorMsgDS;
7889.0	91215	        PrRecOption = *blanks;
7890.0	91215	        wkReq#ofrows = 0;
7891.0	91215	        wkAct#ofrows = 0;
7892.0	91215	
7893.0	91216	        operator = EQUAL;
7894.0	91215	
7895.0	91215	        Function = 'ITEMTAX';
7896.0	91215	
7897.0	91215	        clear *all cntItemTaxCdeDS;
7898.0	91215	        %occur(cntItemTaxCdeDS) = 1;
7899.0	91215	        xCouponID = c2CpnId;
7900.0	91216	        wkReq#OfRows = 1;
7901.0	91215	
7902.0	91215	        Oar_ptra = %addr(cntItemTaxCdeDS);
7903.0	91215	
7904.0	91215	        MsgDtaPtr = %addr(ErrorMsgDS);
7905.0	91215	
7906.0	91215	        SwCallStatus = CouponMWInterface(
7907.0	91215	                       Operator:
7908.0	91215	                       Function:
7909.0	91215	                       OAR_PTRA:
7910.0	91215	                       PrRecOption:
7911.0	91215	                       wkReq#ofrows:
7912.0	91215	                       wkAct#ofrows:
7913.0	91215	                       MsgdtaPtr);
7914.0	91215	
7915.0	91216	       Return;
7916.0	91215	
7917.0	91215	      /end-free
7918.0	91215	     P getDefaultTaxCode...
7919.0	91215	     P                 E
7920.0	50916	
7921.0	100920	      // ============================================================================
7922.0	100920	      // Procedure checkOverlap:
7923.0	100920	      // ============================================================================
7924.0	100920	      //
7925.0	100920	      // ============================================================================
7926.0	100920	     P checkOverlap...
7927.0	100920	     P                 B
7928.0	100920	     D checkOverlap...
7929.0	100920	     D                 PI
7930.0	100920	
7931.0	100920	     D displayOverlap...
7932.0	100920	     D                 PR                  ExtPgm('OACP1070R')
7933.0	100920	     D  outKeyPressed                      like(typeFunctionKey)options(*nopass)
7934.0	100920	     D  inContractId                       like(typeCouponId)   options(*nopass)
7935.0	100920	     D  inCouponID                         like(typeCouponId)   options(*nopass)
7936.0	100920	     D  inItemNumber                       like(typeCouponId)   options(*nopass)
7937.0	100922	
7938.0	100922	     D displayItemWithMultipleLinks...
7939.0	100922	     D                 PR                  extpgm('OAR0410')
7940.0	100920	     D  outKeyPressed                 1a
7941.0	100920	     D                                     options(*nopass : *omit)
7942.0	100920	     D  inCompanyNumber...
7943.0	100920	     D                                3P 0 options(*nopass : *omit) const
7944.0	100920	     D  inItemNumber...
7945.0	100920	     D                                9P 0 options(*nopass : *omit) const
7946.0	100920	     D  inDepartmentNumber...
7947.0	100920	     D                                3P 0 options(*nopass : *omit) const
7948.0	100920	     D  inFamilyCode...
7949.0	100920	     D                                3P 0 options(*nopass : *omit) const
7950.0	100920	     D  inCouponId...
7951.0	100920	     D                                9P 0 options(*nopass : *omit) const
7952.0	100920	     D  inContractId...
7953.0	100920	     D                                9P 0 options(*nopass : *omit) const
7954.0	100920	
7955.0	100920	     D keyPressed      S              1A   inz
7956.0	100920	     D contractId      S              9B 0 inz
7957.0	100920	     D couponId        S              9B 0 inz
7958.0	100920	     D itemNumber      S              9B 0 inz
7959.0	100920	     D companyNumber   S              3P 0 inz
7960.0	100920	
7961.0	100920	      /free
7962.0	100920	
7963.0	100920	         couponId = c3CpnID;
7964.0	100920	         displayOverlap (keyPressed :contractId
7965.0	100920	                         :couponId  :itemNumber);
7966.0	100920	
7967.0	100920	         companyNumber = c3cmynbr;
7968.0	100922	         displayItemWithMultipleLinks
7969.0	100923	           (keyPressed : companyNumber : *omit : *omit : *omit :
7970.0	100922	            couponId : *omit);
7971.0	100920	
7972.0	100920	       return ;
7973.0	100920	      /end-free
7974.0	100920	     P checkOverlap...
7975.0	100920	     P                 E
7976.0	250123	      // ----------------------------------------------------------------------*
7977.0	250123	      // - Internal Procedures                                                 *
7978.0	250123	      // ----------------------------------------------------------------------*
7979.0	250123	      // =======================================================================
7980.0	250303	      // This procedure is used to add items to the coupon based on Category.  *
7981.0	250123	      // =======================================================================
7982.0	250123	     P MaintainCategory...
7983.0	250123	     P                 B
7984.0	250123	     D MaintainCategory...
7985.0	250123	     D                 PI
7986.0	250123	      /free
7987.0	250218	       clear R07;
7988.0	250227	       exec sql
7989.0	250227	       SELECT DDDESL into :wkdeptdesc
7990.0	250227	       FROM INDDESP WHERE DDDEPT = :c3POSDept;
7991.0	250130	       dow not SetCatStat ;
7992.0	250123	         displayScreen7 ();
7993.0	250123	         testUserAction7 ();
7994.0	250211	         if wkExitScrn ;
7995.0	250211	            Leave;
7996.0	250211	         endif;
7997.0	250130	       enddo;
7998.0	250123	       return;
7999.0	250123	      /end-free
8000.0	250123	     P MaintainCategory...
8001.0	250123	     P                 E
8002.0	250123	
8003.0	250123	      // =======================================================================
8004.0	250303	      // Procedure displayScreen7:
8005.0	250123	      // =======================================================================
8006.0	250303	      // This procedure is used to display the screen  R07.
8007.0	250123	      // =======================================================================
8008.0	250123	     P displayScreen7  B
8009.0	250123	     D displayScreen7  PI
8010.0	250123	      /free
8011.0	250128	       r7Dept =c3POSDept ;
8012.0	250227	       r7DeptD =wkdeptdesc;
8013.0	250213	       exfmt R07 ;
8014.0	250123	
8015.0	250123	       return;
8016.0	250123	      /end-free
8017.0	250123	     P displayScreen7  E
8018.0	250123	      // =======================================================================
8019.0	250123	      // Procedure testUserAction7:
8020.0	250123	      // =======================================================================
8021.0	250123	      // This procedure is used as test what function key was pressed by the
8022.0	250123	      // user and to execute the corresponding action.
8023.0	250123	      // =======================================================================
8024.0	250123	     P testUserAction7...
8025.0	250123	     P                 B
8026.0	250123	     D testUserAction7...
8027.0	250123	     D                 PI
8028.0	250123	
8029.0	250123	      /free
8030.0	250123	       resetErrors ();
8031.0	250123	
8032.0	250123	         select;
8033.0	250123	         when keyPressed = F_CANCEL;
8034.0	250211	           wkExitScrn =TRUE;
8035.0	250211	         WHEN KeyPressed = F_Exit;
8036.0	250211	           wkExitScrn =TRUE;
8037.0	250211	           EndPgm = True;
8038.0	250211	         WHEN KeyPressed = F_Refresh;
8039.0	250214	           clear R07;
8040.0	250123	         when keyPressed = F_ENTER;
8041.0	250127	            Category3s = %Trim(R7Cat3a) + %Trim(R7Cat3b) + %Trim(R7Cat3c) +
8042.0	250127	                         %Trim(R7Cat3d) + %Trim(R7Cat3e) + %Trim(R7Cat3f) +
8043.0	250127	                         %Trim(R7Cat3g) + %Trim(R7Cat3h) + %Trim(R7Cat3i) +
8044.0	250127	                         %Trim(R7Cat3j);
8045.0	250226	             if R7Cat1 = *Blank or   R7Cat2 = *Blank or
8046.0	250127	                Category3s = *Blank;
8047.0	250218	                select;
8048.0	250218	                when  R7Cat1 = *Blanks;
8049.0	250218	                   setCsrPos (PosR7CAT1FLG);
8050.0	250218	                when  R7Cat2 = *Blanks;
8051.0	250218	                   setCsrPos (PosR7CAT2FLG);
8052.0	250218	                when  Category3s = *Blanks;
8053.0	250218	                   setCsrPos (PosR7CAT3AFLG);
8054.0	250218	                endsl;
8055.0	250127	             else;
8056.0	250130	               validateInput7 ();
8057.0	250130	               if SetCatStat;
8058.0	250203	               declareC1csr();
8059.0	250130	               screenAction = LOAD_SCREEN;
8060.0	250130	               processScreen8();
8061.0	250130	               endif;
8062.0	250127	
8063.0	250127	             endif;
8064.0	250123	         endsl;
8065.0	250123	
8066.0	250123	       return;
8067.0	250123	      /end-free
8068.0	250123	     P testUserAction7...
8069.0	250123	     P                 E
8070.0	250123	
8071.0	250127	       // =======================================================================
8072.0	250127	       // Procedure validateInput7:
8073.0	250127	       // =======================================================================
8074.0	250127	       // Check if entries are valid
8075.0	250127	       // This procedure is used to set category data.
8076.0	250127	       // =======================================================================
8077.0	250127	     P validateInput7  B
8078.0	250127	     D validateInput7  PI
8079.0	250209	     D WhereClause     S           1000A   inz(' ')
8080.0	250209	      /free
8081.0	250209	
8082.0	250209	          // Validate Coupon Item Category data.
8083.0	250303	       ErrorFound = False;
8084.0	250209	         //Insert statement.
8085.0	250209	       SetItemsWithCategories =
8086.0	250209	       'insert into COUPONITEMASSOCIATION +
8087.0	250209	        (CPNID,  +
8088.0	250209	         CMPYNBR, +
8089.0	250209	         ITEMNBR, +
8090.0	250209	         CHGUSER, +
8091.0	250209	         CHGSTAMP, +
8092.0	250209	         ASSTYPID, +
8093.0	250209	         STSCDEID) +
8094.0	250209	         (select distinct +
8095.0	250209	         (select COUPONID from couponMaster  +
8096.0	250210	         where trim(char(couponid))= ' +
8097.0	250210	          '''' + %char(wkCpnId) + '''' + ' )' +
8098.0	250210	         ',a.imCmpy ,a.imItem,' + ''''+c3ChgUser +'''' +
8099.0	250210	         ' , current timestamp , 1, +
8100.0	250210	         (select stscdeId from oastscdetp where code =  +
8101.0	250210	          ' + '''' + 'ACT' + '''' + ') +
8102.0	250209	         from INITMMP a  inner join INVITMP b  on a.imitem = b.viitem +
8103.0	250209	         left exception join COUPONITEMASSOCIATION c  +
8104.0	250210	         on  c.Itemnbr =a.imitem  and char(c.Cpnid) = '
8105.0	250210	         + ''''+ %char(wkCpnId)+'''' ;
8106.0	250209	        //Where Clause.
8107.0	250210	       WhereClause = 'WHERE (a.imcmpy = 1 and char(a.imdept) ='+
8108.0	250210	                      ''''+%char(r7Dept)+'''' +
8109.0	250210	                      ' and a.IMCAT1 =' + ''''+r7Cat1+'''' +
8110.0	250210	                      ' and a.IMCAT2 = '+ ''''+r7Cat2+''''+
8111.0	250210	                      ')';
8112.0	250210	
8113.0	250210	       if Category3s = '*';
8114.0	250209	         WhereClause = %trim(WhereClause) + ')';
8115.0	250209	         SqlStatement = %trim(SetItemsWithCategories) + ' ' +
8116.0	250210	                             %trim(WhereClause) ;
8117.0	250209	
8118.0	250210	       else;
8119.0	250209	
8120.0	250209	       For  x = 1 to 10;
8121.0	250210	          If %Subst(Category3s:x:1) <> *Blank;
8122.0	250210	            Category3b =%Subst(Category3s:x:1);
8123.0	250209	            If x = 1;
8124.0	250210	            WhereClause = %trim(WhereClause) +
8125.0	250210	             ' and (a.IMCAT3  = ' + '''' + Category3b +''''  ;
8126.0	250209	            else;
8127.0	250210	            WhereClause = %trim(WhereClause) +
8128.0	250210	            ' or a.IMCAT3 = ' + '''' +Category3b +'''' ;
8129.0	250210	            endif;
8130.0	250209	          endif;
8131.0	250209	
8132.0	250209	       endfor;
8133.0	250209	       WhereClause = %trim(WhereClause) +
8134.0	250209	                    '))';
8135.0	250209	         SqlStatement = %trim(SetItemsWithCategories) + ' ' +
8136.0	250210	                             %trim(WhereClause) ;
8137.0	250210	       endif;
8138.0	250209	
8139.0	250303	       SetCatStat = loadCategory ();
8140.0	250303	       return;
8141.0	250127	       /end-free
8142.0	250127	     P validateInput7  E
8143.0	250127	      // =======================================================================
8144.0	250127	      // Procedure LoadCategory:
8145.0	250127	      // ================================================================================
8146.0	250127	      // This procedure is used to move Data entry info to Category Data Structure.
8147.0	250127	      // ================================================================================
8148.0	250127	     P LoadCategory    B
8149.0	250130	     D LoadCategory    PI                  Like(SwCallStatus)
8150.0	250127	      /free
8151.0	250210	       exec sql
8152.0	250210	        EXECUTE IMMEDIATE :sqlStatement;
8153.0	250130	       select;
8154.0	250130	
8155.0	250130	       when sqlCode = SQL_SUCCESSFUL;
8156.0	250130	       return TRUE;
8157.0	250130	
8158.0	250130	       when sqlCode = END_OF_CURSOR;
8159.0	250218	       r7Warn =cNoItemsFound;
8160.0	250130	       return FALSE;
8161.0	250130	
8162.0	250130	       other;
8163.0	250304	         r7Warn =cErrinItmFtch;
8164.0	250304	         return FALSE;
8165.0	250204	         putSQLDiagnostics(SdPgm : %addr(SQLCA) :
8166.0	250204	                             'LoadCategory' : FALSE);
8167.0	250130	       endsl;
8168.0	250127	      /end-free
8169.0	250127	     P LoadCategory    E
8170.0	250127	
8171.0	250127	      // =======================================================================
8172.0	250129	      // =======================================================================
8173.0	250303	      // Procedure declareC1csr:
8174.0	250129	      // ================================================================================
8175.0	250303	      // This procedure is used to declare cursor over OACPNITMP,INITMMP AND OASTSCDETP.
8176.0	250129	      // ================================================================================
8177.0	250129	     P declareC1csr    B
8178.0	250129	     D declareC1csr    PI
8179.0	250129	      /free
8180.0	250129	       exec sql
8181.0	250129	       declare c1Csr asensitive no scroll cursor
8182.0	250129	       with hold for
8183.0	250206	       SELECT distinct a.itemnumber,c.code,B.imdes1  from
8184.0	250130	       COUPONITEMASSOCIATION a inner join INITMMP b on b.imItem =a.itemnbr
8185.0	250303	       and b.imCmpy =a.cmpynbr inner join OASTSCDETP c on a.stscdeId =
8186.0	250130	       c.stscdeid where a.cpnid = :wkCpnId
8187.0	250129	       for fetch only
8188.0	250303	       optimize for 17 rows;
8189.0	250129	       return;
8190.0	250129	      /end-free
8191.0	250129	     P declareC1csr    E
8192.0	250129	      // =======================================================================
8193.0	250130	      //Procedure processScreen8:
8194.0	250129	      // =======================================================================
8195.0	250303	      // This procedure is used to control processing for format C05/S05/R05.
8196.0	250129	      // =======================================================================
8197.0	250130	     P processScreen8  B
8198.0	250129	      /free
8199.0	250129	       if screenAction = LOAD_SCREEN;
8200.0	250221	          clearscreen8 ();
8201.0	250130	          loadScreen8 ();
8202.0	250129	       endif;
8203.0	250219	       dou not errorfound ;
8204.0	250219	          displayScreen8  ();
8205.0	250219	          testUserAction8 ();
8206.0	250219	       enddo;
8207.0	250129	       return;
8208.0	250129	      /end-free
8209.0	250130	     P processScreen8  E
8210.0	250129	
8211.0	250130	      // =======================================================================
8212.0	250130	      //Procedure loadScreen8:
8213.0	250130	      // =======================================================================
8214.0	250303	      // This procedure is used to load the Subfile  S05 for screen8
8215.0	250130	      // =======================================================================
8216.0	250130	     P loadScreen8     B
8217.0	250130	
8218.0	250130	      // =======================================================================
8219.0	250130	      // - Local Variables -
8220.0	250130	      // =======================================================================
8221.0	250130	     D categoryItemFound...
8222.0	250130	     D                 S               N   inz(FALSE)
8223.0	250130	      /free
8224.0	250130	       // Start with the last SFL record loaded
8225.0	250204	       if SvRrnS05   = *zero;
8226.0	250130	          categoryItemFound = getFirstC1(*BLANKS : messageId);
8227.0	250130	       else;
8228.0	250204	          categoryItemFound = getNextC1csr(messageId);
8229.0	250130	       endif;
8230.0	250130	       if messageId <> *blanks;
8231.0	250203	          putErrMsg(messageId : *blanks : SdPgm : jobLang);
8232.0	250130	       endif;
8233.0	250130	
8234.0	250204	       rrnS05 = SvRrnS05;
8235.0	250130	       numberLinesS05 = *zero;
8236.0	250130	       numberRecordsAdded = %rem(numberRecordsAdded : S05_RECORDS_PER_PAGE);
8237.0	250130	
8238.0	250130	       // Load one page of subfile entries.
8239.0	250130	       dow categoryItemFound
8240.0	250130	       and numberLinesS05 < (S05_RECORDS_PER_PAGE - numberRecordsAdded)
8241.0	250130	       and rrnS05 < MAXIMUM_SUBFILE_RECORDS;
8242.0	250130	          rrnS05 += 1;
8243.0	250130	          numberLinesS05 += 1;
8244.0	250130	
8245.0	250130	          if numberLinesS05 = 1;
8246.0	250130	             firstLine = rrnS05;
8247.0	250130	          endif;
8248.0	250130	
8249.0	250219	          OptError    = FALSE;
8250.0	250130	          // Load Subfile fields.
8251.0	250130	          clear *all S05;
8252.0	250130	          //Move the values to screen5 fields.
8253.0	250130	          if itemCategoryBlockNullsDS.c1ItemNbr = NOT_NULL;
8254.0	250130	             s5Item = itemCategoryBlock(currentRow).c1ItemNbr;
8255.0	250130	          endif;
8256.0	250131	          if itemCategoryBlockNullsDS.c1Code = NOT_NULL;
8257.0	250131	             s5Stat = itemCategoryBlock(currentRow).c1Code  ;
8258.0	250130	          endif;
8259.0	250207	          if itemCategoryBlockNullsDS.c1ItmDesc = NOT_NULL;
8260.0	250207	             s5Desc = itemCategoryBlock(currentRow).c1ItmDesc  ;
8261.0	250207	          endif;
8262.0	250220	          clear S5OPT;
8263.0	250220	          OptError =False;
8264.0	250130	          write S05;
8265.0	250130	
8266.0	250130	          if  numberLinesS05 < (S05_RECORDS_PER_PAGE - numberRecordsAdded)
8267.0	250130	          and rrnS05 < MAXIMUM_SUBFILE_RECORDS;
8268.0	250204	             categoryItemFound = getNextC1csr(messageId);
8269.0	250130	             if messageId <> *blanks;
8270.0	250203	                putErrMsg(messageId : *blanks : SdPgm : jobLang);
8271.0	250130	             endif;
8272.0	250130	          endif;
8273.0	250130	       enddo;
8274.0	250130	
8275.0	250130	       endSubfile = not categoryItemFound;
8276.0	250204	       SvRrnS05   = rrnS05;
8277.0	250130	       numberRecordsAdded = *zero;
8278.0	250130	
8279.0	250130	       //Indicate More records / this may be needed rather than loading blank
8280.0	250130	       //pages
8281.0	250130	       if rrnS05 >= MAXIMUM_SUBFILE_RECORDS
8282.0	250130	       or endSubfile = TRUE;
8283.0	250220	          sflEnd5 = TRUE;
8284.0	250130	       else;
8285.0	250220	          sflEnd5 = FALSE;
8286.0	250130	       endif;
8287.0	250130	
8288.0	250130	       //display error message if subfile is full (9,999 records)
8289.0	250130	       if rrnS05 >= MAXIMUM_SUBFILE_RECORDS;
8290.0	250130	          putErrMsg(EMID_MAXIMUM_SUBFILE_RECORDS_EXCEEDED :
8291.0	250203	                    *blanks : SdPgm : jobLang);
8292.0	250130	       endif;
8293.0	250130	
8294.0	250130	       //Empty Subfile? / this may be needed if no blank pages
8295.0	250220	       sflDsp5 = (rrnS05 <> *zero);
8296.0	250130	
8297.0	250220	       if sflDsp5;
8298.0	250130	          //Set Subfile Display if Records Loaded to Subfile
8299.0	250130	          //Default cursor to first record, last screen
8300.0	250130	          c5DspR = firstLine;
8301.0	250130	       else;
8302.0	250203	          putErrMsg(NoSflRecs : *blanks : SdPgm : jobLang);
8303.0	250130	          setCursorToCurrent(csrRow : csrCol : csrPosRow : csrPosCol);
8304.0	250130	       endif;
8305.0	250130	
8306.0	250130	       screenAction = PROCESS_SCREEN;
8307.0	250130	
8308.0	250130	       return;
8309.0	250130	      /end-free
8310.0	250130	     P loadScreen8     E
8311.0	250130	
8312.0	250130	      // =======================================================================
8313.0	250130	      //Procedure displayScreen8:
8314.0	250130	      // =======================================================================
8315.0	250130	      // This procedure is used to display the screen formats C05/S05/R05.
8316.0	250130	      // =======================================================================
8317.0	250130	     P displayScreen8  B
8318.0	250130	      /free
8319.0	250130	       if not endOfProgram;
8320.0	250130	
8321.0	250130	          write R05;
8322.0	250130	          exfmt C05;
8323.0	250130	       endif;
8324.0	250130	
8325.0	250130	       return;
8326.0	250130	      /end-free
8327.0	250130	     P displayScreen8  E
8328.0	250130	
8329.0	250130	      // =======================================================================
8330.0	250130	      //Procedure testUserAction8:
8331.0	250130	      // =======================================================================
8332.0	250130	      // This procedure is used to test what function key was pressed by the
8333.0	250130	      // user and to execute the corresponding action.
8334.0	250130	      // =======================================================================
8335.0	250130	     P testUserAction8...
8336.0	250130	     P                 B
8337.0	250130	      /free
8338.0	250202	       resetErrors();
8339.0	250130	
8340.0	250130	       select;
8341.0	250130	       when keyPressed = F_EXIT;
8342.0	250219	          errorFound =FALSE;
8343.0	250130	          endOfProgram = TRUE;
8344.0	250209	          exec sql rollback;
8345.0	250130	
8346.0	250130	       when keyPressed = F_CANCEL ;
8347.0	250219	          errorFound =FALSE;
8348.0	250219	          exec sql rollback;
8349.0	250219	          clearScreen8 ();
8350.0	250219	          resetErrors();
8351.0	250219	          screen = 1;
8352.0	250219	          screenAction = LOAD_SCREEN;
8353.0	250130	
8354.0	250219	       when keyPressed = F_Refresh;
8355.0	250220	          errorFound =TRUE;
8356.0	250220	          clearScreen8 ();
8357.0	250220	          loadScreen8 ();
8358.0	250204	       when keyPressed = F_PageDown;
8359.0	250221	          errorFound =TRUE;
8360.0	250130	          loadScreen8 ();
8361.0	250130	          setCursorToCurrent(csrRow : csrCol : csrPosRow : csrPosCol);
8362.0	250130	
8363.0	250130	       when keyPressed = F_ENTER;
8364.0	250303	          Fill03YN = TRUE ;
8365.0	250303	          Validateinput8 ();
8366.0	250219	          if Valid;
8367.0	250219	             errorFound =FALSE;
8368.0	250219	             if optionFound;
8369.0	250218	                  LoopS05 ();
8370.0	250219	             endif;
8371.0	250219	             svCsrRRN = csrRRN ;
8372.0	250219	             SCREEN =3   ;
8373.0	250219	             SCREENACTION =LOAD_SCREEN;
8374.0	250219	          else;
8375.0	250219	             errorFound =TRUE;
8376.0	250219	          endif;
8377.0	250130	       endsl;
8378.0	250130	
8379.0	250130	       return;
8380.0	250130	      /end-free
8381.0	250130	     P testUserAction8...
8382.0	250130	     P                 E
8383.0	250130	
8384.0	250130	      // =======================================================================
8385.0	250130	      //Procedure clearScreen8:
8386.0	250130	      // =======================================================================
8387.0	250303	      // This procedure is used to clear the subfile S05.
8388.0	250130	      // =======================================================================
8389.0	250130	     P clearScreen8    B
8390.0	250130	      /free
8391.0	250220	       sflDsp5 = FALSE;
8392.0	250220	       sflDspCtl5 = FALSE;
8393.0	250220	       sflEnd5 = FALSE;
8394.0	250130	       write C05;
8395.0	250130	
8396.0	250220	       sflDspCtl5 = TRUE;
8397.0	250130	       sflNxtChg = FALSE;
8398.0	250130	
8399.0	250204	       rrnS05 = *zero;
8400.0	250204	       SvrrnS05 = *zero;
8401.0	250130	       c5DspR = 1;
8402.0	250205	       EndS05 = False;
8403.0	250220	       SflNxtChg5 = False;
8404.0	250130	
8405.0	250130	       reset numberRecordsAdded;
8406.0	250130	       reset keyIndex;
8407.0	250130	
8408.0	250130	       return;
8409.0	250130	      /end-free
8410.0	250130	     P clearScreen8    E
8411.0	250130	
8412.0	250131	      // =======================================================================
8413.0	250131	      //Function getFirstC1:
8414.0	250131	      // =======================================================================
8415.0	250303	      // This function retrieves the first block of data from the  c1Csr
8416.0	250131	      // SQL Cursor.
8417.0	250131	      // Returns TRUE on success, FALSE otherwise.
8418.0	250131	      // The message Id parameter can be examined to determine if there was a
8419.0	250131	      // database problem.
8420.0	250131	      // =======================================================================
8421.0	250131	     P getFirstC1      B
8422.0	250131	     D                 PI              N
8423.0	250131	     D  inParent                           like(typeParent) const
8424.0	250131	     D  outMessageId                       like(typeMessageId)
8425.0	250131	      /free
8426.0	250131	       clear outMessageId;
8427.0	250131	
8428.0	250131	       //Set occurrence of "cursorControl" structure to the relevant SQL
8429.0	250131	       //cursor in this procedure.
8430.0	250204	       %occur(cursorControl) = CURSOR_ITEM_CATEGORY_CURSOR;
8431.0	250131	
8432.0	250131	       //close cursor, allowing function to retrieve the first row again
8433.0	250204	       closeC1Cursor(outMessageId);
8434.0	250131	       if outMessageId <> *blanks;
8435.0	250131	          return FALSE;
8436.0	250131	       endif;
8437.0	250131	
8438.0	250131	       //Load run time values to host variables;
8439.0	250131	       //prepareRebateHeaderCursorVariables();
8440.0	250131	
8441.0	250131	       //open cursor
8442.0	250131	       exec sql open c1Csr;
8443.0	250131	
8444.0	250131	       if sqlCod < SQL_SUCCESSFUL;
8445.0	250204	
8446.0	250204	         putSQLDiagnostics(SdPgm : %addr(SQLCA) :
8447.0	250204	                             'getFirstC1' : FALSE);
8448.0	250131	          return FALSE;
8449.0	250131	       endif;
8450.0	250131	
8451.0	250131	       cursorOpen = TRUE;
8452.0	250131	
8453.0	250131	       //fetch next (first) block of rows
8454.0	250205	       fetchNextC1(outMessageId);
8455.0	250131	
8456.0	250131	       return (rowsFetched > *zero)
8457.0	250131	       and    (outMessageId = *blanks);
8458.0	250131	      /end-free
8459.0	250131	     P getFirstC1      E
8460.0	250131	
8461.0	250131	      // =======================================================================
8462.0	250204	      // Function getNextC1csr:
8463.0	250131	      // =======================================================================
8464.0	250131	      // This function retrieves the next block of data from the c1Csr            r
8465.0	250131	      // SQL Cursor.
8466.0	250131	      // Returns TRUE on success, FALSE otherwise.
8467.0	250131	      // The message Id parameter can be examined to determine if there was a
8468.0	250131	      // database problem.
8469.0	250131	      // =======================================================================
8470.0	250131	     P getNextc1Csr    B
8471.0	250131	     D                 PI              N
8472.0	250131	     D  outMessageId                       like(typeMessageId)
8473.0	250131	      /free
8474.0	250131	       clear outMessageId;
8475.0	250131	
8476.0	250131	       //Set occurrence of "cursorControl" structure to the relevant SQL
8477.0	250131	       //cursor in this procedure.
8478.0	250204	       %occur(cursorControl) = CURSOR_ITEM_CATEGORY_CURSOR;
8479.0	250131	
8480.0	250131	       select;
8481.0	250131	       //When the currentRow < rowsFetched, this means that the next row is in
8482.0	250131	       //the block of rows already fetched.  In this case, simply increment
8483.0	250131	       //the index pointer.
8484.0	250131	       when currentRow < rowsFetched;
8485.0	250131	          currentRow += 1;
8486.0	250131	
8487.0	250131	          //set the address of the "currentRow" of null-indicators
8488.0	250204	          itemCategoryBlockNullsDS__ =
8489.0	250204	          %addr(itemCategoryBlockNulls(currentRow));
8490.0	250131	          return TRUE;
8491.0	250131	
8492.0	250131	       //If currentRow >= rowsFetched, this means that the block of fetched
8493.0	250131	       //rows has been exhausted.  If the cursor is still open, fetch the next
8494.0	250131	       //block of rows.
8495.0	250131	       when cursorOpen;
8496.0	250207	          fetchNextC1(outMessageId);
8497.0	250131	
8498.0	250131	       // If currentRow >= rowsFetched and the cursor is not open, then there
8499.0	250131	       // are no more rows in the result set to fetch.
8500.0	250131	       other;
8501.0	250131	          return FALSE;
8502.0	250131	       endsl;
8503.0	250131	
8504.0	250131	       return (rowsFetched > *zero)
8505.0	250131	       and    (outMessageId = *blanks);
8506.0	250131	      /end-free
8507.0	250131	     P getNextc1Csr    E
8508.0	250131	
8509.0	250131	      // =======================================================================
8510.0	250131	      //Procedure resetRDBConnection:
8511.0	250131	      // =======================================================================
8512.0	250131	      // Reset the Relational Database connection.
8513.0	250131	      // =======================================================================
8514.0	250131	     P resetRDBConnection...
8515.0	250131	     P                 B
8516.0	250131	
8517.0	250131	      // =======================================================================
8518.0	250131	      // - Prototype Definitions - External Procedures from Service Programs
8519.0	250131	      // =======================================================================
8520.0	250131	
8521.0	250131	      /define setActiveRDB_UTS006
8522.0	250131	      /copy *libl/QRPGLESRC,UTS006PR
8523.0	250131	
8524.0	250131	      /free
8525.0	250131	       // ======================================================================
8526.0	250131	       // Set active RDB connection back to initial RDB connection.
8527.0	250131	       // ======================================================================
8528.0	250131	       if initialRDB <> relationalDatabase;
8529.0	250203	          setActiveRDB(SdPgm : initialRDB);
8530.0	250131	       endif;
8531.0	250131	
8532.0	250131	       return;
8533.0	250131	      /end-free
8534.0	250131	     P resetRDBConnection...
8535.0	250131	     P                 E
8536.0	250131	
8537.0	250131	      // =======================================================================
8538.0	250131	      //Procedure setRDBConnection:
8539.0	250131	      // =======================================================================
8540.0	250131	      // Ensure that the job is connected to the appropriate Relational Database.
8541.0	250131	      // =======================================================================
8542.0	250131	     P setRDBConnection...
8543.0	250131	     P                 B
8544.0	250131	
8545.0	250131	      // =======================================================================
8546.0	250131	      // - Prototype Definitions - External Procedures from Service Programs
8547.0	250131	      // =======================================================================
8548.0	250131	
8549.0	250131	      /define getCurrentRDB_UTS006
8550.0	250131	      /define setActiveRDB_UTS006
8551.0	250131	      /copy *libl/QRPGLESRC,UTS006PR
8552.0	250131	
8553.0	250131	      /free
8554.0	250131	       // ======================================================================
8555.0	250131	       // Determine the current Relational Database Connection.  Then,
8556.0	250131	       // conditionally connect to the appropriate database.
8557.0	250131	       // ======================================================================
8558.0	250131	       in systemName;
8559.0	250131	       relationalDatabase = systemName.systemName;
8560.0	250203	       currentRDB = getCurrentRDB(SdPgm);
8561.0	250131	       initialRDB = currentRDB;
8562.0	250131	
8563.0	250131	       if currentRDB <> relationalDatabase;
8564.0	250203	          setActiveRDB(SdPgm : relationalDatabase);
8565.0	250131	       endif;
8566.0	250131	
8567.0	250131	       return;
8568.0	250131	      /end-free
8569.0	250131	     P setRDBConnection...
8570.0	250131	     P                 E
8571.0	250131	
8572.0	250131	      // =======================================================================
8573.0	250131	      //Function fetchNextc1:
8574.0	250131	      // =======================================================================
8575.0	250131	      // This function retrieves the next block of data from the c1 Cursor
8576.0	250131	      // SQL Cursor.
8577.0	250131	      // Returns TRUE on success, FALSE otherwise.
8578.0	250131	      // The message Id parameter can be examined to determine if there was a
8579.0	250131	      // database problem.
8580.0	250131	      // =======================================================================
8581.0	250131	     P fetchNextC1     B
8582.0	250131	     D                 PI              N
8583.0	250131	     D  outMessageId                       like(typeMessageId)
8584.0	250131	      /free
8585.0	250131	       clear outMessageId;
8586.0	250131	
8587.0	250131	       //Set occurrence of "cursorControl" structure to the relevant SQL
8588.0	250131	       //cursor in this procedure.
8589.0	250207	       %occur(cursorControl) = CURSOR_ITEM_CATEGORY_CURSOR;
8590.0	250131	
8591.0	250131	       //clear all indices of previously fetched information
8592.0	250131	       reset itemCategoryBlock   ;
8593.0	250131	       reset itemCategoryBlockNulls   ;
8594.0	250131	
8595.0	250131	       //fetch a block of rows from the cursor
8596.0	250131	       exec sql fetch next
8597.0	250206	                from  c1Csr
8598.0	250131	                for  :fetchFactor rows
8599.0	250131	                into :itemCategoryBlock indicator :itemCategoryBlockNulls;
8600.0	250131	
8601.0	250131	       if sqlCod < SQL_SUCCESSFUL;
8602.0	250204	         putSQLDiagnostics(SdPgm : %addr(SQLCA) :
8603.0	250204	                             'fetchNextC1' : FALSE);
8604.0	250131	       endif;
8605.0	250131	
8606.0	250131	       if  sqlCod >= SQL_SUCCESSFUL
8607.0	250131	       and sqlCod <> ROW_NOT_FOUND;
8608.0	250131	          //save off the number of rows fetched and reset the index pointer
8609.0	250131	          rowsFetched = sqlErrD(3);
8610.0	250131	          currentRow = 1;
8611.0	250131	
8612.0	250131	          //set the address of the "currentRow" of null-indicators
8613.0	250131	          itemCategoryBlockNullsDS__ =
8614.0	250131	          %addr(itemCategoryBlockNulls(currentRow));
8615.0	250131	       else;
8616.0	250131	          //close the cursor if no rows found or error in fetch routine
8617.0	250131	          closeC1Cursor(outMessageId);
8618.0	250131	          rowsFetched = *zero;
8619.0	250131	       endif;
8620.0	250131	
8621.0	250131	       return (rowsFetched > *zero)
8622.0	250131	       and    (outMessageId = *blanks);
8623.0	250131	      /end-free
8624.0	250131	     P fetchNextc1     E
8625.0	250131	
8626.0	250204	      // =======================================================================
8627.0	250204	      //Function closeC1Cursor:
8628.0	250204	      // =======================================================================
8629.0	250204	      // This function closes the rebateHeaderCursor SQL cursor.
8630.0	250204	      // Returns TRUE on success, FALSE otherwise.
8631.0	250204	      // The message Id parameter can be examined to determine if there was a
8632.0	250204	      // database problem.
8633.0	250204	      // =======================================================================
8634.0	250204	     P closeC1Cursor...
8635.0	250204	     P                 B
8636.0	250204	     D                 PI              N
8637.0	250204	     D  outMessageId                       like(typeMessageId)
8638.0	250204	      /free
8639.0	250204	       clear outMessageId;
8640.0	250204	
8641.0	250204	       //Set occurrence of "cursorControl" structure to the relevant SQL
8642.0	250204	       //cursor in this procedure.
8643.0	250204	       %occur(cursorControl) = CURSOR_ITEM_CATEGORY_CURSOR;
8644.0	250204	
8645.0	250204	       if cursorOpen;
8646.0	250204	          exec sql close c1Csr;
8647.0	250204	
8648.0	250204	          if  sqlCod < SQL_SUCCESSFUL
8649.0	250204	          and sqlCod <> CURSOR_NOT_OPEN;
8650.0	250204	       //    sqlErrorHandler('closeC1Cursor' : outMessageId);
8651.0	250204	          else;
8652.0	250204	             cursorOpen = FALSE;
8653.0	250204	          endif;
8654.0	250204	       endif;
8655.0	250204	
8656.0	250204	       return (outMessageId = *blanks);
8657.0	250204	      /end-free
8658.0	250204	     P closeC1Cursor...
8659.0	250204	     P                 E
8660.0	250218	      // =======================================================================
8661.0	250218	      // Procedure Validateinput8
8662.0	250218	      // =======================================================================
8663.0	250218	      // This procedure is used to validate entries in Coupon-Item Maintenance.
8664.0	250218	      // =======================================================================
8665.0	250218	     P Validateinput8  B
8666.0	250218	     D Validateinput8  PI
8667.0	250218	      /free
8668.0	250218	       if Rrns05 > 0;
8669.0	250218	           // default to current screen displayed / will be overridden if errors
8670.0	250218	           C5Dspr = 1;
8671.0	250218	           ProtOpt = False;
8672.0	250218	           ErrorPage = 0;
8673.0	250218	           Valid = True;
8674.0	250218	           OptionFound  = False;
8675.0	250218	           PItmDownOkay = True;
8676.0	250218	               // Check Subfile to see if cursor is on a valid subfile line
8677.0	250218	           ReadC S05;
8678.0	250218	
8679.0	250218	           dow not %eof(OACP1010D);
8680.0	250218	
8681.0	250218	             OptError = False;
8682.0	250219	             SflNxtChg5 = True;
8683.0	250218	
8684.0	250218	             // Validate Option
8685.0	250218	           Select;
8686.0	250218	               //   Option 8 - Re-activate
8687.0	250218	               //   Option 4 - Delete
8688.0	250218	           When S5Opt = OptDlt;
8689.0	250218	               //   Check if Status is active.
8690.0	250303	               //   No need to delete a deleted Coupon Item
8691.0	250218	                if S5Stat = DltMode;
8692.0	250218	                     Valid = False;
8693.0	250218	                     OptError = True;
8694.0	250218	                else;
8695.0	250218	                    optionFound = True;
8696.0	250218	                endif;
8697.0	250218	
8698.0	250218	           When S5Opt = OptReActivate ;
8699.0	250218	               //   Check if Status is deleted. No need to reactivate
8700.0	250303	               //   an Active Coupon   Item.
8701.0	250218	                if S5Stat = cActive;
8702.0	250218	                     Valid = False;
8703.0	250218	                     OptError = True;
8704.0	250218	                else;
8705.0	250218	                     optionFound  = True;
8706.0	250218	                endif;
8707.0	250218	               // All Other Invalid Options
8708.0	250303	           Other;
8709.0	250303	                Valid = False;
8710.0	250303	                OptError = True;
8711.0	250303	                setCsrPos (PosS5OPTFLG);
8712.0	250218	           endsl;
8713.0	250218	
8714.0	250218	             //   Set Page of first error
8715.0	250218	             if Valid = False and ErrorPage = 0;
8716.0	250218	               ErrorPage = RrnS05;
8717.0	250218	             endif;
8718.0	250218	
8719.0	250218	             //  Update Subfile
8720.0	250219	             SflNxtChg5 = true;
8721.0	250218	             Update S05;
8722.0	250218	             // Clear Screen Error indicators and reset cursor
8723.0	250218	             ErrMsginds = *all'0';
8724.0	250218	
8725.0	250218	                // Check for page of the first error.
8726.0	250218	             if not valid and errorpage = 0;
8727.0	250218	                    errorpage = rrns05;
8728.0	250218	             endif;
8729.0	250218	
8730.0	250218	             //  Get Next Subfile Change
8731.0	250218	             ReadC S05;
8732.0	250218	           endDo;
8733.0	250218	
8734.0	250218	             OptError = False;
8735.0	250218	           if Valid and Not OptionFound;
8736.0	250218	              PrevEnter = True;
8737.0	250218	              PrevValid = Valid;
8738.0	250218	           endif;
8739.0	250218	
8740.0	250218	           //  Set the cursor page to first error page
8741.0	250218	              //  Set the cursor page to first error page
8742.0	250218	           if ErrorPage > 1;
8743.0	250218	              C5DSPR = ErrorPage;
8744.0	250218	           endif;
8745.0	250218	
8746.0	250218	           if Valid ;
8747.0	250218	                Optionfound = True;
8748.0	250218	           endif;
8749.0	250218	       endif;
8750.0	250218	       return;
8751.0	250218	      /end-free
8752.0	250218	     P Validateinput8  E
8753.0	250218	
8754.0	250218	      // =======================================================================
8755.0	250218	      // Procedure LoopS05:
8756.0	250218	      // =======================================================================
8757.0	250218	      // Reload Subfile records from Worksubfile.
8758.0	250218	      // =======================================================================
8759.0	250218	     P LoopS05         B
8760.0	250218	     D LoopS05         PI
8761.0	250218	      /free
8762.0	250218	       if rrns05 > 0;
8763.0	250218	          SaveDept =0;
8764.0	250218	          NotPOSTO = True;
8765.0	250218	          ReadC S05;
8766.0	250218	          Dow Not %eof(OACP1010D)
8767.0	250218	          and Not EndPgm;
8768.0	250218	          %occur(ErrorMsgDS) = 1;
8769.0	250218	
8770.0	250218	          if ErrorMsgDS = *Blanks
8771.0	250218	          or ErrorMsgDS.ErrFieldName = '*RECORD';
8772.0	250218	             Select;
8773.0	250218	          // Option 4 - Delete subfile record.
8774.0	250218	             When S5Opt = OptDlt;
8775.0	250218	                  S5Stat = DltMode;
8776.0	250218	                  S5Opt  = *Blank;
8777.0	250218	                  S5Mode = *Blank;
8778.0	250218	                  ProtOpt = False;
8779.0	250218	                  PrevEnter = False;
8780.0	250218	                  if NotPOSTO;
8781.0	250218	                     C5Dspr = RRNS05;
8782.0	250218	                  endif;
8783.0	250219	              exec sql
8784.0	250219	              update oacpnitmp set STSCDEID =2
8785.0	250219	              WHERE CPNID = :wkCpnId
8786.0	250219	              and itemnbr=:S5ITEM  and  CMPYNBR = 1
8787.0	250219	              and STSCDEID =1 ;
8788.0	250218	          //Option 8 - Re-Activate.
8789.0	250218	             When S5Opt = OptReActivate ;
8790.0	250218	                  if S5Stat = DltMode;
8791.0	250218	                       S5Stat = cActive;
8792.0	250218	                  endif;
8793.0	250218	
8794.0	250218	                  ProtOpt = False;
8795.0	250218	                  S5Opt  = *Blank;
8796.0	250218	                  S5Mode = *Blank;
8797.0	250218	                  PrevEnter = False;
8798.0	250218	
8799.0	250218	                  if NotPOSTO;
8800.0	250218	                     C5Dspr = RRNS05;
8801.0	250218	                  endif;
8802.0	250219	              exec sql
8803.0	250219	              update oacpnitmp set STSCDEID =1
8804.0	250219	              WHERE CPNID = :wkCpnId
8805.0	250219	              and itemnbr=:S5ITEM  and  CMPYNBR = 1
8806.0	250219	              and STSCDEID =2 ;
8807.0	250218	             endsl;
8808.0	250218	
8809.0	250218	       //Save item department;
8810.0	250218	             If SaveDept = 0 and S5Stat = cActive;
8811.0	250218	                SaveDept = S5Dept;
8812.0	250218	             endif;
8813.0	250218	          endif;
8814.0	250218	
8815.0	250219	          SflNxtChg5 = True;
8816.0	250218	          Update S05;
8817.0	250218	       // Read next subfile record.
8818.0	250218	          ReadC S05;
8819.0	250218	          enddo;
8820.0	250218	       // No errors /reposition cursor to first record.
8821.0	250218	          if not Errorfound
8822.0	250218	             and C5Dspr >= S05_RECORDS_PER_PAGE;
8823.0	250218	                 C5Dspr = 1;
8824.0	250218	          endif;
8825.0	250218	             // Clear Screen Error indicators and reset cursor
8826.0	250218	           ErrMsginds = *all'0';
8827.0	250218	           WkFn = *Blank;
8828.0	250218	          endif;
8829.0	250218	       return;
8830.0	250218	      /end-free
8831.0	250218	     P LoopS05         E
8832.0	250218	
8833.0	250131	      // =======================================================================
