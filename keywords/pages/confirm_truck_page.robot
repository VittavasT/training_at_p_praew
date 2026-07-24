*** Keywords ***
Input order number
    common_web.Fill text when element is ready    ${confirm_truck_locator.txt_order_no}    ${order_no}

Click search button
    common_web.Click element when ready    ${confirm_truck_locator.btn_search}

Click check box
    common_web.Click element when ready    ${confirm_truck_locator.chk_order}

Click save icon
    common_web.Click element when ready    ${confirm_truck_locator.btn_save_icon} 