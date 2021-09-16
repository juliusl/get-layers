# Get Layers

Minimal code to get layers.

## Example Usage:
```
go run ./main.go registry-1.docker.io/library/ubuntu:latest
```

If your docker config is already set up, this will read from that.

If you are not logged in, you can use the `login.sh` script in this repo to login.

You will be asked what registry you would like to log into.

Once you log in, you can do: 

```
go run ./main.go <registry>.azurecr.io/<image>:<locator>
```

# WIP, Current Limitations, TODOs, etc

This is based on code that is currently a WIP so certain things won't work such as:
- v1 repositories
- http://

Lastly, I have only added support for oauth, but certificates are coming soon.
