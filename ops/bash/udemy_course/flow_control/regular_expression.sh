#!/bin/bash

# extended regular expression ERE
# . matches one character
# [] characters set (example coo[kl] will match cook or cool
# \ escape single character, basically special characters
# () pattern grouping
# | alternation example a(b|c) will match abd or acd (grip command)
# *+{} repetition operators (* match zero or more, + match one or more, {0,2} match 0 or 1 or 2 characters
# ^abc leading anchor (example ^hello pattern that text starting with hello)
# abc$ trailing anchor (example world$ pattern that text ending with world)
# [^abc] negate patters ([^123] will match any character except those in the square brackets
# [-] hyppen will match any character within the range
# ? will match 0 ore one character example ab?c will match ac or abc

# basic regular expression BRE
# \. matches one character
# \[\] characters set
# \\ escape single character
# \(\) pattern grouping
# \| alternation

# regex supporting in GNU tools
# grep -G #BRE
# grep -E #ERE
# sed #BRE
# sed -E #ERE
# awk ERE
# [[ =~ ]] ERE


