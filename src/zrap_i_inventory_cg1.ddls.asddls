@AbapCatalog: {
  sqlViewName: 'ZRAP_VINVENT_CG1', 
  compiler.compareFilter: true, 
  preserveKey: true
}
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forInventory'
define ROOT view ZRAP_I_INVENTORY_CG1
  as select from ZRAP_INVEN_CG1
{
  key UUID as Uuid,
  
  INVENTORY_ID as InventoryId,
  
  PRODUCT_ID as ProductId,
  
  QUANTITY as Quantity,
  
  QUANTITY_UNIT as QuantityUnit,
  
  QUANTITY_IN_WORDS as QuantityInWords,
  
  REMARK as Remark,
  
  NOT_AVAILABLE as NotAvailable,
  
  @Semantics.user.createdBy: true
  CREATED_BY as CreatedBy,
  
  @Semantics.systemDateTime.createdAt: true
  CREATED_AT as CreatedAt,
  
  @Semantics.user.lastChangedBy: true
  LAST_CHANGED_BY as LastChangedBy,
  
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt
}
