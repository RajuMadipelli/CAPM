sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ust.raju.purchaseorderapp',
            componentId: 'POItemsObjectPage',
            contextPath: '/POs/Items'
        },
        CustomPageDefinitions
    );
});