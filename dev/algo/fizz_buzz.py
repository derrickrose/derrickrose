def fizz_buzz(valor):
    if valor % 3 == 0 and valor % 5 != 0:
        return "fizz"
    elif valor % 3 != 0 and valor % 5 == 0:
        return "buzz"
    elif valor % 3 == 0 and valor % 5 == 0:
        return "fizzbuzz"
    else:
        return str(valor)


def fizz_buzz_2(valor):
    valor_string = ""
    if valor % 3 == 0:
        valor_string += "fizz"
    if valor % 5 == 0:
        valor_string += "buzz"
    if valor % 3 != 0 and valor % 5 != 0:
        valor_string += str(valor)
    return valor_string


def fizz_buzz_3(valor):
    fizz = not valor % 5
    buzz = not valor % 3
    if fizz and buzz:
        return "fizzbuzz"
    if fizz:
        return "fizz"
    if buzz:
        return "buzz"
    else:
        return str(valor)


if __name__ == '__main__':
    print(fizz_buzz(2))
    print(fizz_buzz(45))
    print(fizz_buzz(9))
    print(fizz_buzz(25))

    print(fizz_buzz_2(2))
    print(fizz_buzz_2(45))
    print(fizz_buzz_2(9))
    print(fizz_buzz_2(25))

    print(fizz_buzz_3(2))
    print(fizz_buzz_3(45))
    print(fizz_buzz_3(9))
    print(fizz_buzz_3(25))

# !/bin/python3

from functools import reduce
import json


def reduce_by_key(key, function, array):
    """
    Merge the objects in `array` for each `key` using a custom reducer, `function`.
    The result is similar to a `groupby` operation with a custom aggregation function.

    :param key: the key to group by
    :type key: str
    :param function: operation to perform to merge 2 objects
    :type function: function
    :param array: the input array of objects
    :type array: [ object ]

    :return: the reduced array
    :rtype: [ dict ]
    """

    # your code goes here

    return [{key: "some_value", "agg_key": "reduced_value"}]


if __name__ == '__main__':
    # Reading stdin
    grp_key = input()
    agg_key = input()
    array = json.loads(input())

    # when aggregating dates, we look for the minimum date
    if agg_key == "invoice_date":

        def func(x, y):
            return {agg_key: min(x[agg_key], y[agg_key])}

    # when aggregating amounts or boolean flags, we add them up
    else:

        def func(x, y):
            return {agg_key: x[agg_key] + y[agg_key]}

    # calling `reduce_by_key` and printing sorted results to stdout
    result = reduce_by_key(grp_key, func, array)
    print(json.dumps(sorted(result, key=lambda x: x[grp_key])))
