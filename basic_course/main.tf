resource "local_file" "f1" {
  content  = "hola 1\n"
  filename = "./artifacts/f1.txt"
}

resource "local_file" "games" {
  filename = var.filename
  # sensitive_content = var.content
  sensitive_content = "${var.content}${var.newline}"
  file_permission   = "0755"
}

resource "local_file" "games0" {
  content = "Fifa 2021\n"
  # filename = "${path.module}/foo.bar"
  filename = "./artifacts/fav_games0.txt"
}

resource "local_file" "example_json" {
  filename = "./artifacts/example.json"
  content = jsonencode({
    a = 1
    b = 23.34
    c = "hello"
  })
}
