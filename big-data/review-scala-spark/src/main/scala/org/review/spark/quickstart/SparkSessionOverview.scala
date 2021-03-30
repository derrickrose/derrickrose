//package org.review.spark.quicstart
//
//import java.util.Base64.Encoder
//
//import org.apache.spark.sql.SparkSession
//
//object SparkSessionOverview {
//  def main(args: Array[String]): Unit = {
//    //*
//    val sparkSession = SparkSession
//      .builder()
//      .master("local")
//      .appName("SparkSession Overview")
//      .getOrCreate()
//
//    sparkSession.conf.set("spark.sql.session.timeZone", "Europe/Paris")
//    val testFile = sparkSession.read.text("test.txt")
//    val count:Array[String] = testFile
//      .flatMap(x => {
//      val str = x.asInstanceOf[String]
//      str.split(" ")
//    })   .show()
//
//
//    testFile.show()
//    // */
//  }
//}
