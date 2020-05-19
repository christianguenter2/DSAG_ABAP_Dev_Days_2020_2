CLASS zrap_cl_test_soap_call_cg1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_oo_adt_classrun.

    METHODS:
      get_numbers_in_words
        IMPORTING
          iv_number                 TYPE znumber_to_words_soap_request-ubi_num
        RETURNING
          VALUE(rv_number_in_words) TYPE string.

ENDCLASS.


CLASS zrap_cl_test_soap_call_cg1 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( get_numbers_in_words( 251234568901401 ) ).

  ENDMETHOD.

  METHOD get_numbers_in_words.

    TRY.
        DATA(destination) = cl_soap_destination_provider=>create_by_url( i_url = 'https://www.dataaccess.com/webservicesserver/numberconversion.wso' ).

        NEW zco_number_conversion_soap_typ( destination = destination )->number_to_words(
          EXPORTING
            input = VALUE znumber_to_words_soap_request( ubi_num = iv_number )
          IMPORTING
            output = DATA(response) ).

        rv_number_in_words = response-number_to_words_result.

        "handle response
      CATCH cx_soap_destination_error.
        rv_number_in_words = 'soap error'.
      CATCH cx_ai_system_fault.
        rv_number_in_words = 'system error'.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
