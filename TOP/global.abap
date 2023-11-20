*&---------------------------------------------------------------------*
*& Include          ZTLPVA031TOP
*&---------------------------------------------------------------------*

************************************************************************
* Data dictionary definition
************************************************************************
TABLES: tvkot,
        sscrfields.
TABLES: ztlpvt007.

************************************************************************
* Data/Types Definition.
************************************************************************

DATA: ok_code LIKE sy-ucomm,
      save_ok LIKE sy-ucomm.

*DATA: lv_input TYPE c LENGTH 30.

"for fieldcatalog
DATA: gv_fieldct TYPE c.
*DATA: lw_rebate TYPE ztlpvt007. "added by Tedi 23-07-2023

DATA: gs_fieldcatalog TYPE lvc_t_fcat,
      gv_fcat         TYPE lvc_s_fcat,
      gs_layout       TYPE lvc_s_layo,
      gt_excluding    TYPE ui_functions.

"data declaration for selecting row
DATA: index_rows TYPE lvc_t_row,
      index      LIKE LINE OF index_rows.

" GUI status declaration
DATA: gv_gui_status TYPE sy-ucomm.

" alv function declaration
DATA: g_container        TYPE scrfname VALUE 'CC_CONTAINER_GRID',
      g_custom_container TYPE REF TO cl_gui_custom_container,
      g_grid             TYPE REF TO cl_gui_alv_grid,
      gp_selfield        TYPE slis_selfield,
      gd_repid           LIKE sy-repid,
      lv_et_index_rows   TYPE lvc_t_row,
      lv_et_row_no       TYPE lvc_t_roid.

" GUI status function codes
CONSTANTS: gc_create TYPE sy-ucomm VALUE 'CREATE',
           gc_update TYPE sy-ucomm VALUE 'UPDATE',
           gc_delete TYPE sy-ucomm VALUE 'DELETE'.

TYPES: BEGIN OF ty_rebate,
         sel,
         rbt             TYPE ztlpvt007-rbt,
         vkorg           TYPE ztlpvt007-vkorg,
         vtweg           TYPE ztlpvt007-vtweg,
         spart           TYPE ztlpvt007-spart,
         kunnr           TYPE ztlpvt007-kunnr,
         kunwe           TYPE ztlpvt007-kunwe,
         matnr           TYPE ztlpvt007-matnr,
         krech           TYPE ztlpvt007-krech,
         wcb_cond_amount TYPE ztlpvt007-wcb_cond_amount,
         kmein           TYPE ztlpvt007-kmein,
         kbetr           TYPE ztlpvt007-kbetr,
         konwa           TYPE ztlpvt007-konwa,
         datab           TYPE ztlpvt007-datab,
         datbi           TYPE ztlpvt007-datbi,
         zttgt           TYPE ztlpvt007-zttgt,
       END OF ty_rebate.

TYPES: BEGIN OF ty_kna1,
         kunnr TYPE kna1-kunnr,
         name1 TYPE kna1-name1,
       END OF ty_kna1.

TYPES: BEGIN OF ty_ship,
         kunnr TYPE kna1-kunnr,
         name1 TYPE kna1-name1,
       END OF ty_ship.

TYPES: BEGIN OF ty_makt,
         matnr TYPE makt-matnr,
         maktx TYPE makt-maktx,
       END OF ty_makt.

TYPES: BEGIN OF ty_grebate,
         sel,
         rbt             TYPE ztlpvt007-rbt,
         vkorg           TYPE ztlpvt007-vkorg,
         vtweg           TYPE ztlpvt007-vtweg,
         spart           TYPE ztlpvt007-spart,
         kunnr           TYPE ztlpvt007-kunnr,
         name1c          TYPE kna1-name1,       "customer name
         kunwe           TYPE ztlpvt007-kunwe,
         name1s          TYPE kna1-name1,       "ship-to Name
         matnr           TYPE ztlpvt007-matnr,
         maktx           TYPE makt-maktx,       "material description
         krech           TYPE ztlpvt007-krech,
         wcb_cond_amount TYPE ztlpvt007-wcb_cond_amount,
         kmein           TYPE ztlpvt007-kmein,
         kbetr           TYPE ztlpvt007-kbetr,
         konwa           TYPE ztlpvt007-konwa,
         datab           TYPE ztlpvt007-datab,
         datbi           TYPE ztlpvt007-datbi,
         zttgt           TYPE ztlpvt007-zttgt,
       END OF ty_grebate.

DATA: g_rebate   TYPE TABLE OF ty_grebate,
      gt_drebate TYPE TABLE OF ty_grebate,
      wa_grebate TYPE ty_grebate,
      wa_drebate TYPE ty_grebate,
      gt_name    TYPE TABLE OF ty_kna1,
      wa_name    TYPE ty_kna1,
      gt_ship    TYPE TABLE OF ty_ship,
      wa_ship    TYPE ty_ship,
      gt_matr    TYPE TABLE OF ty_makt,
      wa_matr    TYPE ty_makt.

**********************************************************************
* Screen 9100 Definition.
**********************************************************************
DATA: gt_fieldcatalog TYPE lvc_t_fcat,
      gt_fcat         TYPE lvc_s_fcat.

DATA: gt_container        TYPE scrfname VALUE 'CC_CONTAINER_GRID2',
      gt_custom_container TYPE REF TO cl_gui_custom_container,
      gt_grid             TYPE REF TO cl_gui_alv_grid.

DATA: gt_rebate TYPE TABLE OF ty_grebate,
      wa_rebate TYPE ty_grebate.

DATA: ret_number TYPE ztlpvt007-rbt,
      gv_numbr   TYPE c LENGTH 25,
      gv_nrlevel TYPE nriv-nrlevel,
      gv_mssge   TYPE bkk_errmsg,
      e_check    TYPE c.
**********************************************************************
* Screen 9200 Definition.
**********************************************************************
DATA: g_fieldcatalog TYPE lvc_t_fcat,
      g_fcat         TYPE lvc_s_fcat.

DATA: gl_container        TYPE scrfname VALUE 'CC_CONTAINER_GRID3',
      gl_custom_container TYPE REF TO cl_gui_custom_container,
      gl_grid             TYPE REF TO cl_gui_alv_grid.

DATA: gt_urebate TYPE TABLE OF ty_grebate,
      wa_urebate TYPE ty_grebate.

DATA: lt_rebate TYPE TABLE OF ztlpvt007,
      lw_rebate TYPE ztlpvt007.
