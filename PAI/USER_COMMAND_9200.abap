*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9200 INPUT.
  CASE sy-ucomm.
    WHEN 'ENTR'.
      CLEAR ztlpvt007.
      CLEAR wa_drebate.
    WHEN 'BACK' OR 'EXIT' OR 'CANCEL'.
      LEAVE TO SCREEN 0.
    WHEN 'SAVE'.
      PERFORM save_data_update.
      IF sy-subrc = 0.
        MESSAGE 'Rebate Details updated successfully' TYPE 'S'.
        CALL SCREEN 1000.
      ELSE.
        MESSAGE 'Rebate is not updated' TYPE 'E'.
      ENDIF.
    WHEN OTHERS.
  ENDCASE.
ENDMODULE.
