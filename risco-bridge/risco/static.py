from enum import Enum

RISCO_BASE_URL = "https://www.riscocloud.com/ELAS/WebUI/"
ENDPOINTS = {
    "AUTH": "",
    "SITE_SELECT": "SiteLogin",
    "GET_EVENT_HISTORY": "EventHistory/Get",
    "GET_OVERVIEW": "Overview/Get",
    "GETCPSTATE": "Security/GetCPState",
    "SETARMSTATUS": "Security/ArmDisarm",
    "CHECK_EXPIRED": "SystemSettings/IsUserCodeExpired"
}


class AlarmCommands(Enum):
    ARM = "armed"
    DISARM = "disarmed"
    PARTARM = "partially"