*** Keywords ***
Click calendar
    common_web.Click element when ready    ${delivery_order_locator.txt_calendar}

Click search button
    common_web.Click element when ready    ${delivery_order_locator.btn_search_job}

Click card by trip number
    [Arguments]    ${trip_number}
    ${locator}=    Replace String    ${delivery_order_locator.lbl_trip_number}    {trip_no}    ${trip_number}
    common_web.Click element when ready    ${locator}

Click task icon
    common_web.Click element when ready    ${delivery_order_locator.btn_task_icon}

Click home icon
    common_web.Click element when ready    ${delivery_order_locator.btn_home_icon}

Click camera icon
    common_web.Click element when ready    ${delivery_order_locator.btn_camera_icon}

Upload deliver order image
    Browser.Upload File By Selector    ${delivery_order_locator.btn_upload_image}    ${CURDIR}/../../../resources/testdata/img/products.jpg

Click confirm upload image
    common_web.Click element when ready    ${delivery_order_locator.btn_comfirm_upload_image}

Click people carry
    common_web.Click element when ready    ${delivery_order_locator.btn_people_carry_icon}

Click comfirm product amount
    common_web.Click element when ready    ${delivery_order_locator.btn_comfirm_close_job}

Click checkout icon
    common_web.Click element when ready    ${delivery_order_locator.btn_checkout_icon}

Click checkin at home button
    common_web.Click element when ready    ${delivery_order_locator.btn_checkin_at_home}

Click confirm delivery
    common_web.Click element when ready    ${delivery_order_locator.btn_comfirm_signature}