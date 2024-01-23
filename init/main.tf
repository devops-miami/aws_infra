resource "aws_s3_bucket" "example" {
  bucket = "sudoing-remote-state"

  tags = {
    Name        = "terraform"
    Environment = "init"
  }
}

resource "aws_kms_key" "crypt" {
  description             = "SOPs encryption"
  deletion_window_in_days = 10
}