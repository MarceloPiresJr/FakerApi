*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***

preparo o body para requisição
    [Documentation]
    ${body_string}  Get File  ${ROOT}/resource/data/bodys/post_body.json
    ${body_formatado}  Format String  ${body_string}
    ...                            int_id=1
    ...                            str_title="Nova Activity"
    ...                            str_duedate="2021-10-03T23:41:56.3359119+00:00"
    ...                            bool_completed=true
    Set Test Variable  ${body_formatado}

faço um POST para cadastrar uma nova Activitie
    [Documentation]
    &{headers}  Create dictionary  Content-Type=application/Json
    ${response}  POST  url=${URL_BASE}/${URL_API}/${URL_ENDPOINT.activities}  headers=${headers}  data=${body_formatado}  expected_status=any
    Set Test Variable  ${response}

faço um POST em uma Activitie que já existente
    [Documentation]
    ${usuario_cadastrado}  Set Variable  ${response.json()}
    ${primeiro_usuario}  Set Variable  ${usuario_cadastrado[0]}
    ${headers}  Create Dictionary  content-type=application/json
    ${body_string}  Get File  ${ROOT}/resource/data/bodys/post_body.json
    ${body}  Format String    ${body_string}
    ...                       int_id=${primeiro_usuario['id']}
    ...                       str_title="${primeiro_usuario['title']}"
    ...                       str_duedate="${primeiro_usuario['dueDate']}"
    ...                       bool_completed=true
    ${response}  POST  url=${URL_BASE}/${URL_API}/${URL_ENDPOINT.activities}  headers=&{headers}  data=${body}  expected_status=any
    Set Test Variable  ${response}

faço um POST com um id errado
    [Documentation]
    &{headers}  Create Dictionary  content-type=application/json
    &{body_test}  Create Dictionary  
    ...                               id=x
    ...                               title=Male
    ...                               dueDate=juninho_jr@email.com
    ...                               completed=true
    ${response}  POST  url=${URL_BASE}/${URL_API}/${URL_ENDPOINT.activities}  headers=${headers}  data=${body_test}  expected_status=any
    Set Test Variable  ${response}