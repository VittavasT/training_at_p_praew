*** Keywords ***
Select calendar date
    [Arguments]    ${date}
    ${day}=      Evaluate    "${date}".split('/')[0]
    ${month}=    Evaluate    "${date}".split('/')[1]
    ${year}=     Evaluate    "${date}".split('/')[2]
    ${target_month_label}=    Evaluate
        ...    datetime.datetime.strptime("${month}/${year}", "%m/%Y").strftime("%b %Y")
        ...    modules=datetime

        WHILE    True
            ${current_month_label}=    Browser.Get Text    ${receive_order_locator.lbl_month}
            IF    "${current_month_label}" == "${target_month_label}"
                BREAK
            END

            ${current_date}=    Evaluate    datetime.datetime.strptime("${current_month_label}", "%b %Y")    modules=datetime
            ${target_date}=     Evaluate    datetime.datetime.strptime("${target_month_label}", "%b %Y")    modules=datetime

            IF    $target_date > $current_date
                Browser.Click    ${receive_order_locator.btn_next_month}
            ELSE
                Browser.Click    ${receive_order_locator.btn_prev_month}
            END
        END

    ${day_no}=    Evaluate    str(int("${day}"))
    ${day_locator}=     Replace String    ${receive_order_locator.lbl_date_no}    {day}    ${day_no}
    Browser.Click    ${day_locator}

Get QR Code Value From Preview
    ${qr_src}=    Get Attribute    ${receive_order_locator.img_qr_review}    src
    ${qr_value}=    Decode QR Code From Base64    ${qr_src}
    Log To Console    qr_value=${qr_value}
    RETURN    ${qr_value}

Driver select deliver date job
    [Arguments]    ${delivery_date}
    receive_order_page.Click calendar
    receive_order_feature.Select calendar date    ${delivery_date}
    receive_order_page.Click search button
    receive_order_page.Click job card
    receive_order_page.Click task icon
    receive_order_page.Click store icon
    receive_order_page.Click confirm store checkin
    receive_order_page.Click camera icon
    receive_order_page.Upload driver received order image
    receive_order_page.Click confirm upload image
    receive_order_page.Click confirm truck loading icon
    receive_order_page.Click order package check box
    receive_order_page.Click next step button
    receive_order_page.Verify qr code image is showing
    