*** Variables ***
${daily_task_locator.lbl_total_jobdata}    css=#spTotalJobData
${daily_task_locator.lbl_job_card}         css=#frmTotalJobData
${daily_task_locator.lbl_job_card_by_order}     css=#divTotalJob>div:has(#lbWebOrderNo~label:has-text("${order_no}"))
${daily_task_locator.lbl_job_card_by_order_1}     css=#divTotalJob>div:has(#lbWebOrderNo~label:has-text("${order_no}"))>>nth=0
${daily_task_locator.btn_receive}        css=#btnReceviceJob
${daily_task_locator.lbl_all_job_card}    css=#divTotalJob
