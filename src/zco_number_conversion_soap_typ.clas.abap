class ZCO_NUMBER_CONVERSION_SOAP_TYP definition
  public
  inheriting from CL_PROXY_CLIENT
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !DESTINATION type ref to IF_PROXY_DESTINATION optional
      !LOGICAL_PORT_NAME type PRX_LOGICAL_PORT_NAME optional
    preferred parameter LOGICAL_PORT_NAME
    raising
      CX_AI_SYSTEM_FAULT .
  methods NUMBER_TO_DOLLARS
    importing
      !INPUT type ZNUMBER_TO_DOLLARS_SOAP_REQUES
    exporting
      !OUTPUT type ZNUMBER_TO_DOLLARS_SOAP_RESPON
    raising
      CX_AI_SYSTEM_FAULT .
  methods NUMBER_TO_WORDS
    importing
      !INPUT type ZNUMBER_TO_WORDS_SOAP_REQUEST
    exporting
      !OUTPUT type ZNUMBER_TO_WORDS_SOAP_RESPONSE
    raising
      CX_AI_SYSTEM_FAULT .
protected section.
private section.
ENDCLASS.



CLASS ZCO_NUMBER_CONVERSION_SOAP_TYP IMPLEMENTATION.


  method CONSTRUCTOR.

  super->constructor(
    class_name          = 'ZCO_NUMBER_CONVERSION_SOAP_TYP'
    logical_port_name   = logical_port_name
    destination         = destination
  ).

  endmethod.


  method NUMBER_TO_DOLLARS.

  data(lt_parmbind) = value abap_parmbind_tab(
    ( name = 'INPUT' kind = '0' value = ref #( INPUT ) )
    ( name = 'OUTPUT' kind = '1' value = ref #( OUTPUT ) )
  ).
  if_proxy_client~execute(
    exporting
      method_name = 'NUMBER_TO_DOLLARS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method NUMBER_TO_WORDS.

  data(lt_parmbind) = value abap_parmbind_tab(
    ( name = 'INPUT' kind = '0' value = ref #( INPUT ) )
    ( name = 'OUTPUT' kind = '1' value = ref #( OUTPUT ) )
  ).
  if_proxy_client~execute(
    exporting
      method_name = 'NUMBER_TO_WORDS'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.
ENDCLASS.
