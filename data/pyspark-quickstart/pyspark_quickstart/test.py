""" Module used to load TV programs from Oracle and save them to AWS s3 """
from typing import List

import pyspark
import sys
from pyspark_quickstart.initial_conf import InitialConf
from pyspark.sql import SparkSession, DataFrame
from pyspark_quickstart.program import Program
import pandas as pd

import time
from datetime import datetime


def get_period_in_seconds(starting_date, ending_date):
    (datetime.fromtimestamp(ending_date) - datetime.fromtimestamp(starting_date)).total_seconds()


def period_from_iso_date_in_seconds(iso_date1, iso_date2):
    return abs((datetime.strptime(iso_date2, "%Y-%m-%d") \
                - datetime.strptime(iso_date1, "%Y-%m-%d")).total_seconds())


if __name__ == "__main__":
    from datetime import datetime
    import time

    current_timestamp = time.time()
    given_date_timestamp = datetime.timestamp(datetime.strptime("28-10-2020 00:00:00", "%d-%m-%Y %H:%M:%S"))

    get_period_in_seconds(current_timestamp, given_date_timestamp)

    print(period_from_iso_date_in_seconds("2020-11-09", "2020-03-10"))

    import pandas as pd

    data = pd.read_csv("DumpData.csv")
    print(data)


