/********** GENERATED on 05/19/2020 at 11:45:09 by CB0000000012**************/
 @OData.entitySet.name: 'SEPMRA_I_Product_E' 
 @OData.entityType.name: 'SEPMRA_I_Product_EType' 
 define root abstract entity ZSEPMRA_I_PROD_CG1 { 
 key Product : abap.char( 10 ) ; 
 @Odata.property.valueControl: 'Currency_vc' 
 @Semantics.currencyCode: true 
 Currency : abap.cuky ; 
 Currency_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Height_vc' 
 @Semantics.quantity.unitOfMeasure: 'DimensionUnit' 
 Height : abap.dec( 13, 3 ) ; 
 Height_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Width_vc' 
 @Semantics.quantity.unitOfMeasure: 'DimensionUnit' 
 Width : abap.dec( 13, 3 ) ; 
 Width_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Depth_vc' 
 @Semantics.quantity.unitOfMeasure: 'DimensionUnit' 
 Depth : abap.dec( 13, 3 ) ; 
 Depth_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'DimensionUnit_vc' 
 @Semantics.unitOfMeasure: true 
 DimensionUnit : abap.unit( 3 ) ; 
 DimensionUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductPictureURL_vc' 
 ProductPictureURL : abap.char( 255 ) ; 
 ProductPictureURL_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductValueAddedTax_vc' 
 ProductValueAddedTax : abap.int1 ; 
 ProductValueAddedTax_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Supplier_vc' 
 Supplier : abap.char( 10 ) ; 
 Supplier_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductBaseUnit_vc' 
 ProductBaseUnit : abap.char( 3 ) ; 
 ProductBaseUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Weight_vc' 
 @Semantics.quantity.unitOfMeasure: 'WeightUnit' 
 Weight : abap.dec( 13, 3 ) ; 
 Weight_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductUUID_vc' 
 ProductUUID : sysuuid_x16 ; 
 ProductUUID_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'WeightUnit_vc' 
 @Semantics.unitOfMeasure: true 
 WeightUnit : abap.unit( 3 ) ; 
 WeightUnit_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'OriginalLanguage_vc' 
 OriginalLanguage : abap.char( 2 ) ; 
 OriginalLanguage_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductType_vc' 
 ProductType : abap.char( 2 ) ; 
 ProductType_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'ProductCategory_vc' 
 ProductCategory : abap.char( 40 ) ; 
 ProductCategory_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreatedByUser_vc' 
 CreatedByUser : sysuuid_x16 ; 
 CreatedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'CreationDateTime_vc' 
 CreationDateTime : tzntstmpl ; 
 CreationDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangedByUser_vc' 
 LastChangedByUser : sysuuid_x16 ; 
 LastChangedByUser_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'LastChangedDateTime_vc' 
 LastChangedDateTime : tzntstmpl ; 
 LastChangedDateTime_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 @Odata.property.valueControl: 'Price_vc' 
 @Semantics.amount.currencyCode: 'Currency' 
 Price : abap.curr( 16, 3 ) ; 
 Price_vc : RAP_CP_ODATA_VALUE_CONTROL ; 
 
 } 
