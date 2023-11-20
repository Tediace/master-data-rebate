*&---------------------------------------------------------------------*
*& Include          ZTLPVA031F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form create_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM create_data .

  DATA lv_matnr TYPE c LENGTH 10.

  FREE: gt_drebate[],
        gt_rebate[],
        gt_urebate[].

  SELECT rbt vkorg vtweg spart kunnr kunwe matnr krech wcb_cond_amount kmein kbetr konwa datab datbi zttgt
    FROM ztlpvt007 INTO CORRESPONDING FIELDS OF TABLE gt_rebate."gt_rebate.


  SELECT kunnr name1
    FROM kna1
    INTO TABLE gt_name
    FOR ALL ENTRIES IN gt_rebate
    WHERE kunnr = gt_rebate-kunnr.

  SELECT kunnr name1
    FROM kna1
    INTO TABLE gt_ship
    FOR ALL ENTRIES IN gt_rebate
    WHERE kunnr = gt_rebate-kunwe.

  SELECT matnr maktx
    FROM makt
    INTO TABLE gt_matr
    FOR ALL ENTRIES IN gt_rebate
    WHERE matnr = gt_rebate-matnr.

  SORT gt_rebate BY rbt ASCENDING.

  LOOP AT gt_rebate INTO wa_rebate.
    CLEAR wa_drebate.
    MOVE-CORRESPONDING wa_rebate TO wa_drebate.
    READ TABLE gt_name INTO wa_name WITH KEY kunnr = wa_rebate-kunnr.
    IF sy-subrc = 0.
      wa_drebate-name1c = wa_name-name1.
    ENDIF.
    READ TABLE gt_ship INTO wa_ship WITH KEY kunnr = wa_rebate-kunwe.
    IF sy-subrc = 0.
      wa_drebate-name1s = wa_ship-name1.
    ENDIF.
    READ TABLE gt_matr INTO wa_matr WITH KEY matnr = wa_rebate-matnr.
    IF sy-subrc = 0.
      wa_drebate-maktx = wa_matr-maktx.
    ENDIF.

    CALL FUNCTION 'CONVERSION_EXIT_MATN1_OUTPUT'
      EXPORTING
        input        = wa_rebate-matnr
      IMPORTING
        output       = lv_matnr
      EXCEPTIONS
        length_error = 1
        OTHERS       = 2.
    wa_drebate-matnr = lv_matnr.
    APPEND wa_drebate TO gt_drebate.
  ENDLOOP.


ENDFORM.
