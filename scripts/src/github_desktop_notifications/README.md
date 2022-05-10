# Github Desktop Notifications

## Design

a small process that runs in the background listening to Github events such as PR comments, 
approvals, review requests

Unless I want to be making a get request every 2 minutes I'm going to have to create a webhook for
github to post updates to, which would require a port be exposed on my computer to requests on the 
internet. Cloudflare tunnel is an option but I don't know if it's worth it

https://ngrok.com/ is an option for exposing a port to the internet 
https://axibase.com/use-cases/integrations/github/push-notification.html another thing for reference

