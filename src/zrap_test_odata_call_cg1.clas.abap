CLASS zrap_test_odata_call_cg1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_oo_adt_classrun.

ENDCLASS.



CLASS zrap_test_odata_call_cg1 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_business_data TYPE TABLE OF zsepmra_i_prod_cg1,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

    "DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
    "      lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
    "      lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
    "      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
    "      lt_range_product TYPE RANGE OF <element_name>,
    "      lt_range_currency TYPE RANGE OF <element_name>.


    TRY.
        " Create http client
        " Details depend on your connection settings
        "lo_http_client = cl_web_http_client_manager=>create_by_http_destination(
        "                          cl_http_destination_provider=>create_by_cloud_destination(
        "                                  i_name                  = '<Name of Cloud Destination>'
        "                                  i_service_instance_name = '<Service Instance Name>' ) ).

        DATA lv_base_url TYPE string.
        DATA lv_service_root TYPE string.

        lv_base_url = 'https://sapes5.sapdevcenter.com'.
        lv_service_root = '/sap/opu/odata/sap/ZPDCDS_SRV'.
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = cl_http_destination_provider=>create_by_url( i_url = lv_base_url ) ).

        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
          EXPORTING
            iv_service_definition_name = 'ZRAP_SC_PRODUCTS_CG1'
            io_http_client             = lo_http_client
            iv_relative_service_root   = lv_service_root ).


        " Navigate to the resource and create a request for the read operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( 'SEPMRA_I_PRODUCT_E' )->create_request_for_read( ).


        " Create the filter tree
        "lo_filter_factory = lo_request->create_filter_factory( ).
        "
        "lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'product'
        "                                                        it_range             = lt_range_product ).
        "lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'currency'
        "                                                        it_range             = lt_range_currency ).
        "lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
        "
        "lo_request->set_filter( lo_filter_node_root ).

        lo_request->set_top( 50 )->set_skip( 0 ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

    ENDTRY.

    LOOP AT lt_business_data ASSIGNING FIELD-SYMBOL(<ls_business_data>).
      out->write( <ls_business_data> ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
