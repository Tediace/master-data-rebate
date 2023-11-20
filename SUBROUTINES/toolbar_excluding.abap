*&---------------------------------------------------------------------*
*& Form toolbar_excluding
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM toolbar_excluding CHANGING pt_exclude TYPE ui_functions.
  DATA gs_excluding TYPE ui_func.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_delete_row.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_append_row.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_insert_row.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_append_row.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_move_row.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_copy_row.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_cut.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_paste.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_mb_view.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_print_back.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_info.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_mb_variant.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_mb_export.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_mb_subtot.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_mb_sum.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_undo.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_mb_paste.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_loc_copy.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_fc_check.
  APPEND gs_excluding TO pt_exclude.
  gs_excluding = cl_gui_alv_grid=>mc_mb_filter.
  APPEND gs_excluding TO pt_exclude.
ENDFORM.
