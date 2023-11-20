*&---------------------------------------------------------------------*
*& Form save_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM save_data .
  DATA(lcl_snro) = NEW z_tlpclxa001( ).
  DATA: lv_flag(1).
  DATA: lr_kbetr TYPE string.

*  DATA: lt_rebate TYPE TABLE OF ztlpvt007,
*        lw_rebate TYPE ztlpvt007.
  IF gt_grid IS NOT INITIAL.
    gt_grid->check_changed_data( IMPORTING e_valid = lv_flag ).
    IF lv_flag IS NOT INITIAL.
      DELETE gt_rebate WHERE kunwe IS INITIAL.
      LOOP AT gt_rebate INTO wa_rebate.
        IF wa_rebate-kunwe IS INITIAL OR wa_rebate-matnr IS INITIAL OR wa_rebate-wcb_cond_amount IS INITIAL OR
          wa_rebate-kmein IS INITIAL OR wa_rebate-kbetr IS INITIAL OR wa_rebate-konwa IS INITIAL OR
          wa_rebate-datab IS INITIAL OR wa_rebate-datbi IS INITIAL.
          MESSAGE 'Input data must be completed' TYPE 'E'.
        ELSE.
          lcl_snro->number_get_next(
            EXPORTING
              iv_tabnm = 'ZTLPVT007'
            IMPORTING
              ev_numbr = gv_numbr
              ev_mssge = gv_mssge
              ).
          ret_number = gv_numbr.

          lw_rebate-vkorg = ztlpvt007-vkorg.
          lw_rebate-vtweg = ztlpvt007-vtweg.
          lw_rebate-spart = ztlpvt007-spart.
          lw_rebate-kunnr = ztlpvt007-kunnr.
          lw_rebate-krech = ztlpvt007-krech.
          lw_rebate-zttgt = ztlpvt007-zttgt.
          lw_rebate-rbt = gv_numbr.
*          MOVE-CORRESPONDING wa_rebate TO lw_rebate.
          lw_rebate-kunwe = wa_rebate-kunwe.
          lw_rebate-matnr = wa_rebate-matnr.
          lw_rebate-wcb_cond_amount = wa_rebate-wcb_cond_amount.
          lw_rebate-kmein = wa_rebate-kmein.
          lw_rebate-kbetr = wa_rebate-kbetr.
          lw_rebate-konwa = wa_rebate-konwa.
          lw_rebate-datab = wa_rebate-datab.
          lw_rebate-datbi = wa_rebate-datbi.
          lw_rebate-ernam = sy-uname.         "name person creating object
          lw_rebate-erdat = sy-datum.        "date record was created
          lw_rebate-ertim = sy-uzeit.        "created time
          APPEND lw_rebate TO lt_rebate.

        ENDIF.
*        ELSE.
*          DELETE gt_rebate FROM wa_rebate.
      ENDLOOP.
    ENDIF.
    IF lt_rebate IS NOT INITIAL.
      INSERT ztlpvt007 FROM TABLE lt_rebate.
      IF sy-subrc = 0.
        MESSAGE 'success' TYPE 'S'.
      ELSE.
        MESSAGE 'error' TYPE 'E'.
      ENDIF.
    ENDIF.
  ENDIF.
ENDFORM.
