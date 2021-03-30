package org.review.spark.quickstart

import org.apache.spark.{SparkConf, SparkContext}

object SparkContextOverview {


  def main(args: Array[String]): Unit = {
    val sparkConf = new SparkConf().setAppName("Conteo de palabras").setMaster("local")
    val sc = new SparkContext(sparkConf)
    val df = sc.textFile("test.txt").flatMap(line => line.split(" "))
      .map(word => (word, 1)).reduceByKey(_ + _).collectAsMap()

      .groupBy(_._1).toList
      .sortBy(_._2.head._1)(new Ordering[String]() {
        override def compare(x: String, y: String) = { x.compareTo(y) }
      })
      .map(e => (e._2.head._1 -> e._1)).foreach(println)
      /*



       */

  }


}
