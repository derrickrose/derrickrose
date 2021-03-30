//package org.review.spark.batchspark.program
//
//import com.canalplus.common.parameter.ParameterStore.getParameterStore
//import org.apache.log4j.Logger
//import org.apache.spark.sql.{Dataset, SaveMode, SparkSession}
//import org.apache.spark.sql.functions.col
//import org.apache.spark.sql.types.StringType
//import org.review.spark.batchspark.Configuration
//
//object ProgramFromOracleToS3 {
//
//  private val log = Logger.getLogger(this.getClass.getName)
//
//  def main(args: Array[String]): Unit = {
//    val programOutputPath: String = Configuration.getProgramOutputPath(args)
//    val programTemp: String = Configuration.getProgramTemp(args)
//    val executionType: Option[String] = Configuration.getExecutionType(args)
//    val lastExecutionDateTime: Option[String] = Configuration.getLastExecutionDateString(args)
//
////    val sparkSession = SparkSession
////      .builder()
////      .appName(Configuration.ApplicationName)
////      .getOrCreate()
////    sparkSession.conf.set(Configuration.SparkSessionTimeZone, Configuration.Timezone)
//
//    val recentlyQueriedDataFrame = sparkSession.read
//      .format("jdbc")
//      .option("url", Configuration.OracleUrl)
//      .option("user", Configuration.OracleUser)
//      .option("password", getParameterStore(Configuration.OraclePassKey)(Configuration.OraclePassKey))
//      .option("driver", "oracle.jdbc.driver.OracleDriver")
//      .option(Configuration.SparkSessionTimeZone, Configuration.Timezone)
//      .option("oracle.jdbc.timezoneAsRegion", "false")
//      //    https://spark.apache.org/docs/latest/sql-data-sources-jdbc.html
//      .option("dbtable", getQuery(executionType, lastExecutionDateTime))
//      .load()
//
//    val programsDataFrame = if (executionType.get.equals(Configuration.DeltaExecutionType) && lastExecutionDateTime.isDefined) {
//      sparkSession.read.json(path = s"$programOutputPath*").union(recentlyQueriedDataFrame)
//    } else {
//      recentlyQueriedDataFrame
//    }
//
//    import sparkSession.implicits._
//    val programsDataset = programsDataFrame.select(programsDataFrame.columns.map(c => col(c).cast(StringType)): _*)
//      .as[Program]
//    val result = dedupeAndGetRecentlyUpdatedPrograms(sparkSession, programsDataset).coalesce(numPartitions = 20)
//    result.write.mode(SaveMode.Overwrite).json(programTemp)
//    sparkSession.read.json(path = s"$programTemp*").coalesce(numPartitions = 20).write.mode(SaveMode.Overwrite)
//      .json(programOutputPath)
//    Configuration.deleteDirectory(sparkSession, programTemp)
//  }
//
//  private def getQuery(executionType: Option[String], lastExecutionDateTime: Option[String]): String = {
//    val stringBuilder = new StringBuilder()
//    stringBuilder.append("(SELECT ID_BDDPE as id_content,").append(" ID_VIDEO_TF1,")
//      .append(" VOD_PATH as program_description,").append(" CONTENT_NAME,")
//      .append(" CONTENT_DURATION as content_duration_tf1,").append(" LAST_UPDATED as last_update")
//      .append(" FROM V_BI_PRG_MYTF1")
//    if (executionType.get.equals(Configuration.DeltaExecutionType) && lastExecutionDateTime.isDefined) {
//      stringBuilder.append(s" WHERE LAST_UPDATED >= TO_DATE('${lastExecutionDateTime.get}','YYYY-MM-DD HH24:MI:SS')")
//    }
//    stringBuilder.append(")")
//    log.info(s"query => ${stringBuilder}")
//    stringBuilder.toString()
//  }
//
//  def dedupeAndGetRecentlyUpdatedPrograms(sparkSession: SparkSession, programsDataset: Dataset[Program]): Dataset[Program] = {
//    import sparkSession.implicits._
//    programsDataset.groupByKey(_.id_content).flatMapGroups {
//      case (_, duplicatedPrograms) => duplicatedPrograms.toList.sortBy(_.last_update)(Configuration.Desc).headOption
//    }
//  }
//}
//
//
//
