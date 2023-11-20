*&---------------------------------------------------------------------*
*& Form save_data_update
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM save_data_update .
  DATA: lv_flag(1).
  DATA: it_rebate TYPE TABLE OF ztlpvt007,
        ls_rebate TYPE ztlpvt007.

  DATA: ls_urebate TYPE ztlpvt007,
        lv_umatnr  TYPE makt-matnr.

*  DATA: lv_kbetr TYPE C LENGTH 20.

*  MODIFY ztlpvt007 FROM TABLE gt_rebate.
  IF gl_grid IS NOT INITIAL.
    gl_grid->check_changed_data( IMPORTING e_valid = lv_flag ).
    IF lv_flag IS NOT INITIAL.
*      DELETE gt_rebate WHERE kunwe IS INITIAL.
      LOOP AT gt_urebate INTO wa_urebate.
        IF wa_urebate-kunwe IS INITIAL OR wa_urebate-matnr IS INITIAL OR wa_urebate-wcb_cond_amount IS INITIAL OR
          wa_urebate-kmein IS INITIAL OR wa_urebate-kbetr IS INITIAL OR wa_urebate-konwa IS INITIAL OR
          wa_urebate-datab IS INITIAL OR wa_urebate-datbi IS INITIAL.
          MESSAGE 'Input data must be completed' TYPE 'E'.
        ELSE.
          SELECT SINGLE * FROM ztlpvt007 INTO ls_urebate WHERE rbt = wa_urebate-rbt.
          IF sy-subrc = 0.

            ls_urebate-kunwe = wa_urebate-kunwe.

            CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
              EXPORTING
                input  = wa_urebate-matnr
              IMPORTING
                output = lv_umatnr.

            ls_urebate-matnr = lv_umatnr.
            ls_urebate-wcb_cond_amount = wa_urebate-wcb_cond_amount.
            ls_urebate-kmein = wa_urebate-kmein.

*            CALL FUNCTION 'CONVERSION_EXIT_P24PR_INPUT'
*              EXPORTING
*                input         = wa_urebate-kbetr
*             IMPORTING
*               OUTPUT        = lv_kbetr.
*
*            ls_urebate-kbetr = lv_kbetr.
            ls_urebate-kbetr = wa_urebate-kbetr.
            ls_urebate-konwa = wa_urebate-konwa.
            ls_urebate-datab = wa_urebate-datab.
            ls_urebate-datbi = wa_urebate-datbi.
            ls_urebate-aenam = sy-uname.                "name person changed object
            ls_urebate-aedat = sy-datum.                "last change on
            ls_urebate-aetim = sy-uzeit.                "change time

            MODIFY ztlpvt007 FROM ls_urebate.
            IF sy-subrc = 0.
              COMMIT WORK.
              MESSAGE 'Record updated successfully.' TYPE 'S'.
            ELSE.
              ROLLBACK WORK.
              MESSAGE 'Error updating record.' TYPE 'E' DISPLAY LIKE 'S'.
            ENDIF.
          ENDIF.
        ENDIF.
*        IF wa_urebate-kunwe IS NOT INITIAL.
*
*        ENDIF.
*          MOVE-CORRESPONDING wa_rebate TO lw_rebate.

*        ELSE.
*          DELETE gt_rebate FROM wa_rebate.
      ENDLOOP.
    ENDIF.
*    IF it_rebate IS NOT INITIAL.
**      INSERT ztlpvt007 FROM TABLE it_rebate.
*      UPDATE ztlpvt007 FROM TABLE it_rebate.
*      CALL METHOD gl_grid->set_ready_for_input
*        EXPORTING
*          i_ready_for_input = 0.
**      MODIFY ztlpvt007 FROM TABLE it_rebate.
**      MODIFY gt_drebate FROM it_rebate.
*    ENDIF.
  ENDIF.

ENDFORM.
