*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Test Cases ***

TC0001: Valida o status 200 da API
    [Tags]  TC0001  API_activities  EP_get_activities
    [Documentation]
    Dado que consulto a lista de Activities da API
    Então o status code deve ser "200"

TC0002: Retorna status 404 passando url errada
    [Tags]  TC0002  API_activities  EP_get_activities
    [Documentation]
    Dado que consulto a lista de Activities passando a url errada
    Então o status code deve ser "404"

TC0003: Valida Contrato da api com sucesso
    [Tags]  TC0003  API_activities  EP_get_activities
    [Documentation]  
    Dado que consulto a lista de Activities da API
    Então o corpo deve conter o contrato da requisição "schema com sucesso"

TC0004: Consulto um id já cadastrado
    [Tags]  TC0004  API_activities  EP_get_activities
    [Documentation]
    Dado que consulto o id "1" da lista de Activities
    Então deve retornar o id "1" na resposta da requisição

TC0005: Consulto um id que não existe
    [Tags]  TC0005  API_activities  EP_get_activities
    [Documentation]
    Dado que consulto um id que não existe
    Então o status code deve ser "404"

TC0011: Valida Contrato da api com sucesso
    [Tags]  TC0011  API_activities  EP_get_activities
    [Documentation]  
    Dado que consulto a lista de Activities com um id inexistente da API
    Então o corpo deve conter o contrato da requisição "schema sem sucesso"