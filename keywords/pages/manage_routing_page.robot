*** Keywords ***
Click calendar icon
    common_web.Click element when ready    ${manage_routing_locator.btn_calendar}

Click date
    common_web.Click element when ready    ${manage_routing_locator.lbl_date}

Click prev icon
    common_web.Click element when ready    ${manage_routing_locator.btn_prev_month}

Click next icon
    common_web.Click element when ready    ${manage_routing_locator.btn_next_month}

Click search icon
    common_web.Click element when ready    ${manage_routing_locator.btn_search}

Click select driver dropdown
    common_web.Click element when ready    ${manage_routing_locator.txt_select_driver}

Click select driver
    common_web.Click element when ready    ${manage_routing_locator.lbl_select_driver}

Click select driver name dropdown
    common_web.Click element when ready    ${manage_routing_locator.txt_select_driver_name}

Click select driver name
    ${locator_driver_name}=     Replace String    ${manage_routing_locator.lbl_select_driver_name}    {name}    ${driver_name}
    common_web.Click element when ready    ${locator_driver_name}

Click close icon
    common_web.Click element when ready    ${manage_routing_locator.btn_close}

Click check box order
    ${locator_checkbox_order}=     Replace String    ${manage_routing_locator.chk_order}    {order}    ${order_no}
    common_web.Click element when ready    ${locator_checkbox_order}

Click add job button
    common_web.Click element when ready    ${manage_routing_locator.btn_add_job}

Verify alert success
    Browser.Wait For Elements State    ${manage_routing_locator.lbl_alert_success}    visible    timeout=10s
