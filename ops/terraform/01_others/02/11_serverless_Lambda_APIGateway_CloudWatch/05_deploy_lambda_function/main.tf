provider "aws" {
  region = "eu-west-1"
  profile = "review"
}

resource "aws_lambda_function" "lambda-hello-world" {
  function_name = "lambda-hello-world"
  handler = "hello_world.handler"
  role = "${aws_iam_role.lambda-hello-world-role.arn}"
  runtime = "python3.7"
  filename = "./hello_world.zip"
}

data "aws_iam_policy_document" "lambda-hello-world-basic-role" {
  statement {
    actions = [
      "sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "lambda-hello-world-role" {
  name = "lambda-hello-world-role"
  assume_role_policy = data.aws_iam_policy_document.lambda-hello-world-basic-role.json
}

resource "aws_iam_policy" "lambda-hello-world-cloudwatch-policy" {
  name = "lambda-hello-world-cloudwatch-policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "lambda-hello-world-cloudwatch-policy-attach" {
  depends_on = [aws_iam_role.lambda-hello-world-role,
    aws_iam_policy.lambda-hello-world-cloudwatch-policy]
  name = "lambda-hello-world-cloudwatch-policy-attach"
  policy_arn = "${aws_iam_policy.lambda-hello-world-cloudwatch-policy.arn}"
  roles = [
    aws_iam_role.lambda-hello-world-role.id]
}