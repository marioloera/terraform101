resource "local_file" "games" {
    filename = var.filename
    sensitive_content = var.content
    file_permission = "0755"
}

resource "local_file" "games0" {
    content     = "Fifa 2021"
    # filename = "${path.module}/foo.bar"
    filename = "/Users/mario.loera/c/terraform101/artifacts/fav_games0.txt"
}