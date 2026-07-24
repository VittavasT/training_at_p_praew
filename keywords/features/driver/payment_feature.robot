*** Keywords ***
Payment via cash
    payment_page.Click cash image
    payment_page.Verify video is showing
    payment_page.Click capture button
    payment_page.Click save