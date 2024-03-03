variable "content__" {
  description = "The content of the file"
  type        = string
  default     = "Hello, World!"
}

# Get the content from an already existing data source 
data "local_file" "example_source" {
  filename = "exemple.txt"
}

# Create a new resource with the content the content
resource "local_file" "example" {
  filename = "example.txt"
  content  = var.content__
}

# Output the id of the resource
output "id" {
  value = resource.local_file.example.id
}
