*** Settings ***
# Libraries 
Library  RequestsLibrary
Library  JSONLibrary
Library  String
Library  Collections
Library  OperatingSystem
Library  BuiltIn
Library  JsonValidator
Library  ${ROOT}\resource\utils\config_helper.py

# Keywords
Resource  ${ROOT}/resource/utils/gherkin_ptbr.robot
Resource  ${ROOT}/resource/keywords/kws_shared.robot
Resource  ${ROOT}/resource/utils/helper.robot

# INDEX DE APIS
Resource  ${ROOT}/resource/API/index_api.robot

## EP KEYWORDS
Resource  ${ROOT}/resource/keywords/GET_users.robot
Resource  ${ROOT}/resource/keywords/DELETE_users.robot
Resource  ${ROOT}/resource/keywords/POST_users.robot
Resource  ${ROOT}/resource/keywords/PUT_users.robot