resource "aws_key_pair" "container_key" {
  key_name   = "aws-container-key"
  public_key = file("C:/Users/Parth.Darji/.ssh/aws-container-key.pub")

  tags = {
    Name = "aws-container-key"
  }
}