//package program.v2
//
//import com.canalplus.socles.batchspark.program.Program
//import com.review.spark.batchspark.program.Program
//import org.mockito.Mockito
//import org.review.spark.batchspark.program.{Program, ProgramFromOracleToS3}
//
//class ProgramFromOracleToS3Test extends DefaultTester {
//
//  private val OldUpdateDate = "2017-10-24 03:02:04"
//  private val NewUpdateDate = "2020-01-25 19:08:04"
//  private val IdContent = "1111111"
//  test(testName = "----------{ should return the last program }----------") {
//    val oldProgram: Program = Mockito.mock(classOf[Program])
//    Mockito.when(oldProgram.last_update).thenReturn(OldUpdateDate)
//    Mockito.when(oldProgram.id_content).thenReturn(IdContent)
//
//    val newProgram: Program = Mockito.mock(classOf[Program])
//    Mockito.when(newProgram.last_update).thenReturn(NewUpdateDate)
//    Mockito.when(newProgram.id_content).thenReturn(IdContent)
//
//    import sparkSession.implicits._
//    val programs = Seq(oldProgram, newProgram).toDS().as[Program]
//    assert(programs.count() == 2, "programs count should be 2")
//
//    val programDataSet = ProgramFromOracleToS3.dedupeAndGetRecentlyUpdatedPrograms(sparkSession, programs).as[Program]
//    assert(programDataSet.count() == 1, "programDataSet count should be 1")
//    programDataSet.collectAsList().get(0).last_update shouldBe NewUpdateDate
//  }
//}