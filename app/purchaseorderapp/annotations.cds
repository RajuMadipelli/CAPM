using  CatalogService as service from '../../srv/catalogService';

annotate service.POs with @(
    Common.DefaultValuesFunction:'getOrderDefaults',
    UI.SelectionFields:[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        GROSS_AMOUNT,
        OVERALL_STATUS
    ],
    UI.LineItem:[
        {
            $Type:'UI.DataField',
            Value:PO_ID
        },

        {
            $Type:'UI.DataField',
            Value:PARTNER_GUID.COMPANY_NAME
        },
        {
            $Type:'UI.DataField',
            Value:GROSS_AMOUNT
        }
        ,
        {
            $Type:'UI.DataField',
            Value:OVERALL_STATUS
        },
         {
            $Type : 'UI.DataFieldForAction',
            Action:'CatalogService.boost',
            Label:'boost',
            Inline:true
            
        },
          {
            $Type : 'UI.DataField',
            Value : OverallStatus,
            Criticality: ColorCode
        }
       
    ],
    UI.HeaderInfo:{
      
        TypeName : 'PO',
        
        TypeNamePlural: 'POs',
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        Description: {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        }},
  
    UI.Facets:[
        {
            $Type:'UI.CollectionFacet',
            Label:'General information',
            Facets:[

                {
                    $Type:'UI.ReferenceFacet',
                    Label:'Order details',
                    Target:'@UI.Identification'
                },
                {
                    $Type:'UI.ReferenceFacet',
                    Label:'Configuration details',
                    Target:'@UI.FieldGroup#SUPERMAN'
                }
               ],
               
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'PO Line Items',
            Target : 'Items/@UI.LineItem',
        }
    ],
    UI.Identification:[
        {
            $Type:'UI.DataField',
            Value:PO_ID
        },
        {
            $Type:'UI.DataField',
            Value:PARTNER_GUID_NODE_KEY
        },
        {
            $Type:'UI.DataField',
            Value:OVERALL_STATUS
        }

    ],
    UI.FieldGroup#SUPERMAN:{
        Label:'PO PRICING',
        Data:[
             {
            $Type:'UI.DataField',
            Value:GROSS_AMOUNT
        },
         {
            $Type:'UI.DataField',
            Value:NET_AMOUNT
        },
         {
            $Type:'UI.DataField',
            Value:TAX_AMOUNT
        },
        {
            $Type:'UI.DataField',
            Value:CURRENCY_code
        }
        ]
    }
) ;
annotate service.POItems  with @(
      UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },{
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },{
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },{
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },{
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },{
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        }

    ],
    UI.HeaderInfo:{
          TypeName : 'Item',
        TypeNamePlural : 'Items',
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        Description: {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION,
        }
    },


    UI.Facets:[
        {
            $Type:'UI.CollectionFacet',
            Label:'item details',
            Facets:[

                {
                    $Type:'UI.ReferenceFacet',
                    Label:'Order details',
                Target:'@UI.Identification'
                }]}],

     UI.Identification:[
        {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },{
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },{
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            }]
);
annotate CatalogService.POs with {
    PARTNER_GUID@(
        Common : { 
            Text : PARTNER_GUID.COMPANY_NAME,
         },
         ValueList.entity: CatalogService.BusinessPartnerSet
    );
    OVERALL_STATUS@(
        readonly
    )
};