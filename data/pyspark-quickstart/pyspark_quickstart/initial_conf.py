""" class used to save initial parameters from spark submit """

class InitialConf():
    def __init__(
            self,
            program_output_path,
            program_temp_path,
            execution_type,
            last_execution_date
    ):
        super(InitialConf, self).__init__()
        self.program_output_path = program_output_path,
        self.program_temp_path = program_temp_path,
        self.execution_type = execution_type,
        self.last_execution_date = last_execution_date

    @staticmethod
    def from_spark_submit_arguments(args):
        assert len(args) == 4, 'error missing arguments'
        return InitialConf(args[0], args[1], args[2], args[3])

    def get_program_output_path(self):
        return self.program_output_path

