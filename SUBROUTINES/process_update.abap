*&---------------------------------------------------------------------*
*& Form process_update
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM process_update .
  DATA: lt_row   TYPE lvc_s_row,
        lt_rows  TYPE lvc_t_row,
        lv_lines TYPE i.
  DATA: lv_loop  TYPE i,
        lv_error TYPE i.
*  DATA lv_answer TYPE i.

  DATA: lw_drebate TYPE ty_grebate.
  g_grid->get_selected_rows(  IMPORTING et_index_rows = lt_rows ).
  FREE: gt_urebate.
  LOOP AT lt_rows INTO lt_row.
    wa_drebate-sel = 'X'.
    MODIFY gt_drebate FROM wa_drebate INDEX lt_row-index TRANSPORTING sel.

*    CLEAR: wa_urebate.
*    CLEAR: ztlpvt007.
**    DESCRIBE TABLE lt_rows LINES lv_lines.
**    IF lv_lines EQ 1.
*    READ TABLE gt_drebate INTO wa_drebate INDEX lt_row-index.
*    IF sy-subrc = 0.
*      ztlpvt007-vkorg = wa_drebate-vkorg.
*      ztlpvt007-vtweg = wa_drebate-vtweg.
*      ztlpvt007-spart = wa_drebate-spart.
*      ztlpvt007-kunnr = wa_drebate-kunnr.
*      ztlpvt007-krech = wa_drebate-krech.
*      ztlpvt007-type  = wa_drebate-type.
*    ENDIF.
*    MOVE-CORRESPONDING wa_drebate TO wa_urebate.
*    APPEND wa_urebate TO gt_urebate.
    CLEAR: wa_urebate.
    CLEAR: ztlpvt007. """deleted from case value dissapeared
    READ TABLE gt_drebate INTO wa_drebate INDEX lt_row-index.
    IF sy-subrc = 0.
      ztlpvt007-vkorg = wa_drebate-vkorg.
      ztlpvt007-vtweg = wa_drebate-vtweg.
      ztlpvt007-spart = wa_drebate-spart.
      ztlpvt007-kunnr = wa_drebate-kunnr.
      ztlpvt007-krech = wa_drebate-krech.
      ztlpvt007-zttgt  = wa_drebate-zttgt.
    ENDIF.
    MOVE-CORRESPONDING wa_drebate TO wa_urebate.
    APPEND wa_urebate TO gt_urebate.

  ENDLOOP.

  LOOP AT gt_drebate INTO wa_drebate WHERE sel = 'X'.
    ADD 1 TO lv_loop.
    IF lv_loop = 1.
      lw_drebate = wa_drebate.
    ELSE.
      IF wa_drebate-vkorg NE lw_drebate-vkorg.
        ADD 1 TO lv_error.
      ENDIF.
      IF wa_drebate-vtweg NE lw_drebate-vtweg.
        ADD 1 TO lv_error.
      ENDIF.
      IF wa_drebate-vtweg NE lw_drebate-vtweg.
        ADD 1 TO lv_error.
      ENDIF.
      IF wa_drebate-spart NE lw_drebate-spart.
        ADD 1 TO lv_error.
      ENDIF.
      IF wa_drebate-kunnr NE lw_drebate-kunnr.
        ADD 1 TO lv_error.
      ENDIF.
      IF wa_drebate-konwa NE lw_drebate-konwa.
        ADD 1 TO lv_error.
      ENDIF.
      IF wa_drebate-zttgt NE lw_drebate-zttgt.
        ADD 1 TO lv_error.
      ENDIF.
    ENDIF.

  ENDLOOP.
  IF lv_error NE 0.
    MESSAGE 'Invalid data in selected record' TYPE 'S' DISPLAY LIKE 'E'.
    CALL SCREEN 1000.
  ENDIF.

ENDFORM.
