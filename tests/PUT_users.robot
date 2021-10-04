*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Test Cases ***

TC0009: Valida status code 200 ao atualizar uma activitie
    [Tags]  TC0009  API_activities  EP_put_activities
    [Documentation]
    [Setup]  consulto a lista de Activities da API
    Dado que efetuo um PUT para atualizar uma atividade já cadastrada
    Então o status code deve ser "200"

TC0010: Valida o status code 404 ao tentar atualizar uma activitie que não existe
    [Tags]  TC0010  API_activities  EP_put_activities
    [Documentation]
    Dado que efetuo um PUT para atualizar uma atividade que não existe
    Então o status code deve ser "400"
