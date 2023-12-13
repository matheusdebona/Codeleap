*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}                   gc
${URL}                       http://localhost:3000
${OPTIONS}                   add_experimental_option("detach", True)
${ENTER}                     //button[@class='btn-fill btn-upper'][contains(.,'Enter')]
${FIELD_USERNAME}            //input[@placeholder='John doe']
${FIELD_TITLE}               //input[contains(@name,'title')]
${FIELD_CONTENT}             //textarea[contains(@name,'content')]
${CREATE}                    //button[@class='btn-fill btn-upper'][contains(.,'Create')]
${EDIT_SAVE}                 //button[@class='btn-fill btn-upper'][contains(.,'Save')]
${EDIT_CONTENT}              //textarea[@name='content']

*** Keywords ***
Open browser and maximize window
    Open Browser    url=${URL}    browser=${BROWSER}    options=${OPTIONS}
    Maximize Browser Window

Close browser and quit
    Capture Page Screenshot
    Close Browser

Access the homepage
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${ENTER}
    Capture Page Screenshot

Write the username "${USERNAME}" in the field "Username"
    Wait Until Element Is Visible    locator=${FIELD_USERNAME}
    Input Text    locator=${FIELD_USERNAME}    text=${USERNAME}
    Capture Page Screenshot

Click on the button "Enter"
    Click Element    locator=${ENTER}

Write the title "${TITLE}" in the field "Title"
    Wait Until Element Is Visible    locator=${FIELD_TITLE}
    Input Text    locator=${FIELD_TITLE}    text=${TITLE}

Write the content "${CONTENT}" in the field "Content"
    Wait Until Element Is Visible    locator=${FIELD_CONTENT}
    Input Text    locator=${FIELD_CONTENT}    text=${CONTENT}
    Capture Page Screenshot

Click on the button "Create"
    Click Element    locator=${CREATE}


Verify if the page contains the text "${TEXT}"
    Wait Until Page Contains    text=${TEXT}
    Capture Page Screenshot

Edit post with title "${TITLE}"
    Wait Until Element Is Visible    xpath=//article[@class='postCard'][contains(.,'${TITLE}')]
    Wait Until Element Is Visible    css=svg[aria-label='Edit your post ${TITLE}']
    Click Element    css=svg[aria-label='Edit your post ${TITLE}']
    Wait Until Element Is Visible    locator=//h2[contains(.,'Edit Item')]
    Wait Until Element Is Visible    xpath=//input[contains(@value,'${TITLE}')]
    Capture Page Screenshot

Write new content "${NEW_CONTENT}" in the field "Content" with old content "${OLD_CONTENT}"
    Wait Until Element Is Visible   locator=//form[@class='standard-form'][contains(.,'TitleContent${OLD_CONTENT}Save')]
    Click Element    locator=${EDIT_SAVE}

Delete post with title "${DELETE_TITLE}"
    Wait Until Element Is Visible    css=svg[aria-label='Delete your post ${DELETE_TITLE}']
    Click Element    css=svg[aria-label='Delete your post ${DELETE_TITLE}']
    Alert Should Be Present    text=Are you sure you want to delete this item?    action=accept

Verify if the page dont contains the text "${TEXT}"
    Capture Page Screenshot
    Page Should Not Contain    text=${TEXT}
