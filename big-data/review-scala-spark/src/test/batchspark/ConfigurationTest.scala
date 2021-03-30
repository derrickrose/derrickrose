//package test
//
//
//import java.time.LocalDateTime
//
//import org.review.spark.batchspark.Configuration
//import org.scalatest.{BeforeAndAfterAll, FunSuite, Matchers}
//
//class ConfigurationTest extends FunSuite with BeforeAndAfterAll with Matchers {
//
//  val TargetLocalDateTime: LocalDateTime = Configuration.convertToDateTime("2020-01-01 00:00:00")
//
//  test(testName = "----------{ should return month and year }----------") {
//    val monthAndYear: String = Configuration.getMonthAndYear(TargetLocalDateTime)
//    monthAndYear should equal("12020")
//  }
//
//  test(testName = "----------{ after target date should give month and year }----------") {
//    val monthAndYear: String = Configuration.getMonthYearHashKey(session_start_time_utc = "2020-02-02 00:00:00")
//    monthAndYear should equal("22020")
//  }
//
//  test(testName = "----------{ equal target date should give month and year }----------") {
//    val monthAndYear: String = Configuration.getMonthYearHashKey(session_start_time_utc = "2020-02-01 00:00:00")
//    monthAndYear should equal("22020")
//  }
//
//  test(testName = "----------{ before target date should give month }----------") {
//    val month: String = Configuration.getMonthYearHashKey(session_start_time_utc = "2020-01-01 00:00:00")
//    month should equal("12020")
//  }
//}
//
//
