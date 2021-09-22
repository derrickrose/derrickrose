"""generator"""


def generator(lower, upper):
    """interact with our generator, the value sent will use the parameter lower"""
    while lower < upper:
        value = (yield lower)
        if (value is not None):
            lower = value
        lower += 1


for num in generator(2, 8):
    print(num)
print("____________________________________")
"""close a generator but only when we assign values to a variable"""
baby = generator(1, 100)
for x in baby:
    print("x {}".format(x))
    if x > 30:
        baby.close()
    if x == 20:
        baby.send(70)

print("____________________________________")


def generando():
    yield 1
    yield 22
    yield 5


it = iter(generando())
for i in it:
    print(i)

it = iter(generando())
print("-------------------")
print(next(it))
