# Sponsaurus

> Newsletter sponsorship booking manager

## Important Links

- Staging: https://sponsaurus-staging.herokuapp.com
- Production: https://app.sponsaurus.com
- Landing page: https://sponsaurus.com

## Deployment Instructions

1. Create Heroku environment and link git repo/branch
2. Add RAILS_MASTER_KEY environment variable (key is in config/master.key)
3. In the heroku console run `rake db:migrate && rake db:seed`
4. Add oauth redirect url in google cloud console - https://console.cloud.google.com/apis/credentials/oauthclient/1042790392545-hki9hvn286qqgkobm74jofemcd5ft1n3.apps.googleusercontent.com?authuser=2&project=imperial-sphere-315311&folder=&organizationId=
5. Optionally add a cloudflare CNAME record and custom domain
