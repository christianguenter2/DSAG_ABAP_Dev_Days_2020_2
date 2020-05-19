
CLASS lhc_inventory DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      calculate_semantic_key FOR DETERMINATION Inventory~CalculateSemanticKey
        IMPORTING
          it_keys FOR Inventory,

      fillquantityinwords FOR DETERMINATION Inventory~fillQuantityInWords
        IMPORTING keys FOR Inventory.

ENDCLASS.


CLASS lhc_inventory IMPLEMENTATION.

  METHOD calculate_semantic_key.

    SELECT FROM zrap_inven_cg1
      FIELDS MAX( inventory_id ) INTO @DATA(max_inventory_id).

    LOOP AT it_keys ASSIGNING FIELD-SYMBOL(<ls_key>).

      max_inventory_id += 1.

      MODIFY ENTITIES OF zrap_i_inventory_cg1 IN LOCAL MODE
        ENTITY inventory
        UPDATE SET FIELDS WITH VALUE #( ( Uuid = <ls_key>-Uuid InventoryId = max_inventory_id ) )
        REPORTED DATA(ls_reported).
      INSERT LINES OF ls_reported-inventory INTO TABLE reported-inventory.

    ENDLOOP.

  ENDMETHOD.


  METHOD fillquantityinwords.

    DATA lt_inventory_update TYPE TABLE FOR UPDATE zrap_i_inventory_CG1.
    DATA ls_inventory_update LIKE LINE OF lt_inventory_update.
    DATA ls_inventory_failed TYPE RESPONSE FOR FAILED EARLY zrap_i_inventory_CG1.
    DATA ls_inventory_reported TYPE RESPONSE FOR REPORTED EARLY zrap_i_inventory_CG1.

    DATA(result) = NEW  zrap_cl_test_soap_call_CG1(  ).    " Read relevant inventory instance data

    READ ENTITIES OF zrap_i_inventory_CG1 IN LOCAL MODE
      ENTITY Inventory
       FIELDS ( Quantity )
       WITH CORRESPONDING #(  keys )
      RESULT DATA(lt_inventory).

    LOOP AT lt_inventory INTO DATA(ls_inventory).
      ls_inventory_update-Uuid = ls_inventory-%key-Uuid.
      ls_inventory_update-QuantityInWords = result->get_numbers_in_words( CONV #( ls_inventory-Quantity ) ).
      ls_inventory_update-%control-QuantityInWords = if_abap_behv=>mk-on.
      APPEND ls_inventory_update TO lt_inventory_update.
    ENDLOOP.

    MODIFY ENTITIES OF zrap_i_inventory_CG1
      ENTITY Inventory UPDATE FROM lt_inventory_update
      MAPPED DATA(ls_inventory_mapped)
      FAILED ls_inventory_failed
      REPORTED ls_inventory_reported.

  ENDMETHOD.

ENDCLASS.
