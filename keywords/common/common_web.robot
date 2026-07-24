*** Keywords ***
Open web browser
    [Arguments]    ${url}    ${supported_browser}=${DEFAULT_BROWSER}    ${headless_mode}=${False}
    Browser.New Browser
    ...    browser=${supported_browser}
    ...    headless=${headless_mode}
    ...    args=["--start-maximized"]
    Browser.New Context
    ...    viewport=None
    ...    permissions=["geolocation", "camera"]
    ...    geolocation={'latitude': 13.7563, 'longitude': 100.5018}
    Browser.New Page       url=${url}
    Browser.Wait For Load State

Click element when ready
    [Arguments]    ${locator}    ${timeout}=10s
    Browser.Wait For Elements State    ${locator}    visible    timeout=${timeout}
    Browser.Click     ${locator}

Fill text when element is ready
    [Arguments]    ${locator}    ${text}    ${timeout}=10s
    Browser.Wait For Elements State    ${locator}    visible    timeout=${timeout}
    Browser.Fill text    ${locator}    ${text}

Wait for UI to settle
    [Arguments]    ${duration}=3s
    Sleep    ${duration}

Draw Horizontal Line As Signature
    [Arguments]    ${canvas_locator}
    ${bbox}=    Get Boundingbox    ${canvas_locator}    ALL
    ${start_x}=    Evaluate    ${bbox}[x] + 50
    ${end_x}=    Evaluate    ${bbox}[x] + ${bbox}[width] - 50
    ${center_y}=    Evaluate    ${bbox}[y] + (${bbox}[height] / 2)

    Mouse Move    ${start_x}    ${center_y}
    Mouse Button    down    ${start_x}    ${center_y}
    Mouse Move    ${end_x}    ${center_y}    steps=2
    Mouse Button    up    ${end_x}    ${center_y}

