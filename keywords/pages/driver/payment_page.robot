*** Keywords ***
Click cash image
    common_web.Click element when ready    ${payment_locator.img_cash}

Verify video is showing
    Browser.Wait For Elements State    ${payment_locator.video}    visible    timeout=10s

Click capture button
    common_web.Click element when ready    ${payment_locator.btn_capture}

Click save
    common_web.Click element when ready    ${payment_locator.btn_save_capture}

