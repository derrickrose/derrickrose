from pyspark.sql import SparkSession
from pyspark.sql.functions import col, udf, lit
from pyspark.sql.types import StringType, FloatType




def square(height):
    return height * height


def to_meter(height):
    """
    :param height: in centimeter
    :return: height in meter
    """
    return height / 100


def bmi(mass, height):
    """
    :param mass: the person's mass in kg
    :param height: the person's height in cm
    :return: the person's bmi
    """
    return mass / square(to_meter(height))


def get_category(bmi_value: float) -> str:
    category = None
    return "hihi"
    # if bmi_value <= 18.4:
    #     category = "Underweight"
    # elif 18.5 <= bmi_value <= 24.9:
    #     category = "Normal weight"
    # elif 25 <= bmi_value <= 29.9:
    #     category = "Overweight"
    # elif 30 <= bmi_value <= 34.9:
    #     category = "Moderately obese"
    # elif 35 <= bmi_value <= 39.9:
    #     category = "Severely obese"
    # elif bmi_value >= 40:
    #     category = "Very severly obese"
    # return category


category_udf = udf(get_category, FloatType())

from pyspark.sql import functions as F


def get_health_risk(bmivalor):
    bmi_value = float(bmivalor)
    category = None
    if bmi_value <= 18.4:
        category = "Malnutrition risk"
    elif 18.5 <= bmi_value <= 24.9:
        category = "Low risk"
    elif 25 <= bmi_value <= 29.9:
        category = "Enhanced risk"
    elif 30 <= bmi_value <= 34.9:
        category = "Medium risk"
    elif 35 <= bmi_value <= 39.9:
        category = "High risk"
    elif bmi_value >= 40:
        category = "Very high risk"
    return category


if __name__ == '__main__':
    spark_session = SparkSession.builder \
        .master("local") \
        .appName("bmi_calculation").getOrCreate()

    df = spark_session.read \
        .option("mode", "permissive") \
        .json("..\source\data.json") \
        .withColumn("BMI", bmi(col("WeightKg"), col("HeightCm")))
    df.show()

    data = df.withColumn("BMI Category", category_udf(col("BMI")))
    data.show(truncate=False)
