# Deploy Kong to fly.io with Kong Konnect

This guide shows how to use [fly.io](https://fly.io) to deploy Kong data-plane instances that Konnect manages.

## Steps

### Sign up

Sign up for [Konnect](https://cloud.konghq.com) and [fly.io](https://fly.io) if you haven't already.

Kong Konnect does not require a credit card. 
Fly requires one for verification.

### Setup flyctl

Set up flyctl using instructions from Fly's [documentation](https://fly.io/docs/getting-started/installing-flyctl/).

Once installed, run `flyctl auth login` to set up your installation.

You can verify your installation works by running `flyctl apps list.`

### Credentials for Kong Gateway

Kong Konnect offers a managed control plane for the Kong gateway.
Kong manages and runs the control plane, a database for it, and secures it.
We are going to run Kong Gateways on Fly, and these Gateways will be managed via Kong Konnect.

To set up our Kong Gateway, we will first get credentials for Kong Gateway.
Go to Konnect [home page](https://cloud.konghq.com) and navigate to 

`Runtime Manager -> Default -> New Runtime instance -> Linux tab,` 

then click the "Generate Certificate" button.

In a directory on your workstation, put the certificate into a file named 'dp-cert'
and the key into a file called 'dp-key.'

### Set up Fly app

Now to deploy Kong Gateway, we are going first to create a Fly app:

```bash
fly apps create kong-$USER-42
```

You can substitute $USER with anything you like.
If you get a name conflict, use a different name.
Fly app names are globally unique.

Next, upload the credentials to Fly. To do so, execute:

```bash
cat dp-cert | base64 | flyctl secrets set KONG_DP_CERT=-
cat dp-key  | base64 | flyctl secrets set KONG_DP_KEY=-
```

Next, increase the memory limit for the app:

```bash
flyctl scale memory 512
```

Kong needs a bit more memory than the default limit of 256MB.
We are working on lowering the memory footprint.

Next, copy the `kong-fly.sh`, `Dockerfile` and `fly.toml` files from this repository.
You are welcome to clone the repository if that works better for you.

Next, we must change the control plane endpoints into a `fly.toml` file.
You can find these on the same web page from which you generated the certificate.
Usually, the only thing to change should be `33b21e8d4c` part.

### Run

We are all set. Now execute:

```bash
flyctl deploy
```

This will deploy Kong Gateway, and you should now be able to send requests to it.

To find the hostname, run:

```bash
flyctl info
```
and copy the "Hostname" value.

And now you can send a request to Kong:

```bash
curl http://${HOSTNAME}
```

You should get a response like:

```json
{"message":"no Route matched with those values"}
```

You can now configure Kong plugins to execute various policies at the edge.
You can also scale Kong to any region you need; it will work!

If you have any feedback, do not hesitate to reach out to me via [Twitter](https://twitter.com/hbagdi42).
