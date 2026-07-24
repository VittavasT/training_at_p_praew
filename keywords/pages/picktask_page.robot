*** Keywords ***
Input order number
    [Arguments]    ${order_number}
    Browser.Fill text    ${picktask_locator.txt_order}    ${order_number}

Click show pick list button
    common_web.Click element when ready    ${picktask_locator.btn_showpicklist}
    Browser.Wait For Elements State    ${picktask_locator.tbl_picktasklist}    visible    timeout=10s

Click checkbox order
    common_web.Click element when ready    ${picktask_locator.chk_order}

Click checkbox print pick ticket
    common_web.Click element when ready    ${picktask_locator.chk_printticket}

Click checkbox print pick ticket by zone
    common_web.Click element when ready    ${picktask_locator.chk_printticketbyzone}

Click print button
    common_web.Click element when ready    ${picktask_locator.btn_print}

Click save button
    common_web.Click element when ready    ${picktask_locator.btn_save}

Verfy successful popup
    Browser.Wait For Elements State    ${picktask_locator.lbl_sucess}    visible    timeout=10s