terraform plan -no-color | tee plan-output.txt

terraform workspace new trustly_test
terraform workspace list
terraform workspace select trustly_test
terraform workspace select default

terraform refresh
terraform import google_service_account.svc_composer_worker 111300218573403041422
terraform import google_service_account.svc_github_action_application_deployment 103303564377518452756