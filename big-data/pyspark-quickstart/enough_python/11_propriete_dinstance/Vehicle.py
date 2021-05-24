class Vehicle:
    """A class to represent a Vehicle:
    - brand
    - model
    - price
    - year

    """

    def __init__(self, brand, model, year):
        self.brand = brand
        self.model = model
        self.year = year
        self._price: int = None  # le propriété prix est caché

    def _get_price(self):
        return self._price

    def _set_price(self, price):
        self._price = price

    """
    def _set_price(self, price: int):
        self._price = price
    """

    price = property(_get_price, _set_price)


if __name__ == '__main__':
    peugeot_306 = Vehicle("Peugeot", "306", "2012")
    print(
        "The vehicle is {} {} {} {} ".format(peugeot_306.brand, peugeot_306.model, peugeot_306.year,
                                             peugeot_306.price))
    peugeot_306.price = 2000
    print("prix final", peugeot_306.price)

    peugeot_306._price = 2000
    print("prix final", peugeot_306.price)
