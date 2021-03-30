package org.review.spark.bootcamp_itab_academy

object FootAnalysis {


  def main(args: Array[String]): Unit = {

    println("Hola mundo!!")

    import org.apache.spark.sql.SparkSession


    val sparkSession = SparkSession
      .builder()
      .master("local")
      .appName("Spark SQL basic example")
      //.config("spark.some.config.option", "some-value")
      .getOrCreate()


    val df = sparkSession.read.option("header", true).csv("foot.csv")

    import sparkSession.implicits._


    val franceDF = df.filter(($"home_team" === "France" && $"home_score" > $"away_score") || ($"away_team" === "France" && "home_score" < "away_score"))

    val franceWinCount = franceDF.count()

    println("Las veces en que la Francia ha ganado " + franceWinCount)


  }

}
