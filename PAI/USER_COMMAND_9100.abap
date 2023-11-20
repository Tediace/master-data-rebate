*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9100 INPUT.
  save_ok = ok_code.
  CLEAR ok_code.

  CASE save_ok.
*    WHEN 'ENTER'.
**     w_srebate-vkorg = ztlpvt007-vkorg.
**     APPEND w_srebate to g_srebate.
*      SELECT SINGLE vtext
*        FROM tvkot
*        INTO tvkot-vtext
*        WHERE spras = sy-langu AND
*              vkorg = w_srebate-vkorg.

    WHEN 'SAVE'.
*      INSERT INTO ztlpvt007 VALUES lw_ztlpvt007.
      PERFORM save_data.
    WHEN OTHERS.
  ENDCASE.
ENDMODULE.
