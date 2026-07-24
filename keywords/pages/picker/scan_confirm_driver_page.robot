*** Keywords ***
Input barcode value
    [Arguments]    ${ref_code}
    common_web.Fill text when element is ready    ${scan_confirm_driver.txt_ref_order}    ${ref_code}
    common_web.Wait for UI to settle
    Browser.Keyboard Key    press    Enter

Click signature button
    common_web.Click element when ready    ${scan_confirm_driver.btn_sign}

Click save button
    common_web.Click element when ready    ${scan_confirm_driver.btn_save}