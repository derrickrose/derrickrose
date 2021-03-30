package org.review.spark.bootcamp_itab_academy

import org.apache.spark.sql.Row
import org.apache.spark.sql.functions.desc
import org.apache.spark.sql.types.{StringType, StructField, StructType}

object Flight {

  def main(args: Array[String]): Unit = {
    println("Hola mundo!!")

    import org.apache.spark.sql.SparkSession

    val sparkSession = SparkSession
      .builder()
      .master("local")
      .appName("Spark SQL basic example")
      //.config("spark.some.config.option", "some-value")
      .getOrCreate()


    val df = sparkSession.read.json("flights20170102.json")
    //df.show()
    // For implicit conversions like converting RDDs to DataFrames
    import sparkSession.implicits._

    df.createOrReplaceTempView("flights")

   // df.groupBy("carrier").agg("depdelay" -> "max", "depdelay" ->"min", "crsdeptime" -> "sum").show()

    //df.groupBy("carrier").count().show()


  //  df.filter($"depdelay" > 40 || $"arrdelay" > 40).groupBy("dest").count().orderBy(desc("count")).show()

   // sparkSession.sql("SELECT * FROM flights LIMIT 10").show()
    import sparkSession._

   val flights = sql("SELECT carrier, MAX(depdelay) as MAX_DEP_TIME, MIN(depdelay) as MIN_DEP_TIME , SUM(crsdeptime) FROM flights group by carrier ")
    flights.show()
  }

}
