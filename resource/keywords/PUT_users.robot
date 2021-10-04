*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***

efetuo um PUT para atualizar uma atividade já cadastrada
    [Documentation]
    ${usuario_cadastrado}  Set Variable  ${response.json()}
    ${primeiro_usuario}  Set Variable  ${usuario_cadastrado[1]}
    &{headers}  Create Dictionary  content-type=application/json; v=1.0
    ${body_string}  Get File  ${ROOT}/resource/data/bodys/post_body.json
    ${body}  Format String    ${body_string}
    ...                         int_id=${primeiro_usuario['id']}
    ...                         str_title="${primeiro_usuario['title']}"
    ...                         str_duedate="${primeiro_usuario['dueDate']}"  
    ...                         bool_completed=true
    ${url_formatada}  Format String  ${URL_API}/${URL_ENDPOINT.activities_id}  id=${primeiro_usuario['id']}
    ${response}  PUT  url=${URL_BASE}/${url_formatada}  headers=${headers}  data=${body}  expected_status=any
    Set Test Variable  ${response}

efetuo um PUT para atualizar uma atividade que não existe
    [Documentation]
    &{headers}  Create Dictionary  content-type=application/json
    &{body}  Create Dictionary
    ...                         id=0
    ...                         title=string
    ...                         dueDate=2021-10-03T03:04:48.076Z
    ...                         completed=true
    ${url_formatada}  Format String  ${URL_API}/${URL_ENDPOINT.activities_id}  id=x
    ${response}  PUT  url=${URL_BASE}/${url_formatada}  headers=${headers}  data=${body}  expected_status=any
    Set Test Variable  ${response}