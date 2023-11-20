*&---------------------------------------------------------------------*
*& Form process_delete
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> WA_REBATE
*&---------------------------------------------------------------------*
FORM process_delete .
  DATA: lt_row  TYPE lvc_s_row,
        lt_rows TYPE lvc_t_row.
  g_grid->get_selected_rows(  IMPORTING et_index_rows = lt_rows ).
  LOOP AT lt_rows INTO lt_row.
    READ TABLE gt_drebate INTO wa_drebate INDEX lt_row-index.
    IF sy-subrc = 0.
      DELETE FROM ztlpvt007
      WHERE rbt = wa_drebate-rbt AND
            vkorg = wa_drebate-vkorg.
    ENDIF.
  ENDLOOP.
ENDFORM.
