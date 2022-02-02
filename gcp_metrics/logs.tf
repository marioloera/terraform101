resource "google_logging_metric" "mario_metric" {
  name   = "mario_metric/metric"
  filter = "resource.type=dataflow_step"
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}
