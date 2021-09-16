# Get Layers

Minimal code to get layers.

## Example Usage:
```
go run ./main.go registry-1.docker.io/library/ubuntu:latest
```

The output will be filepaths to layers that were downloaded. By default I download to the temp folder, and the file names
are the digest without an extension. I currently only download layers. But downloading the config is a one more line of code in main.go
```
auto.Fetch(ctx, manifest.Config)

written, err := auto.Fetch(ctx, manifest.Layers)
```

Try it as an exercise.

## Auth

If your docker config is already set up, this will read from that.

If you are not logged in, you can use the `login.sh` script in this repo to login.

You will be asked what registry you would like to log-in to.

Once you've logged in (for example ACR), you can do:

```
go run ./main.go <registry>.azurecr.io/<image>:<locator>
```

# WIP, Current Limitations, TODOs, etc

This is based on code that is currently a WIP so certain things won't work such as:
- v1 repositories
- http://
- So far I've only tested docker hub anonymous and ACR 

Lastly, I have only added support for oauth, but certificates are coming soon.
