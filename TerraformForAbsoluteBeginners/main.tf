resource "local_file" "games" {
    content     = "Fifa 2021"
    # filename = "${path.module}/foo.bar"
    filename = "/Users/mario.loera/c/terraform101/TerraformForAbsoluteBeginners/fav_games.txt"
}