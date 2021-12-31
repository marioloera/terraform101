resource "local_file" "games" {
    filename = "/Users/mario.loera/c/terraform101/TerraformForAbsoluteBeginners/fav_games.txt"
    sensitive_content = "Fifa 2021"
    file_permission = "0755"
}

resource "local_file" "games0" {
    content     = "Fifa 2021"
    # filename = "${path.module}/foo.bar"
    filename = "/Users/mario.loera/c/terraform101/TerraformForAbsoluteBeginners/fav_games0.txt"
}