from datetime import datetime


def check_execution_time(max_execution_time):
    def execution_time_checker(function):
        def function_modifier(integers):  # fonction qui dedoublone
            start_time = datetime.now()
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            print(function(integers))
            execution_time = datetime.now() - start_time
            if execution_time.microseconds >= max_execution_time:
                print("Execution time {} is bigger than maximum allowed {}".format(execution_time.microseconds,
                                                                                   max_execution_time))
            else:
                print("Execution time {} is ok".format(execution_time.microseconds))

        return function_modifier

    return execution_time_checker


@check_execution_time(1)
def dedupe(integers):
    new_integers = []
    for integer in integers:
        if integer not in new_integers:
            new_integers.append(integer)
    return new_integers


if __name__ == "__main__":
    integers = [1, 8, 6, 44, 56, 23, 88, 0, 10, 34, 32, 45, 55, 67, 11, 63, 87, 21, 36, 98, 52, 74, 11]
    dedupe(integers)
