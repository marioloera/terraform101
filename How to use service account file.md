# How to use service account file
1. get the service account file:
```
gcloud auth activate-service-account --key-file=/path/key.json --project=PROJECT_ID
gcloud auth activate-service-account --key-file=/Users/mario.loera/c/keys/terraform_trustly-data-services-prod-15f20b7bd835.json
gcloud auth activate-service-account --key-file=/Users/mario.loera/c/keys/svc-dataflow-worker_trustly-data-services-test.json
```
1. test using the command
```
gcloud auth list
```
1. run a command need
```
gsutil -m mv gs://source gs://dest
```
1. re-activate your personal account
```
gcloud config set account mario.loera@trustly.com
gcloud config set account terraform-admin@trustly-data-services-prod.iam.gserviceaccount.com
gcloud config set account svc-dataflow-worker@trustly-data-services-test.iam.gserviceaccount.com
```
1. remove the service account if need 
```
gcloud auth revoke svc-application-deployment@trustly-data-services-prod.iam.gserviceaccount.com
```
