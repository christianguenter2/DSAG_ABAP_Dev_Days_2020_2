CLASS zrap_cl_cq_products_cg1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_rap_query_provider.

ENDCLASS.


CLASS zrap_cl_cq_products_cg1 IMPLEMENTATION.

  METHOD if_rap_query_provider~select.

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


        DATA lt_orderby TYPE /iwbep/if_cp_runtime_types=>ty_t_sort_order.
        DATA(ls_paging)      = io_request->get_paging( ).
        "  DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).
        DATA(lt_fields)      = io_request->get_requested_elements( ).
        DATA(lt_sort)        = io_request->get_sort_elements( ).

        LOOP AT io_request->get_sort_elements( ) INTO DATA(ls_sort_element).
          APPEND INITIAL LINE TO lt_orderby ASSIGNING FIELD-SYMBOL(<ls_orderby>).
          <ls_orderby>-property_path = ls_sort_element-element_name.
          <ls_orderby>-descending = ls_sort_element-descending.
        ENDLOOP.
        lo_request->set_orderby( lt_orderby ).
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

        "        lo_request->set_top( 50 )->set_skip( 0 ).

        lo_request->set_top( io_request->get_paging( )->get_page_size( ) ).

        " Execute the request and retrieve the business data
        lo_response = lo_request->execute( ).
        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

        io_response->set_data( lt_business_data ).

        IF io_request->is_total_numb_of_rec_requested( ).
          io_response->set_total_number_of_records( lines( lt_business_data ) ).
        ENDIF.

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " Handle Exception

    ENDTRY.


  ENDMETHOD.

ENDCLASS.
