*** Settings ***
Resource    ${CURDIR}/../resources/import.robot

*** Test Cases ***
TC002 Delivery Flow Pick:normal Deliver:short_patial payment:POD Cash
    
    ## Admin pick task and assign jobs
    login_feature.Open web and login sts as admin role
    home_feature.Go to order pick task page
    picktask_feature.Search pick task    ${order_no}
    picktask_feature.Select order and print ticket
    home_feature.Go to jobs list page
    jobslist_feature.Search jobs by order number    ${order_no}
    jobslist_feature.Edit picker by store

    ## Picker pack order
    login_feature.Open web and login ops as picker role
    daily_task_feature.Picker go to daily task and packing product

    ## Admin check order status
    Browser.Switch Page    ${WEB_ROLE_ADMIN}
    home_feature.Go to customer info    ${order_no}
    ${delivery_date}    customer_info_feature.Get delivery date
    
    ## Admin assign task to driver
    home_feature.Go to manage delivery
    manage_routing_feature.Assign task to driver    ${delivery_date}
    home_feature.Go to confirm truck
    confirm_truck_feature.Confirm truck

    ## Driver receive order
    login_feature.Open web and login sts as driver role
    home_page.Click menu receive order
    receive_order_feature.Driver select deliver date job    ${delivery_date}
    ${qr_code}    receive_order_feature.Get QR Code Value From Preview

    ## Picker scan confirm driver
    Browser.Switch Page    ${WEB_ROLE_PICKER}
    home_page.Click menu scan confirm driver
    scan_confirm_driver_page.Input barcode value    ${qr_code}
    scan_confirm_driver_feature.Draw Signature

    ## Admin get trip number
    Browser.Switch Page    ${WEB_ROLE_ADMIN}
    home_feature.Go to daily job report page
    ${trip_no}    daily_job_report_feature.Get trip number    ${delivery_date}    ${order_no}

    ## Driver delivery order
    Browser.Switch Page    ${WEB_ROLE_DRIVER}
    home_page.Click menu delivery
    delivery_order_feature.Select delivery job    ${order_no}    ${trip_no}    ${delivery_date}
    # delivery_order_feature.Deliver order
    # payment_feature.Payment via cash

    # ## Admin check order status
    # Browser.Switch Page    ${WEB_ROLE_ADMIN}
    # home_feature.Go to customer info    ${order_no}
    # ${order_status}    customer_info_page.Get Order Status Text
    # Log To Console    order_status = ${order_status}
    # ${receipt_no}    customer_info_page.Get Receipt No By Row
    # Log To Console    receipt_no = ${receipt_no}
    # Browser.Take Screenshot    filename=${OUTPUT_DIR}/screenshots/TC002_result.png    fullPage=True

