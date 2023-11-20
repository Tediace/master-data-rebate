*&---------------------------------------------------------------------*
*& Module STATUS_9200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9200 OUTPUT.
  SET PF-STATUS 'STATUS9200'.
  SET TITLEBAR 'TITLE9200'.

  PERFORM process_update.
  PERFORM toolbar_excluding CHANGING gt_excluding.

  IF gl_custom_container IS INITIAL.
    CREATE OBJECT gl_custom_container EXPORTING container_name = gl_container.
    CREATE OBJECT gl_grid EXPORTING i_parent = gl_custom_container.
    PERFORM toolbar_excluding CHANGING gt_excluding.
    PERFORM fieldcatalog_alv_data.
    gs_layout-zebra = 'X'.
*    gs_layout-edit = 'X'. "makes all grdi editable

    "SET_TABLE_FOR_FIRST_DISPLAY
    CALL METHOD gl_grid->set_table_for_first_display
      EXPORTING
        is_layout            = gs_layout
        it_toolbar_excluding = gt_excluding
      CHANGING
        it_fieldcatalog      = g_fieldcatalog
        it_outtab            = gt_urebate.
  ELSE.
    CALL METHOD gl_grid->refresh_table_display.
  ENDIF.

ENDMODULE.
