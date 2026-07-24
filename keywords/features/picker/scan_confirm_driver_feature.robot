*** Keywords ***
Draw Signature
    scan_confirm_driver_page.Click signature button
    common_web.Draw Horizontal Line As Signature    ${scan_confirm_driver.canvas_signature}
    scan_confirm_driver_page.Click save button
