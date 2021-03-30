package org.review.spark.batchspark.program

object Program {
  val IdContent = "id_content"
  val IdContentPartition = "id_content_partition"
}

case class Program(
                    id_content: String, //ID_BDDPE for oracle tf1 programs view
                    id_video_tf1: String,
                    program_description: String, //VOD_PATH
                    content_name: String,
                    content_duration_tf1: String,
                    last_update: String
                  )
