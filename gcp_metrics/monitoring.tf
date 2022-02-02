resource "google_monitoring_alert_policy" "mario_metric_alert" {
  display_name = "Some display name"
  documentation {
    content   = "Some content"
    mime_type = "text/markdown"
  }
  conditions {
    display_name = "Dataflow Job - mario_metric/metric"
    condition_threshold {
      filter     = "resource.type = \"dataflow_job\" AND metric.type = \"logging.googleapis.com/user/mario_metric/metric\""
      comparison = "COMPARISON_GT"
      duration   = "0s"
      trigger {
        count = 1
      }
      threshold_value = 0
    }
  }
  combiner = "OR"
  enabled  = true
  # notification_channels = [data.google_monitoring_notification_channel.basic.name]
}
