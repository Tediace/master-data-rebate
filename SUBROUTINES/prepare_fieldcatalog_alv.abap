*&---------------------------------------------------------------------*
*& Form prepare_fieldcatalog_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM prepare_fieldcatalog_alv .
  REFRESH gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'VKORG'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 1.
  gv_fcat-outputlen = 7.
  gv_fcat-coltext = 'Sales Org.'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'VTWEG'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 2.
  gv_fcat-outputlen = 9.
  gv_fcat-coltext = 'Dist. Channel'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'SPART'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 3.
  gv_fcat-outputlen = 5.
  gv_fcat-coltext = 'Division'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'KUNNR'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 4.
  gv_fcat-outputlen = 8.
  gv_fcat-coltext = 'Customer'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'NAME1C'.
  gv_fcat-tabname = 'KNA1'.
  gv_fcat-col_pos = 5.
  gv_fcat-outputlen = 16.
  gv_fcat-coltext = 'Customer Name'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'KUNWE'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 6.
  gv_fcat-coltext = 'Ship-to-Party'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'NAME1S'.
  gv_fcat-tabname = 'KNA1'.
  gv_fcat-col_pos = 7.
  gv_fcat-outputlen = 23.
  gv_fcat-coltext = 'Ship-to Name'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'MATNR'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 8.
  gv_fcat-outputlen = 7.
  gv_fcat-coltext = 'Material'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'MAKTX'.
  gv_fcat-tabname = 'MARA'.
  gv_fcat-col_pos = 9.
  gv_fcat-outputlen = 24.
  gv_fcat-coltext = 'Material Description'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'KRECH'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 10.
  gv_fcat-outputlen = 8.
  gv_fcat-coltext = 'Target Type'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'WCB_COND_AMOUNT'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 11.
  gv_fcat-outputlen = 5.
  gv_fcat-coltext = 'Target'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'KMEIN'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 12.
  gv_fcat-outputlen = 7.
  gv_fcat-coltext = 'Target Unit'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'KBETR'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 13.
  gv_fcat-currency = 'KONWA'.
*  gv_fcat-no_zero = 'X'.
  gv_fcat-coltext = 'Rebate Amount'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'KONWA'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 14.
  gv_fcat-outputlen = 7.
  gv_fcat-coltext = 'Rebate Unit'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'DATAB'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 15.
  gv_fcat-coltext = 'Valid From'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'DATBI'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 16.
  gv_fcat-coltext = 'Valid To'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

  CLEAR gv_fcat.
  gv_fcat-fieldname = 'ZTTGT'.
  gv_fcat-tabname = 'ZTLPVT007'.
  gv_fcat-col_pos = 17.
  gv_fcat-outputlen = 3.
  gv_fcat-coltext = 'Type'.
  INSERT gv_fcat INTO TABLE gs_fieldcatalog.

ENDFORM.
