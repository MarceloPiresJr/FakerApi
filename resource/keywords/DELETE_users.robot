*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***

efetuo um DELETE para apagar uma activitie
    [Documentation]
    ${url_formatada}  Format String  ${URL_ENDPOINT.activities_id}  id=1
    ${response}  DELETE  ${URL_BASE}/${URL_API}/${url_formatada}  expected_status=any
    Set Test Variable  ${response}

efetuo um DELETE para em activitie que não existe
    [Documentation]
    ${url_formatada}  Format String  ${URL_ENDPOINT.activities_id}  id=x
    ${response}  DELETE  ${URL_BASE}/${URL_API}/${url_formatada}  expected_status=any
    Set Test Variable  ${response}