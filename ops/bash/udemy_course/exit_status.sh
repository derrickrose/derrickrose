#!/bin/bash

# common exit status in bash

# status 1 general errors
: '
let "var1=1/0"
'

# status 126 command invoked cannot execute
: << END
/dev/null
END

# status 127 command not found
: '
ptk
'

# status 128+n fatal error signal "n"
: << FIN
kill -9 $PPID of script
# 137 (128+9)
FIN

# status 130
: '
#ctrl + c
'
# status 255*
# exit status out of range
:<< END
exit -1
END

# status  2 misuse of shell builtins
: '
#empty_function()
#{ }
'

# status 128 invalid argument to exit
: << END
exit 3.191254
END

# to check the previous exit status echo $?
echo $?

# exut status should be between 1 and 255