*** Settings ***
Library    Browser
Library    BuiltIn
Library    String
Library    DebugLibrary
Library    ../resources/libraries/qrcode.py

### Test data ###
Variables    ${CURDIR}/testdata/web.yaml

### Setting ###
Variables    ${CURDIR}/settings/setting.yaml

### Common ###
Resource    ${CURDIR}/../keywords/common/common_web.robot

### Web page ###
Resource    ${CURDIR}/../keywords/pages/login_page.robot
Resource    ${CURDIR}/../keywords/pages/home_page.robot
Resource    ${CURDIR}/../keywords/pages/picktask_page.robot
Resource    ${CURDIR}/../keywords/pages/jobslist_page.robot
Resource    ${CURDIR}/../keywords/pages/picker/daily_task_page.robot
Resource    ${CURDIR}/../keywords/pages/picker/confirm_pick_page.robot
Resource    ${CURDIR}/../keywords/pages/picker/pack_item_page.robot
Resource    ${CURDIR}/../keywords/pages/picker/confirm_location_page.robot
Resource    ${CURDIR}/../keywords/pages/reprint_page.robot
Resource    ${CURDIR}/../keywords/pages/customer_info_page.robot
Resource    ${CURDIR}/../keywords/pages/manage_routing_page.robot
Resource    ${CURDIR}/../keywords/pages/confirm_truck_page.robot
Resource    ${CURDIR}/../keywords/pages/driver/receive_order_page.robot
Resource    ${CURDIR}/../keywords/pages/picker/scan_confirm_driver_page.robot
Resource    ${CURDIR}/../keywords/pages/daily_job_report_page.robot
Resource    ${CURDIR}/../keywords/pages/driver/delivery_order_page.robot
Resource    ${CURDIR}/../keywords/pages/driver/payment_page.robot

### Web feature ###
Resource    ${CURDIR}/../keywords/features/login_feature.robot
Resource    ${CURDIR}/../keywords/features/home_feature.robot
Resource    ${CURDIR}/../keywords/features/picktask_feature.robot
Resource    ${CURDIR}/../keywords/features/jobslist_feature.robot
Resource    ${CURDIR}/../keywords/features/picker/daily_task_feature.robot
Resource    ${CURDIR}/../keywords/features/picker/confirm_pick_feature.robot
Resource    ${CURDIR}/../keywords/features/picker/pack_item_feature.robot
Resource    ${CURDIR}/../keywords/features/picker/confirm_location_feature.robot
Resource    ${CURDIR}/../keywords/features/reprint_feature.robot
Resource    ${CURDIR}/../keywords/features/customer_info_feature.robot
Resource    ${CURDIR}/../keywords/features/manage_routing_feature.robot
Resource    ${CURDIR}/../keywords/features/confirm_truck_feature.robot
Resource    ${CURDIR}/../keywords/features/driver/receive_order_feature.robot
Resource    ${CURDIR}/../keywords/features/picker/scan_confirm_driver_feature.robot
Resource    ${CURDIR}/../keywords/features/daily_job_report_feature.robot
Resource    ${CURDIR}/../keywords/features/driver/delivery_order_feature.robot
Resource    ${CURDIR}/../keywords/features/driver/payment_feature.robot

### Web locator ###
Resource    ${CURDIR}/locators/login_locator.robot
Resource    ${CURDIR}/locators/home_locator.robot
Resource    ${CURDIR}/locators/picktask_locator.robot
Resource    ${CURDIR}/locators/jobslist_locator.robot
Resource    ${CURDIR}/locators/picker/daily_task_locator.robot
Resource    ${CURDIR}/locators/picker/confirm_pick_locator.robot
Resource    ${CURDIR}/locators/picker/pack_item_locator.robot
Resource    ${CURDIR}/locators/picker/confirm_location_locator.robot
Resource    ${CURDIR}/locators/reprint_locator.robot
Resource    ${CURDIR}/locators/customer_info_locator.robot
Resource    ${CURDIR}/locators/manage_routing_locator.robot
Resource    ${CURDIR}/locators/confirm_truck_locator.robot
Resource    ${CURDIR}/locators/driver/receive_order_locator.robot
Resource    ${CURDIR}/locators/picker/scan_confirm_driver_locator.robot
Resource    ${CURDIR}/locators/daily_job_report_locator.robot
Resource    ${CURDIR}/locators/driver/delivery_order_locator.robot
Resource    ${CURDIR}/locators/driver/payment_locator.robot