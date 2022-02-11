## Module for Cloud Composer

This module sets up and configures all GCP components that are needed for our environment. What remains is to configure the connections. If this becomes a repetitive task we should look into automating that as well with Vault or the Google Cloud Secret Manager.

We also have to manually update the `bi-gcp-services` repo with links to the new Cloud Composer bucket.

## Add connections and variables

All secrets are stored in [Vault](https://vault.srv.trustly.tech/ui/vault/secrets/org/list/product/bi/). We do not have separate test credentials as we are only reading, not updating, any system.

### CatalystOne

Create connection with Conn Id: `catalyst_one_conn`, Conn Type: `HTTP`, Host: `https://hosted7.catalystone.com/trustly/api/v2`. Add a variable `catalyst_one_secret`:
```
{
    "client_id": "abc123",
    "client_secret": "xyz789"
}
```

### Salesforce

Create a connection with Conn Id: `salesforce_conn`, Conn Type: `HTTP`. No host should be set but add Login `bi.user@trustly.com` and Password (from Vault). Add the security token in the Extra field:
```
 {"security_token": "lOtSOFloWerCASEaNdUPperCaSELetTTErS"}
```
### Slack

Create connection with Conn Id: `slack`, Conn Type: `HTTP`, Host: `https://hooks.slack.com/services`. Login to [Slack](https://trustly.slack.com/services/BJS3KK484) and copy the last part of the Webhook URL, all the characters after "services/" into the Password field.

### NetSuite

Copy paste the Vault entry into a variable called `netsuite_secret`.

### Jira

Copy paste the Vault entry into a variable called `jira_secret`.

## Upgrading the node type
Google recommends an upgrade where the default-node pool on GKE is deleted and replace with a new node pool with different machine types. This works BUT the OAuth scopes (for our purposes https://www.googleapis.com/auth/drive is needed) are not applied to the new machines. We can work around this by providing manually exported keys and defining the OAuth scopes in Airflow's own Connections but it adds one more thing to keep track of.
