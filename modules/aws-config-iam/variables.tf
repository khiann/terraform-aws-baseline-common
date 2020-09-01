variable "config_logs_bucket" {
  description = "The S3 bucket for AWS Config logs."
  type        = string
}

variable "tags_label_context" {
  type        = map(string)
  default     = {}
  description = "Label/Tag context to use for passing tagging expectations to label invocation"
}

