*** Keywords ***
Click total job tab
    common_web.Click element when ready     ${daily_task_locator.lbl_total_jobdata}
    Browser.Wait For Elements State    ${daily_task_locator.lbl_job_card}    visible    timeout=10s

Click select job card by order
    common_web.Click element when ready     ${daily_task_locator.lbl_job_card_by_order_1}

Click receive job
    common_web.Click element when ready     ${daily_task_locator.btn_receive}
