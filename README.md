# docker_registry_simple cookbook

This is a ludicrously simple cookbook to get
[docker-registry](https://github.com/dotcloud/docker-registry) running
on something that looks like ubuntu.

You are on your own for nginx setup and redis (for LRU cache), but
that's ok, you probably have cookbooks for those already.

The steps used here are based on
[Deploying your own Private Docker Registry](http://www.activestate.com/blog/2014/01/deploying-your-own-private-docker-registry).

## Attributes

Attribute | Description | Type | Default
----------|-------------|------|--------
`[:docker_registry_simple][:version]` | Git tag to install | String | `0.6.8`
`[:docker_registry_simple][:user]`    | User to run gunicorn processes | String | `www-data`
`[:docker_registry_simple][:group]`   | User to run gunicorn processes | String | `www-data`
`[:docker_registry_simple][:config]`  | Hash will be emitted as config.yml | Hash | see attributes

## Usage

The hash in `node[:docker-registry-simple][:config]` will be converted
into YAML and written out to the file `config/config.yml`. See
`docker-registry`
[docs](https://github.com/dotcloud/docker-registry#available-configuration-options)
for configuration options.

```json
{
  "docker_registry_simple": {
    "config": {
      "common": {
        "secret_key" => "...",
        "standalone": true
      },
      "dev": {
        "storage": "local",
        "storage_path": "/tmp/registry",
        "loglevel": "debug"
      }
    }
  },

  "run_list": [
    "recipe[docker_registry_simple]"
  ]
}

```
