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