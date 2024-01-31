import paramiko

host = '18.204.245.117'
port = 22
username = 'cloud_user'
password = 'jPW^[e7c'


def send_command(command: str) -> None:
    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(host, port, username, password)
        stdin, stdout, stderr = ssh.exec_command(cmd)
        output_lines = stdout.readlines()
        response = ''.join(output_lines)
        print(response)
    finally:
        ssh.close()


if __name__ == '__main__':
    # read file
    # iterate file then send command
    cmd = 'ls -l \n'
    send_command(cmd)
