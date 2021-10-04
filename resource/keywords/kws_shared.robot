*** Settings ***
Resource  ${ROOT}/resource/main.resource

*** Keywords ***
o status code deve ser "${esperado}"
    [Documentation]  Keyword responsável por validar o status code mediante a exigência do teste.
    Status Should be  ${esperado}

o corpo deve conter o contrato da requisição "${schema}"
    [Documentation]  Keyword responsável por pegar o modelo de schema recebido por parâmetro pelo gherkin e validando com a resposta da api.
    ${arg_schema}   Get Schema Json  ${schema}
    Validate JsonSchema From File   ${response.text}    ${ROOT}/resource/data/schemas/${arg_schema}
