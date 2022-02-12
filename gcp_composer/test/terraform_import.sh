terraform plan -no-color | tee plan-output.txt

terraform workspace new trustly_test
terraform workspace list
terraform workspace select trustly_test
terraform workspace select default

terraform refresh
terraform import google_service_account.svc_composer_worker 111300218573403041422
terraform import google_service_account.svc_github_action_application_deployment 103303564377518452756


# TODO how to import network and subnetwork didn't work
terraform import google_compute_network.composer_network eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoyNDAwMDAwMDAwMDAsImRlbGV0ZSI6MjQwMDAwMDAwMDAwLCJ1cGRhdGUiOjI0MDAwMDAwMDAwMH19

# manually delete the network from the console


gcloud projects get-iam-policy trustly-data-services-test > iam_policy_trustly_test.yaml



# roles/composer.ServiceAgentV2Ext
option
1) add roles/composer.ServiceAgentV2Ext to svc_composer_worker

2) use terraform service account


- members:
  - serviceAccount:service-496466744113@cloudcomposer-accounts.iam.gserviceaccount.com
  role: roles/composer.serviceAgent