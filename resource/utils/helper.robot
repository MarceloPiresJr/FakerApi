*** Settings ***
Resource    ${ROOT}/resource/main.resource

*** Keywords ***
Get Schema Json
    [Arguments]        ${text}
    ${file}=           Get File               ${ROOT}/resource/data/schemas/schemas.json
    ${json}=           Evaluate               json.loads($file)                             json
    ${json_schemas}    Get From Dictionary    ${json}                                       ${text}
    [Return]           ${json_schemas}