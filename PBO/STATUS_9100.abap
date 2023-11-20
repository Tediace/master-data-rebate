*&---------------------------------------------------------------------*
*& Module STATUS_9100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9100 OUTPUT.
  SET PF-STATUS 'STATUS9100'.
  SET TITLEBAR 'TITLE9100'.

  PERFORM process_create.
  PERFORM toolbar_excluding CHANGING gt_excluding.

  IF gt_custom_container IS INITIAL.
    CREATE OBJECT gt_custom_container EXPORTING container_name = gt_container.
    CREATE OBJECT gt_grid EXPORTING i_parent = gt_custom_container.

    PERFORM fieldcatalog_alv_create.
    gs_layout-zebra = 'X'.
    gs_layout-edit = 'X'. "makes all grdi editable
*    gs_layout-no_toolbar = 'X'.
*    gs_layout-find = 'X'.

*    SET_TABLE_FOR_FIRST_DISPLAY
    CALL METHOD gt_grid->set_table_for_first_display
      EXPORTING
        is_layout            = gs_layout
        it_toolbar_excluding = gt_excluding
      CHANGING
        it_fieldcatalog      = gt_fieldcatalog
        it_outtab            = gt_rebate.
  ELSE.
    CALL METHOD gt_grid->refresh_table_display.
  ENDIF.
ENDMODULE.
