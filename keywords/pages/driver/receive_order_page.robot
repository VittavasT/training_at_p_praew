*** Keywords ***
Click calendar
    common_web.Click element when ready    ${receive_order_locator.txt_calendar}

Click search button
    common_web.Click element when ready    ${receive_order_locator.btn_search_job}

Click job card
    common_web.Click element when ready    ${receive_order_locator.lbl_job_card}

Click task icon
    common_web.Click element when ready    ${receive_order_locator.btn_task}

Click store icon
    common_web.Click element when ready    ${receive_order_locator.btn_store}

Click confirm store checkin
    common_web.Click element when ready    ${receive_order_locator.btn_confirm_store_checkin}

Click camera icon
    common_web.Click element when ready    ${receive_order_locator.btn_camera}

Upload driver received order image
    Browser.Upload File By Selector    ${receive_order_locator.btn_upload_image}    ${CURDIR}/../../../resources/testdata/img/driver-received-order.jpg

Click confirm upload image
    common_web.Click element when ready    ${receive_order_locator.btn_confirm_upload_image}

Click confirm truck loading icon
    common_web.Click element when ready    ${receive_order_locator.btn_confirm_truck_loading}

Click order package check box
    @{checkboxes}=    Get Elements    ${receive_order_locator.chk_select_package}
    FOR    ${checkbox}    IN    @{checkboxes}
        common_web.Click element when ready    ${checkbox}
    END

Click next step button
    common_web.Click element when ready    ${receive_order_locator.btn_next_step}

Verify qr code image is showing
    Browser.Wait For Elements State    ${receive_order_locator.img_qr_review}    visible    timeout=10s
    common_web.Wait for UI to settle

