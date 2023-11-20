*&---------------------------------------------------------------------*
*& Form fieldcatalog_alv_create
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fieldcatalog_alv_create .
  REFRESH gt_fieldcatalog.

  CLEAR gt_fcat.
  gt_fcat-fieldname = 'KUNWE'.
  gt_fcat-tabname = 'ZTLPVT007'.
  gt_fcat-col_pos = 1.
  gt_fcat-f4availabl = 'X'.
  gt_fcat-ref_table = 'KNA1'.""
  gt_fcat-ref_field = 'KUNNR'.""
  gt_fcat-f4availabl = 'X'.
  gt_fcat-coltext = 'Ship-to-Party'.
  INSERT gt_fcat INTO TABLE gt_fieldcatalog.

  CLEAR gt_fcat.
  gt_fcat-fieldname = 'MATNR'.
  gt_fcat-tabname = 'ZTLPVT007'.
  gt_fcat-col_pos = 2.
  gt_fcat-outputlen = 10.
  gt_fcat-ref_table = 'MARA'.
  gt_fcat-ref_field = 'MATNR'.
  gt_fcat-coltext = 'Material'.
  INSERT gt_fcat INTO TABLE gt_fieldcatalog.

  CLEAR gt_fcat.
  gt_fcat-fieldname = 'WCB_COND_AMOUNT'.
  gt_fcat-tabname = 'ZTLPVT007'.
  gt_fcat-col_pos = 3.
  gt_fcat-edit = 'X'.
  gt_fcat-coltext = 'Target'.
  INSERT gt_fcat INTO TABLE gt_fieldcatalog.

  CLEAR gt_fcat.
  gt_fcat-fieldname = 'KMEIN'.
  gt_fcat-tabname = 'ZTLPVT007'.
  gt_fcat-col_pos = 4.
  gt_fcat-edit = 'X'.
  gt_fcat-outputlen = 8.
  gt_fcat-ref_table = 'VBAP'.
  gt_fcat-ref_field = 'KMEIN'.
  gt_fcat-checktable = 'VBAP'.
  gt_fcat-selddictxt = 'KMEIN'.
  gt_fcat-coltext = 'Target Unit'.
  INSERT gt_fcat INTO TABLE gt_fieldcatalog.

  CLEAR gt_fcat.
  gt_fcat-fieldname = 'KBETR'.
  gt_fcat-tabname = 'ZTLPVT007'.
  gt_fcat-col_pos = 5.
  gt_fcat-edit = 'X'.
  gt_fcat-currency = 'KONWA'.
  gt_fcat-no_zero = 'X'.
  gt_fcat-decimals = 2.
  gt_fcat-coltext = 'Rebate Amount'.
  INSERT gt_fcat INTO TABLE gt_fieldcatalog.

  CLEAR gt_fcat.
  gt_fcat-fieldname = 'KONWA'.
  gt_fcat-tabname = 'ZTLPVT007'.
  gt_fcat-col_pos = 6.
  gt_fcat-edit = 'X'.
  gt_fcat-outputlen = 8.
*  gt_fcat-ref_table = 'KONP'.
*  gt_fcat-ref_field = 'KONWA'.
  gt_fcat-coltext = 'Rebate Unit'.
  INSERT gt_fcat INTO TABLE gt_fieldcatalog.

  CLEAR gt_fcat.
  gt_fcat-fieldname = 'DATAB'.
  gt_fcat-tabname = 'ZTLPVT007'.
  gt_fcat-col_pos = 7.
  gt_fcat-edit = 'X'.
  gt_fcat-ref_table = 'ZTLPVT007'.
  gt_fcat-ref_field = 'DATAB'.
  gt_fcat-coltext = 'Valid From'.
  INSERT gt_fcat INTO TABLE gt_fieldcatalog.

  CLEAR gt_fcat.
  gt_fcat-fieldname = 'DATBI'.
  gt_fcat-tabname = 'ZTLPVT007'.
  gt_fcat-col_pos = 8.
  gt_fcat-edit = 'X'.
  gt_fcat-ref_table = 'ZTLPVT007'.
  gt_fcat-ref_field = 'DATBI'.
  gt_fcat-coltext = 'Valid To'.
  INSERT gt_fcat INTO TABLE gt_fieldcatalog.

ENDFORM.
