*** Keywords ***
Input package number
    [Arguments]    ${package_no}
    common_web.Fill text when element is ready    ${pack_item_locator.txt_box_number}    ${package_no}

Click confirm pack button
    common_web.Click element when ready    ${pack_item_locator.btn_confirm}

Click save to location button
    common_web.Click element when ready    ${pack_item_locator.btn_save_to_location}
