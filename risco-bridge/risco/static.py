from enum import Enum

"""Risco endpoints"""
RISCO_BASE_URL = "https://homelink.g4s.dk/ELAS/WebUI/"
ENDPOINTS = {
    "AUTH": "",
    "GET_EVENT_HISTORY": "EventHistory/Get",
    "GET_OVERVIEW": "Overview/Get",
    "GET_CP_STATE": "Security/GetCPState",
    "SET_ARM_STATUS": "Security/ArmDisarm"
}


class AlarmCommand(Enum):
    """Enum to model commands issued to change the alarm state"""
    ARM = "armed"
    DISARM = "disarmed"
    PARTARM = "ELArm4"
