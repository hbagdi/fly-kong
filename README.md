# Deploy Kong to fly.io using Kong Konnect

This guide shows how to use [fly.io](https://fly.io) to deploy Kong data-plane
instances that are managed by Konnect.

## Steps

1. Sign up for [Konnect](https://cloud.konghq.com) and
[fly.io](https://fly.io) if you haven't already.
1. Clone this repository
1. Generate certificate and key for your data-plane nodes. You can do so by
navigating to Konnect's home page -> Runtime Manager -> Default -> New Runtime instance -> Linux tab 
then clicking "Generate Certificate" button.
1. Write these to files with filenames `dp-cert`, `dp-key` file within
this repository.
1. Copy the control-plane endpoints into `fly.toml` file. Usually, the only thing to change should be `33b21e8d4c` part.
1. `flyctl deploy`
1. `flyctl scale vm 512` This is required otherwise Kong will be out of memory.
1. Hit your flyctl endpoint.
