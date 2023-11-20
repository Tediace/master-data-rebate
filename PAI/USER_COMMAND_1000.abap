*&---------------------------------------------------------------------*
*& Include          ZTLPVA031I01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_1000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_1000 INPUT.
  DATA: lv_answer        TYPE c LENGTH 4,
        lt_selected_rows TYPE TABLE OF i,
        lv_num_selected  TYPE i.
  DATA: lt_row  TYPE lvc_s_row,
        lt_rows TYPE lvc_t_row.
  save_ok = ok_code.
  CLEAR ok_code.

  CASE save_ok.
    WHEN 'EXIT' OR 'BACK' OR 'CNCL'.
      LEAVE PROGRAM.
    WHEN 'CREATE'.
      CALL SCREEN 9100.
    WHEN 'UPDATE'.
      g_grid->get_selected_rows(  IMPORTING et_index_rows = lt_rows ).
      lv_num_selected = lines( lt_rows ).
      IF lv_num_selected => 1.
        CALL SCREEN 9200.
*        PERFORM process_update.
*        CALL SCREEN 9200.
      ELSE.
        MESSAGE 'Please select at least one record' TYPE 'E' DISPLAY LIKE 'S'.
      ENDIF.
    WHEN 'SAVE'.
*      PERFORM save_data.
    WHEN 'DELETE'.
      g_grid->get_selected_rows(  IMPORTING et_index_rows = lt_rows ).
      lv_num_selected = lines( lt_rows ).

      IF lv_num_selected >= 1.
        CALL FUNCTION 'POPUP_TO_CONFIRM'
          EXPORTING
            titlebar       = 'Warning Message!'
            text_question  = 'Are you sure to delete this record?'
            text_button_1  = 'Yes'
            icon_button_1  = ' '
            text_button_2  = 'No'
            icon_button_2  = ' '
          IMPORTING
            answer         = lv_answer
          EXCEPTIONS
            text_not_found = 1
            OTHERS         = 2.

        IF lv_answer = '1'.
          MESSAGE 'Data has been removed successfully' TYPE 'S'.
          PERFORM process_delete.

        ELSE.
          LEAVE TO SCREEN 1000.
        ENDIF.
      ELSE.
        MESSAGE 'Please select at least one record' TYPE 'E'  DISPLAY LIKE 'S'.
      ENDIF.

    WHEN OTHERS.
  ENDCASE.

ENDMODULE.
