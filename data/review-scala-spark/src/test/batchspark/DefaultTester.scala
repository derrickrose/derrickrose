//package test
//
//import java.time.LocalDateTime
//
//import com.canalplus.socles.batchspark.session.v2.LogStaging
//import org.apache.spark.sql.{DataFrame, Dataset, SparkSession}
//import org.review.spark.batchspark.Configuration
//import org.scalatest.{BeforeAndAfterAll, FunSuite, Matchers}
//
//object TestConfiguration {
//  val User1Program1IdVisitAt11h = "79a1b1ce-8ef6-4e6f-97d8-edc4d49e9ff7"
//  val User1Program1IdReadingAt11h = 238237577632518812L
//  val User1Program1ContextAt11h = "lecture initiale"
//}
//
//trait DefaultTester extends FunSuite with BeforeAndAfterAll with Matchers {
//  val sparkSession: SparkSession = SparkSession.builder
//    .appName(name = "SparkSession for unit test")
//    .master(master = "local[*]")
//    .getOrCreate()
//
//  val env: Configuration.CollectionEnv = Configuration.TntLocal
//  var localDateTime: LocalDateTime = Configuration.convertToDateTime("2019-10-05 11:00:00")
//  var tf1DataStagingDataset: Dataset[LogStaging] = _
//  var tf1ProgramsDataFrame: DataFrame = _
//  var tf1OutputDataset: Dataset[OutputLog] = _
//}
//
//
//
//
