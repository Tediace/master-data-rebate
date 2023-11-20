*&---------------------------------------------------------------------*
*& Form fieldcatalog_alv_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fieldcatalog_alv_data .
  REFRESH g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'KUNWE'.
  g_fcat-tabname = 'ZTLPVT007'.
  g_fcat-col_pos = 1.
  g_fcat-edit = 'X'.
  g_fcat-ref_table = 'KNA1'.""
  g_fcat-ref_field = 'KUNNR'.""
*  gv_fcat-checkbox = 'X'.
  g_fcat-coltext = 'Ship-to-Party'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'NAME1S'.
  g_fcat-tabname = 'KNA1'.
  g_fcat-col_pos = 2.
  g_fcat-outputlen = 23.
  g_fcat-coltext = 'Ship-to Name'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'MATNR'.
  g_fcat-tabname = 'ZTLPVT007'.
  g_fcat-col_pos = 3.
  g_fcat-edit = 'X'.
  g_fcat-outputlen = 10.
  g_fcat-ref_table = 'MARA'.
  g_fcat-ref_field = 'MATNR'.
  g_fcat-coltext = 'Material'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'MAKTX'.
  g_fcat-tabname = 'MARA'.
  g_fcat-col_pos = 4.
  g_fcat-outputlen = 24.
  g_fcat-coltext = 'Material Description'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'WCB_COND_AMOUNT'.
  g_fcat-tabname = 'ZTLPVT007'.
  g_fcat-col_pos = 5.
  g_fcat-edit = 'X'.
  g_fcat-outputlen = 5.
  g_fcat-coltext = 'Target'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'KMEIN'.
  g_fcat-tabname = 'ZTLPVT007'.
  g_fcat-col_pos = 6.
  g_fcat-edit = 'X'.
  g_fcat-outputlen = 8.
  g_fcat-ref_table = 'VBAP'.
  g_fcat-ref_field = 'KMEIN'.
  g_fcat-coltext = 'Target Unit'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'KBETR'.
  g_fcat-tabname = 'ZTLPVT007'.
  g_fcat-col_pos = 7.
  g_fcat-edit = 'X'.
*  g_fcat-ref_table = 'RV13A'.
*  g_fcat-ref_field = 'KONWA'.
  g_fcat-currency = 'KONWA'.
*  g_fcat-no_zero = 'X'.
  g_fcat-decimals = '2'.
  g_fcat-coltext = 'Rebate Amount'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'KONWA'.
  g_fcat-tabname = 'ZTLPVT007'.
  g_fcat-col_pos = 8.
  g_fcat-edit = 'X'.
  g_fcat-outputlen = 7.
  g_fcat-coltext = 'Rebate Unit'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'DATAB'.
  g_fcat-tabname = 'ZTLPVT007'.
  g_fcat-col_pos = 9.
  g_fcat-edit = 'X'.
  g_fcat-ref_table = 'ZTLPVT007'.
  g_fcat-ref_field = 'DATAB'.
  g_fcat-coltext = 'Valid From'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

  CLEAR g_fcat.
  g_fcat-fieldname = 'DATBI'.
  g_fcat-tabname = 'ZTLPVT007'.
  g_fcat-col_pos = 10.
  g_fcat-edit = 'X'.
  g_fcat-ref_table = 'ZTLPVT007'.
  g_fcat-ref_field = 'DATBI'.
  g_fcat-coltext = 'Valid To'.
  INSERT g_fcat INTO TABLE g_fieldcatalog.

ENDFORM.
