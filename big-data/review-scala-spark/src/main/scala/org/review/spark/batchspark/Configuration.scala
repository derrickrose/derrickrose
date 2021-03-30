//package org.review.spark.batchspark
//
//import java.net.URI
//import java.time.format.DateTimeFormatter
//import java.time.{LocalDateTime, ZoneId}
//import java.util.{Random, UUID}
//
//import org.apache.hadoop.fs.{FileSystem, Path}
//import org.apache.log4j.Logger
//import org.apache.spark.sql.SparkSession
//
//import scala.util.matching.Regex
//
//object Configuration {
//
//  private val log: Logger = Logger.getLogger(this.getClass.getName)
//  val FullExecutionType = "FULL"
//  val DeltaExecutionType = "DELTA"
//  val Tf1SaltKey = "prd01.dlk.socle.usage.mytf1.hash.key"
//  val ApplicationName = "my-tf1"
//  val UtcZone: ZoneId = ZoneId.of("UTC")
//  val ParisZone: ZoneId = ZoneId.of("Europe/Paris")
//  val DateHourFormatter = "yyyy/MM/dd/HH"
//  val OracleUser = "etl_rpu"
//  val OraclePassKey = "prd01.dlk.rpu_pwd"
//  val OracleUrl = "jdbc:oracle:thin:@frcp00ppd0369.cpprod.root.local:1521/SVC_RPU_ETL"
//  val FourPreviousHoursToCollect: Int = 4
//  val Tf1FilterExpression = " id_epg = '50061' "
//  val Timezone = "Europe/Paris"
//  val SparkSessionTimeZone = "spark.sql.session.timeZone"
//  val SessionAllowedBreak = 7200
//  private val DateTimePatternWithHoursMinutesSecondsString: String = "\\d{4}-\\d{2}-\\d{2}\\s\\d{2}:\\d{2}:\\d{2}"
//  private val SessionUpperBound = 638111881101312000L
//  val LocalDateTimeFormat = "yyyy-MM-dd HH:mm:ss"
//
//  def Asc[T: Ordering]: Ordering[T] = implicitly[Ordering[T]]
//
//  def Desc[T: Ordering]: Ordering[T] = implicitly[Ordering[T]].reverse
//
//  case class CollectionEnv(Input: String,
//                           ProgramOutputPath: String,
//                           ProgramOutputPathTemp: String,
//                           StagingPath: String,
//                           CsvOuput: String,
//                           Tf1Salt: String)
//
//  val TntLocal = CollectionEnv("src/test/resources/socles-input/",
//    "src/test/resources/programs-output/",
//    "src/test/resources/programs-temp/",
//    "src/test/resources/staging/tnt/",
//    "src/test/resources/csv-output/tnt/",
//    "")
//
//  val SatLocal = CollectionEnv("src/test/resources/socles-input/",
//    "src/test/resources/programs-output/",
//    "src/test/resources/programs-temp/",
//    "src/test/resources/staging/sat/",
//    "src/test/resources/csv-output/sat/",
//    "")
//
//  lazy val TntDev = CollectionEnv(
//    "s3://dev01-datalake-ceu-tnt-socle/353-socle-tnt-vod/socles/",
//    "s3://dev01-datalake-socle-usage-mytf1/programs-output/",
//    "s3://dev01-datalake-socle-usage-mytf1/programs-temp/",
//    "s3://dev01-datalake-socle-usage-mytf1/staging/tnt/",
//    "s3://dev01-datalake-socle-usage-mytf1/csv-output/tnt/",
//    getParameterStore(Tf1SaltKey)(Tf1SaltKey)
//  )
//
//  lazy val SatDev = CollectionEnv(
//    "s3://dev01-datalake-ceu-sat-socle/355-socle-sat-vod/socles/",
//    "s3://dev01-datalake-socle-usage-mytf1/programs-output/",
//    "s3://dev01-datalake-socle-usage-mytf1/programs-temp/",
//    "s3://dev01-datalake-socle-usage-mytf1/staging/sat/",
//    "s3://dev01-datalake-socle-usage-mytf1/csv-output/sat/",
//    getParameterStore(Tf1SaltKey)(Tf1SaltKey)
//  )
//
//  lazy val TntProd = CollectionEnv(
//    "s3://prd01-datalake-ceu-tnt-socle/353-socle-tnt-vod/socles/",
//    "s3://prd01-datalake-socle-usage-mytf1/programs-output/",
//    "s3://prd01-datalake-socle-usage-mytf1/programs-temp/",
//    "s3://prd01-datalake-socle-usage-mytf1/staging/tnt/",
//    "s3://prd01-datalake-socle-usage-mytf1/csv-output/tnt/",
//    getParameterStore(Tf1SaltKey)(Tf1SaltKey)
//  )
//
//  lazy val SatProd = CollectionEnv(
//    "s3://prd01-datalake-ceu-sat-socle/355-socle-sat-vod/socles/",
//    "s3://prd01-datalake-socle-usage-mytf1/programs-output/",
//    "s3://prd01-datalake-socle-usage-mytf1/programs-temp/",
//    "s3://prd01-datalake-socle-usage-mytf1/staging/sat/",
//    "s3://prd01-datalake-socle-usage-mytf1/csv-output/sat/",
//    getParameterStore(Tf1SaltKey)(Tf1SaltKey)
//  )
//
//  def getCollectionEnv(args: Array[String]): Configuration.CollectionEnv = {
//    args(0) match {
//      case "TNT_DEV" => Configuration.TntDev
//      case "SAT_DEV" => Configuration.SatDev
//      case "TNT_PROD" => Configuration.TntProd
//      case "SAT_PROD" => Configuration.SatProd
//      case "TNT_LOCAL" => Configuration.TntLocal
//      case "SAT_LOCAL" => Configuration.SatLocal
//      case _ => throw new RuntimeException("Unknown value of argument CollectionEnv")
//    }
//  }
//
//  def getProgramOutputPath(args: Array[String]): String = {
//    args(0) match {
//      case "DEV" => TntDev.ProgramOutputPath
//      case "PROD" => TntProd.ProgramOutputPath
//      case "LOCAL" => TntLocal.ProgramOutputPath
//      case _ => throw new RuntimeException("Unknown value of argument Environment")
//    }
//  }
//
//  def getProgramTemp(args: Array[String]): String = {
//    args(0) match {
//      case "DEV" => TntDev.ProgramOutputPathTemp
//      case "PROD" => TntProd.ProgramOutputPathTemp
//      case "LOCAL" => TntLocal.ProgramOutputPathTemp
//      case _ => throw new RuntimeException("Unknown value of argument Environment")
//    }
//  }
//
//  def getExecutionType(args: Array[String]): Option[String] = {
//    if (!args(1).equals(FullExecutionType) && !args(1).equals(DeltaExecutionType)) {
//      throw new RuntimeException("Unknown required argument ExecutionType")
//    }
//    Some(args(1))
//  }
//
//  def getLastExecutionDateString(args: Array[String]): Option[String] = {
//    //utc time (airflow) is one hour less than Paris time so no need to convert
//    val dateTimePattern: Regex = "\\d{4}-\\d{2}-\\d{2}\\s\\d{2}:\\d{2}:\\d{2}".r
//    val value: Option[String] = dateTimePattern.findFirstIn(cleanStrDateTime(args(2)))
//    value match {
//      case None =>
//        log.error(s"Invalid LastExecutionDateString format ${args(2)}")
//        None
//      case Some(_) => {
//        value
//      }
//    }
//  }
//
//  def buildAbsoluteCurrentTimeInputPath(sessionInputPath: String, currentTime: LocalDateTime): String =
//    sessionInputPath + Configuration.buildSuffixPathFromGivenDateTime(currentTime: LocalDateTime)
//
//  def getEnrichmentStartingDateTimeFromArgument(args: Array[String]): Option[LocalDateTime]
//  = toDateTimeOption(getEnrichmentStartingDateTimeRawFromArgument(args), resetMinute = true, resetSecond = true)
//
//  def getEnrichmentStartingDateTimeRawFromArgument(args: Array[String]): String = {
//    val dateTimePatternWithMinutesSeconds: Regex = DateTimePatternWithHoursMinutesSecondsString.r
//    val startingDateTimeRaw = args(1)
//    try {
//      val value: Option[String] = dateTimePatternWithMinutesSeconds.findFirstIn(startingDateTimeRaw)
//      value match {
//        case None => throw new RuntimeException("Missing or invalid required field starting date")
//        case Some(_) => value.get
//      }
//    } catch {
//      case ex: Exception => throw new RuntimeException(s"Exception : missing or invalid required field starting date ${ex.getMessage}")
//    }
//  }
//
//  def toDateTimeOption(strDate: String, resetMinute: Boolean, resetSecond: Boolean): Option[LocalDateTime] = {
//    val formatter = DateTimeFormatter.ofPattern(LocalDateTimeFormat)
//    val startEnrichmentDateTime: LocalDateTime = {
//      try {
//        LocalDateTime.parse(strDate, formatter)
//      } catch {
//        case ex: Exception => log.error(ex)
//          null
//      }
//    }
//
//    startEnrichmentDateTime match {
//      case null => None
//      case _ =>
//        if (resetMinute && resetSecond) {
//          Some(startEnrichmentDateTime.withMinute(0).withSecond(0))
//        }
//        else if (resetMinute) {
//          Some(startEnrichmentDateTime.withMinute(0))
//        } else if (resetSecond) {
//          Some(startEnrichmentDateTime.withSecond(0))
//        }
//        else {
//          Some(startEnrichmentDateTime)
//        }
//    }
//  }
//
//  def toDateTime(strDate: String, resetMinute: Boolean, resetSecond: Boolean): LocalDateTime = {
//    val formatter = DateTimeFormatter.ofPattern(LocalDateTimeFormat)
//    val startEnrichmentDateTime: LocalDateTime = {
//      try {
//        LocalDateTime.parse(strDate, formatter)
//      } catch {
//        case ex: Exception => log.error(ex)
//          null
//      }
//    }
//
//    startEnrichmentDateTime match {
//      case null => null
//      case _ =>
//        if (resetMinute && resetSecond) {
//          startEnrichmentDateTime.withMinute(0).withSecond(0)
//        }
//        else if (resetMinute) {
//          startEnrichmentDateTime.withMinute(0)
//        }
//        else if (resetSecond) {
//          startEnrichmentDateTime.withSecond(0)
//        }
//        else {
//          startEnrichmentDateTime
//        }
//    }
//  }
//
//
//  def buildAbsoluteStagingOutputPath(absoluteStagingPath: String, currentTime: LocalDateTime): String =
//    absoluteStagingPath + Configuration.buildSuffixPathFromGivenDateTime(currentTime: LocalDateTime)
//
//  def getEndDate(startDateTime: LocalDateTime, session_duration: Option[Long]): LocalDateTime = {
//    if (session_duration.isDefined && session_duration.get.intValue > 0) {
//      startDateTime.plusSeconds(session_duration.get.intValue)
//    } else {
//      startDateTime
//    }
//  }
//
//  def convertToDateTime(dateTimeString: String): LocalDateTime = {
//    try {
//      toDateTime(cleanStrDateTime(dateTimeString), resetMinute = false, resetSecond = false)
//    } catch {
//      case ex: Exception => log.error(ex)
//        null
//    }
//  }
//
//  def cleanStrDateTime(strDateTime: String): String = strDateTime
//    .replace("T", " ")
//    .replaceAll(".\\d+Z", "")
//
//  def getRandomIdVisit(msdAndSessionStartTime: String): String = UUID.nameUUIDFromBytes(msdAndSessionStartTime.getBytes)
//    .toString
//
//  def getRandomIdReading(idSession: Long): Long = {
//    val randomGenerator = new Random(idSession)
//    randomGenerator.longs(1, SessionUpperBound).findFirst.getAsLong
//  }
//
//  def directoryExists(sparkSession: SparkSession, directory: String): Boolean = {
//    val directoryPath = new Path(directory)
//    val fs = FileSystem.get(new URI(directory), sparkSession.sparkContext.hadoopConfiguration)
//    fs.isDirectory(directoryPath)
//  }
//
//  def deleteDirectory(sparkSession: SparkSession, directory: String): Boolean = {
//    if (directoryExists(sparkSession, directory)) {
//      val fs = FileSystem.get(new URI(directory), sparkSession.sparkContext.hadoopConfiguration)
//      fs.delete(new Path(directory), true)
//    } else {
//      false
//    }
//  }
//
//  def buildAbsoluteOutputPath(csvOutputPath: String, localDateTime: LocalDateTime): String = csvOutputPath +
//    Configuration.buildSuffixPathFromGivenDateTime(localDateTime: LocalDateTime)
//
//  def buildSuffixPathFromGivenDateTime(localDateTime: LocalDateTime): String = {
//    val dateHourFormatter: DateTimeFormatter = DateTimeFormatter.ofPattern(Configuration.DateHourFormatter)
//    s"${dateHourFormatter.format(localDateTime)}/"
//  }
//
//  def buildSuffixPathFromNowDateTime(): String = {
//    s"${DateTimeFormatter.ofPattern(Configuration.DateHourFormatter).format(LocalDateTime.now())}/"
//  }
//
//  def getMonthAndYear(localDateTime: LocalDateTime): String = {
//    s"${localDateTime.getMonthValue}${localDateTime.getYear}"
//  }
//
//  def hashMSD(msd: String, monthDisplayName: String, tf1Salt: String): String = HashUtils
//    .sha256HashWithSalt(msd + monthDisplayName, tf1Salt)
//
//  def cleanVideoDuration(videoDuration: String): String = {
//    videoDuration.replaceAll("\\.00+", "")
//  }
//
//  def getMonthYearHashKey(session_start_time_utc: String): String = {
//    getMonthAndYear(convertToDateTime(session_start_time_utc))
//  }
//}
