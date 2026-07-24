*** Keywords ***
Packing item product
    [Arguments]    ${package_no}
    pack_item_page.Input package number    ${package_no}
    ${item_info}    pack_item_feature.Get product info
    pack_item_feature.Pack item by item type    ${item_info}
    pack_item_page.Click confirm pack button
    pack_item_page.Click save to location button


Get product info
    ${name}=          Get Text    ${pack_item_locator.lbl_item_name}
    ${sku}=           Get Text    ${pack_item_locator.lbl_item_sku}
    ${barcode}=       Get Text    ${pack_item_locator.lbl_item_barcode}
    ${order_qty}=     Get Text    ${pack_item_locator.lbl_item_order_qty} 
    ${picked_qty}=    Get Text    ${pack_item_locator.lbl_item_picked_qty}

    VAR    &{item_info}
    ...    name=${name}
    ...    sku=${sku}
    ...    barcode=${barcode}
    ...    order_qty=${order_qty}
    ...    picked_qty=${picked_qty}
    Log To Console    ${item_info}
    RETURN    ${item_info}

Pack item by item type
    [Arguments]    ${item}

    IF    "PLU" in $item.name
        ${plu}=    Evaluate    ''.join(c for c in $item.name[$item.name.find('PLU'):$item.name.find('PLU')+15] if c.isdigit())
             Log To Console    PLU = ${plu}
        pack_item_feature.Pack item weight    ${item}    ${plu}
    ELSE
        pack_item_feature.Pack item standard    ${item}
    END

Pack item standard
    [Arguments]    ${item}
    FOR    ${index}    IN RANGE    ${item.order_qty}
        Browser.Fill Text    ${pack_item_locator.txt_item_barcode}    ${item.barcode}
        Browser.Keyboard Key    press    Enter
    END

Pack item weight
    [Arguments]    ${item}    ${plu_code}
    ${barcode_weight}=    pack_item_feature.Get weight barcode    ${item}    ${plu_code}
    Browser.Fill Text    ${pack_item_locator.txt_weight_barcode}    ${barcode_weight}
    Browser.Keyboard Key    press    Enter

Get weight barcode
    [Arguments]    ${item}    ${plu}
    ${qty_int}=    Evaluate    int(round(float($item.order_qty) * 1000))
    ${qty_str}=    Evaluate    f"{$qty_int:06d}"
    ${barcode_weight}=    Set Variable    31${plu}00000000${qty_str}1
    Log To Console    barcode_weight = ${barcode_weight}
    RETURN    ${barcode_weight}
