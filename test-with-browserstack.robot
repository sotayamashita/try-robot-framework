*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${RemoteUrl}   http://${Username}:${AccessKey}@hub.browserstack.com/wd/hub

*** Keywords ***
Open LinkedinPage
    [Arguments]   ${SITE_URL}  ${BROWSER}  ${BROWSER_VERSION}  ${OS}  ${OS_VERSION}  ${IS_BROWSERSTACK_LOCAL}
    Open Browser  url=${SITE_URL}   browser=${BROWSER}   remote_url=${RemoteURL}   desired_capabilities=browser:${BROWSER},browser_version:${BROWSER_VERSION},os:${OS},os_version:${OS_VERSION},browserstack.local:${IS_BROWSERSTACK_LOCAL}

Enter Mail Adress
    Input Text   id=login-email  example@example.com

Enter Wrong Password
    Input Text   id=login-password   dummypassword

Click Login
    Click Button   id=login-submit

Assert Warning Message
    [Arguments]  ${EXPECTED_WARNING_MESSAGE}
    Element Text Should Be   id=error-for-username  ${EXPECTED_WARNING_MESSAGE}

*** Test Cases ***
Login Should Failed With Unregistered Mail Adress
    Open LinkedinPage  SITE_URL=https://www.linkedin.com  BROWSER=Chrome  BROWSER_VERSION=69.0  OS=OS X  OS_VERSION=Mojave  IS_BROWSERSTACK_LOCAL=false
    Enter Mail Adress
    Enter Wrong Password
    Click Login
    Assert Warning Message  EXPECTED_WARNING_MESSAGE=Hmm, we don't recognize that email. Please try again.
    [Teardown]    Close Browser
