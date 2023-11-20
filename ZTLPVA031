************************************************************************
*   Program    :  ZTLPVA031
*   Created by :
*   Created on :
*   Version    :  1.0
************************************************************************
*   Description :
*
*   Sample program structure
*
*
*
*
************************************************************************
*   Modification Log:
*   Date         Programmer          Correction    Description
*
************************************************************************

REPORT ztlpva031.

*----------------------------------------------------------------------*
*   I N C L U D E                                                      *
*----------------------------------------------------------------------*

INCLUDE ztlpva031top.

INCLUDE ztlpva031f01.

INCLUDE ztlpva031o01.

INCLUDE ztlpva031i01.

*----------------------------------------------------------------------*
*   S T A R T   O F   S E L E C T I O N                                *
*----------------------------------------------------------------------*

START-OF-SELECTION.
  CALL SCREEN 1000.

*----------------------------------------------------------------------*
*   AT   S E L E C T I O N   S C R E E N                               *
*----------------------------------------------------------------------*

AT SELECTION-SCREEN OUTPUT.
  PERFORM create_gui_status.

AT SELECTION-SCREEN.
  CASE sy-ucomm.
    WHEN gc_create.
      PERFORM process_create.
    WHEN gc_update.
      PERFORM process_update.
    WHEN gc_delete.
      PERFORM process_delete.
  ENDCASE.
