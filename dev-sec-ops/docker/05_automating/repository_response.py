import json
import sys


def get_repository_uri(file_path):
    with open(file_path, "r") as response_raw_file:
        response_json = json.loads(response_raw_file.read())
        return response_json["repository"]["repositoryUri"]


def write_in_file(filename, file_content):
    with open(f"{filename}".replace("json", "txt"), "w") as repository_uri_file:
        repository_uri_file.write(file_content)


if __name__ == "__main__":
    write_in_file(sys.argv[1], get_repository_uri(sys.argv[1]))
