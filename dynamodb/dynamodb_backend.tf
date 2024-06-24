resource "aws_dynamodb_table" "terraform-statelock" {
  name           = "terraform-statelock"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }


  tags = {
    Name        = "terraform-statelock-table"
    Environment = "dev"
  }
}