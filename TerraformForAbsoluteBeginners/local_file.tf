resource "local_file" "foo" {
    content     = "foo!"
    # filename = "${path.module}/foo.bar"
    filename = "/Users/mario.loera/c/terraform101/TerraformForAbsoluteBeginners/foo.bar"
}