#!/bin/bash
set timeout 60
ssh -p [lindex $argv 3] [lindex $argv 1]@[lindex $argv 0]
expect "*?assword" {
        send "[lindex $argv 2]\r"
        }
expect ":~$ " {
        send "hostname\r\r"
        }
expect ":~$ " {
        send "df -h | grep sd\r\r"
        }
expect ":~$ " {
        send "tail -2 /var/log/dpkg.log\r\r"
        }
expect ":~$ " {
        send "exit\r"
        }
interact