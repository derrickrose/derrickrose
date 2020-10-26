""" Module used to load TV programs from Oracle and save them to AWS s3 """
from typing import List

import pyspark
import sys
from pyspark_quickstart.initial_conf import InitialConf
from pyspark.sql import SparkSession, DataFrame
from pyspark_quickstart.program import Program
import pandas as pd


def main():
    return sys.argv[1:]


def sort(list: List):
    return list.sort


def transform(dfs):
    for df in dfs:
        b = df.drop("id", axis=1)
        yield b


if __name__ == "__main__":
    # TODO for production environment uncomment following line
    # execution_context = InitialConf.from_spark_submit_arguments(main())
    # TODO for production environment delete following line
    execution_context = InitialConf.from_spark_submit_arguments(['', '', '', ''])
    # TODO use values from spark submit
    # sc = pyspark.SparkContext.getOrCreate()
    spark_session = SparkSession.builder \
        .master("local") \
        .appName("program_from_oracle_to_s3").getOrCreate()

    # TODO logical according to execution_type (full/delta loading) """

    # TODO load programs from oracle
    """ in local it will read a directory instead """
    programs_from_oracle = spark_session.read.json("../source/*")

    # TODO read programs saved on AWS s3 """
    """ in local it will read a directory instead"""
    programs_on_s3 = spark_session.read.json("../output/*")

    all_programs = programs_from_oracle.union(programs_on_s3)



    """ todo union AWS s3 programs with loaded programs """
    """ todo filter/sort/deduplicate programs """
    """ todo save programs to AWS s3 """
# programs_from_oracle.coalesce(2).write.mode("overwrite").json("../output/")
