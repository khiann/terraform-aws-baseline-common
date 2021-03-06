variable "okta_provider_arn" {
  description = "The ARN of the Okta provider for the account being provisioned."
}

variable "tags_label_context" {
  type        = map(string)
  default     = {}
  description = "Label/Tag context to use for passing tagging expectations to label invocation"
}

