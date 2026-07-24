*** Keywords ***
Click create new box button
    common_web.Click element when ready     ${confirm_pick_locator.btn_create_new_box}

Input box qty
    common_web.Fill text when element is ready    ${confirm_pick_locator.txt_box_qty}    ${box_qty}

Click confirm button
    common_web.Click element when ready     ${confirm_pick_locator.btn_confirm}

Click pack icon
    common_web.Click element when ready     ${confirm_pick_locator.btn_pack_icon}

Select item
    common_web.Click element when ready     ${confirm_pick_locator.tbl_pack_item}

