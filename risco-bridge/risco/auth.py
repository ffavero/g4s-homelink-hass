class UserAuth:
    """ Models initial authentication. """

    def __init__(self, username: str, password: str, lang='en-gb'):
        self.username = username
        self.password = password
        self.lang = lang

    def to_json(self) -> dict:
        """ Return a dictionary in the format required to authenticate with Risco """
        return {"username": self.username, "password": self.password, "langId": self.lang}


class PinAuth:
    """ Models pin authentication, used during site selection. """

    def __init__(self, pin: int, lang='en-gb'):
        self.pin = pin
        self.lang = lang

    def to_json(self) -> dict:
        """ Return a dictionary in the format required to authenticate with Risco """
        return {"Pin": self.pin, "langId": self.lang}
