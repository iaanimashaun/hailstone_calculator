
variable "lambda_configurations" {
  type = object({
    function_name = string
    timeout       = number
    memory_size   = number
    size          = number
  })
}

variable "enviroment_variables" {
  type = map(string)
  sensitive = true
}











