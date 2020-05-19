@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forInventory'
define root view entity ZRAP_C_INVENTORY_CG1
  as projection on ZRAP_I_INVENTORY_CG1
{
  key Uuid            as Uuid,

      InventoryId     as InventoryId,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZRAP_CE_PRODUCTS_CG1', element: 'Product' } }]
      ProductId       as ProductId,

      Quantity        as Quantity,

      QuantityUnit    as QuantityUnit,

      QuantityInWords as QuantityInWords,

      Remark          as Remark,

      NotAvailable    as NotAvailable,

      CreatedBy       as CreatedBy,

      CreatedAt       as CreatedAt,

      LastChangedBy   as LastChangedBy,

      LastChangedAt   as LastChangedAt
}
