*** Keywords ***
Click check box delivery date
    common_web.Click element when ready    ${daily_job_report_locator.chk_delivery_date}

Click start date
    common_web.Click element when ready    ${daily_job_report_locator.txt_start_date}

Click end date
    common_web.Click element when ready    ${daily_job_report_locator.txt_end_date}

Click search button
    common_web.Click element when ready    ${daily_job_report_locator.btn_search}

    