*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***

consulto a lista de Activities da API
    [Documentation]
    &{headers}  Create Dictionary  content-type=application/json
    ${response}  GET  ${URL_BASE}/${URL_API}/${URL_ENDPOINT.activities}  expected_status=any  headers=&{headers}
    Set Test Variable  ${response}

consulto a lista de Activities passando a url errada
    [Documentation]
    &{headers}  Create Dictionary  content-type=application/json
    ${response}  GET  ${URL_BASE}/${URL_API}/${URL_ENDPOINT.activities}s  expected_status=any  headers=&{headers}
    Set Test Variable  ${response}

consulto o id "${id}" da lista de Activities
    [Documentation]
    &{headers}  Create Dictionary  content-type=application/json
    ${url_formatada}  Format String  ${URL_ENDPOINT.activities_id}  id=${id}
    ${response}  GET  ${URL_BASE}/${URL_API}/${url_formatada}  expected_status=any  headers=&{headers}
    Set Test Variable  ${response}

deve retornar o id "${id}" na resposta da requisição
    [Documentation]
    Should Be Equal  "${response.json()['id']}"  "${id}"

consulto um id que não existe
    [Documentation]
    &{headers}  Create Dictionary  content-type=application/json
    ${url_formatada}  Format String  ${URL_ENDPOINT.activities_id}  id=00000
    ${response}  GET  ${URL_BASE}/${URL_API}/${url_formatada}  expected_status=any  headers=&{headers}
    Set Test Variable  ${response}

consulto a lista de Activities com um id inexistente da API
    [Documentation]
    &{headers}  Create Dictionary  content-type=application/json
    ${url_formatada}  Format String  ${URL_ENDPOINT.activities_id}  id=x
    ${response}  GET  ${URL_BASE}/${URL_API}/${url_formatada}  expected_status=any  headers=&{headers}
    Set Test Variable  ${response}