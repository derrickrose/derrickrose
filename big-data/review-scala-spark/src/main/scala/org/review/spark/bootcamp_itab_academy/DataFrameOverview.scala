package org.review.spark.bootcamp_itab_academy

object DataFrameOverview {

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

    val df = sparkSession.read.json("input-data.json").persist()

    // Displays the content of the DataFrame to stdout
    df.show()

    // Select only the "name" column
    df.select("name").show()

    // Select everybody, but increment the age by 1
    df.show()
    df.select($"name", $"age" + 1).show()

    // Select people older than 21
    df.filter($"age" > 21).show()

    // Count people by age
    df.groupBy("age").count().show()

    //Running SQL Queries Programmatically
    /*Temporary views in Spark SQL are session-scoped
    and will disappear if the session that creates it terminates.*/
    //The sql function on a SparkSession enables applications to run SQL
    //queries programmatically and returns the result as a DataFrame.

    // Register the DataFrame as a SQL temporary view
    df.createOrReplaceTempView("people")

    val sqlDF = sparkSession.sql("SELECT * FROM people")
    sqlDF.show()






  }
}
