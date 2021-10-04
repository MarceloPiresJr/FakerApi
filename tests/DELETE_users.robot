*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Test Cases ***

TC0012: Valida status code 200 ao apagar uma activitie
    [Tags]  TC0009  API_activities  EP_delete_activities
    [Documentation]
    Dado que efetuo um DELETE para apagar uma activitie
    Então o status code deve ser "200"

TC0013: Valida o status code 404 ao tentar apagar um activitie que não existe
    [Tags]  TC0010  API_activities  EP_delete_activities
    [Documentation]
    Dado que efetuo um DELETE para em activitie que não existe
    Então o status code deve ser "400"