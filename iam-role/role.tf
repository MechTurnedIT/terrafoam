#------- Create IAM policy
resource "aws_iam_policy" "newpolicy" {
  name        = "ec2access-policy"
  description = "Permissions for EC2"
  policy      = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            Action: "ec2:*",
            Effect: "Allow",
            Resource: "*"
        }
      ]
    })
}

#---------- Create IAM role
resource "aws_iam_role" "ec2role" {
  name = "ec2role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "ec2role"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

#----------- Attach IAM policy to IAM role
resource "aws_iam_policy_attachment" "policy_attach" {
  name       = "policy_attach"
  roles      = [aws_iam_role.ec2role.name]
  policy_arn = aws_iam_policy.newpolicy.arn
}

#----------Create instance profile using role
resource "aws_iam_instance_profile" "ec2profile" {
  name = "ec2profile"
  role = aws_iam_role.ec2role.name
}

#----------Create EC2 instance and attache IAM role
resource "aws_instance" "example_instance" {
    ami           = "ami-0a2202cf4c36161a1"
    instance_type = "t2.micro"
    key_name      = "ireland"
    iam_instance_profile = aws_iam_instance_profile.ec2profile.name
}