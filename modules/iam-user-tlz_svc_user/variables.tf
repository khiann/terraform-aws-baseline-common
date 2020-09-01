variable "user_name" {
  description = "Name of the service user to create"
}

variable "tags_label_context" {
  type        = map(string)
  default     = {}
  description = "Label/Tag context to use for passing tagging expectations to label invocation"
}

