package org.review.spark.bootcamp_itab_academy

import org.apache.spark.sql.Row
import org.apache.spark.sql.types.{StringType, StructField, StructType}

object DatasetOverview {

  def main(args: Array[String]): Unit = {
    println("Hola mundo!!")

    import org.apache.spark.sql.SparkSession

    val sparkSession = SparkSession
      .builder()
      .master("local")
      .appName("Spark SQL basic example")
      //.config("spark.some.config.option", "some-value")
      .getOrCreate()

    // For implicit conversions like converting RDDs to DataFrames
    import sparkSession.implicits._

    /* DataFrames can be converted to a Dataset by
    providing a class. Mapping will be done by name*/
    val path = "input-data.json"
    val peopleDS = sparkSession.read.json(path).as[Person]
    peopleDS.printSchema()
    peopleDS.show()

    // Create an RDD
    val peopleRDD = sparkSession.sparkContext.textFile("people.txt")

    val peopleDF2 = sparkSession.sparkContext
      .textFile("people.txt")
      .map(_.split(","))
      .map(attributes => People(attributes(0).trim.toInt, attributes(1), attributes(2).trim.toInt))
      .toDF()

    peopleDF2.show()

    //------------------------- quand le schema n'est pas connu d'avance

    // The schema is encoded in a string
    val schemaString = "id name age"

    // Generate the schema based on the string of schema
    val fields = schemaString.split(" ")
      .map(fieldName => StructField(fieldName, StringType, nullable = true))
    val schema = StructType(fields)

    // Convert records of the RDD (people) to Rows
    val rowRDD = peopleRDD
      .map(_.split(","))
      .map(attributes => Row(attributes(0).trim, attributes(1).trim, attributes(2).trim))

    // Apply the schema to the RDD
    val peopleDF = sparkSession.createDataFrame(rowRDD, schema)
    peopleDF.show()


  }

  case class Person(id: String, name: String, age: String)

  case class People(id: Int, name: String, age: Int)

}
