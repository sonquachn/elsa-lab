resource "aws_s3_bucket" "s3-bucket" {
  bucket        = var.s3_buckets
  force_destroy = var.bucket_force_destroy
  tags          = var.tags
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = var.versioning
  }
}
# resource "aws_s3_bucket_acl" "acl" {
#   depends_on = [aws_s3_bucket_ownership_controls.s3-bucket]
#   bucket = aws_s3_bucket.s3-bucket.id
#   acl    = var.acl
# }

# # Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
# resource "aws_s3_bucket_ownership_controls" "s3-bucket" {
#   bucket = aws_s3_bucket.s3-bucket.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.s3-bucket.id
  block_public_acls       = var.s3_block_public_acls
  block_public_policy     = var.s3_block_public_policy
  ignore_public_acls      = var.s3_ignore_public_acls
  restrict_public_buckets = var.s3_restrict_public_buckets
}


resource "aws_s3_bucket_accelerate_configuration" "accelerate_configuration" {
  bucket = aws_s3_bucket.s3-bucket.id
  status = var.acceleration_status
}
