*&---------------------------------------------------------------------*
*& Include          ZTLPVA031O01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_1000 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_1000 OUTPUT.
  SET PF-STATUS 'STATUS1000'.
  SET TITLEBAR 'TITLE1000'.

  PERFORM create_data.
  PERFORM toolbar_excluding CHANGING gt_excluding.

  IF g_custom_container IS INITIAL.
    CREATE OBJECT g_custom_container EXPORTING container_name = g_container.
    CREATE OBJECT g_grid EXPORTING i_parent = g_custom_container.

    PERFORM prepare_fieldcatalog_alv.
    gs_layout-zebra = 'X'.
    gs_layout-sel_mode = 'A'.
*    gs_layout-edit = 'X'. "makes all grdi editable

    "SET_TABLE_FOR_FIRST_DISPLAY
    CALL METHOD g_grid->set_table_for_first_display
      EXPORTING
        is_layout            = gs_layout
        i_save               = 'A'
        it_toolbar_excluding = gt_excluding
      CHANGING
        it_fieldcatalog      = gs_fieldcatalog
        it_outtab            = gt_drebate.
  ELSE.
    CALL METHOD g_grid->refresh_table_display.
  ENDIF.

ENDMODULE.
