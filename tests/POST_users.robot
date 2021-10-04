*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Test Cases ***

TC0006: Valida o staus code 200 ao criar uma nova atividade
    [Tags]  TC0006  API_activities  EP_post_activities
    [Documentation]
    Dado que preparo o body para requisição
    Quando faço um POST para cadastrar uma nova Activitie
    Então o status code deve ser "200"

TC0007: Valida o status code 422 ao tentar criar uma activitie que já existe
    [Tags]  TC0007  API_activities  EP_post_activities
    [Documentation]
    [Setup]  consulto a lista de Activities da API
    Dado que faço um POST em uma Activitie que já existente
    Então o status code deve ser "422"

TC0008: Valida o status code 400 ao tentar criar uma activitie com dados errados
    [Tags]  TC0008  API_activities  EP_post_activities
    [Documentation]
    Dado que faço um POST com um id errado
    Então o status code deve ser "400"
