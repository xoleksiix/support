from __future__ import annotations

import json
from dataclasses import asdict, dataclass

import requests
from django.http import JsonResponse

FILENAME = "history.json"


def home(request):
    data = {"message": "hello from json response", "num": 12.2}
    return JsonResponse(data)


@dataclass
class ExchangeRate:
    from_: str
    to: str
    value: float

    @classmethod
    def from_response(cls, response: requests.Response) -> ExchangeRate:
        pure_response: dict = response.json()["Realtime Currency Exchange Rate"]
        from_ = pure_response["1. From_Currency Code"]
        to = pure_response["3. To_Currency Code"]
        value = pure_response["5. Exchange Rate"]

        return cls(from_=from_, to=to, value=value)

    def __eq__(self, other: ExchangeRate) -> bool:
        return self.value == other.value


ExchangeRates = list[ExchangeRate]


class ExchangeRatesHistory:
    @staticmethod
    def read_data() -> list:
        try:
            with open(FILENAME, "r") as f:
                return json.loads(f.read())
        except FileNotFoundError:
            return []

    @staticmethod
    def write_data(data: list[dict]) -> None:
        with open(FILENAME, "w") as f:
            f.write(json.dumps(data))

    @classmethod
    def share(cls) -> dict:
        return {"results": cls.read_data()}

    @classmethod
    def add(cls, instance: ExchangeRate) -> None:
        """We woud like to add ExchangeRates instances if it is not last duplicated"""
        history = cls.read_data()

        if not history:
            history.append(asdict(instance))
        elif float(history[-1]["value"]) != instance.value:
            history.append(asdict(instance))
        cls.write_data(history)


def btc_usd(request):
    # NOTE: Connect to the external exchange rates API
    API_KEY = "82I46WMYT3C7EX3J"
    url = (
        "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&"
        f"from_currency=BTC&to_currency=USD&apikey={API_KEY}"
    )
    response = requests.get(url)

    exchange_rate = ExchangeRate.from_response(response)
    ExchangeRatesHistory.add(exchange_rate)

    return JsonResponse(asdict(exchange_rate))


def history(request):
    return JsonResponse(ExchangeRatesHistory.share())
