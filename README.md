# Deploy Kong to fly.io using Kong Konnect

This guide shows how to use [fly.io](https://fly.io) to deploy Kong data-plane
instances that are managed by Konnect.

## Steps

1. Sign up for [Konnect](https://konnect.konghq.com) and
[fly.io](https://fly.io) if you haven't already.
1. Clone this repository
1. Generate certificate and key for your data-plane nodes. You can do so by
navigating to Konnect's home page -> Runtimes -> Configure Runtime -> Linux and
then clicking "Generate Certificate" button.
1. Write these to files with filenames dp-cert, dp-key and ca-cert file within
this repository.
1. Copy the ID of your cpoutlet and replay it in `fly.toml` file. My ID is
`kongincd14ab6`. Do a find all and replace.
1. `flyctl deploy`
1. `flyctl scale vm 512` This is required otherwise Kong wil OOM.
1. Hit your flyctl endpoint.
