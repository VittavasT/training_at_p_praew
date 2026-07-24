*** Variables ***
${jobslist_locator.txt_searchjob}    css=#textSearch
${jobslist_locator.btn_searchjob}    css=#textSearch~span>button>.fa.fa-search
${jobslist_locator.lbl_task_wrapper}    css=#divDataPickingTaskData
${jobslist_locator.lbl_task_card}    css=#divDataPickingTaskData>.PickingTask
${jobslist_locator.lbl_picker}       css=#select2-selPickerByStore-container
${jobslist_locator.lbl_picker_item}    css=li:has-text("{picker_name}")
${jobslist_locator.btn_save}         css=#btConfirmItem
${jobslist_locator.lbl_card_orderno}    css=#lbWebOrderNo~label:has-text("${order_no}")