

# boundary_meter-cookbook
[![Build Status](https://travis-ci.org/nsdavidson/boundary_meter.svg?branch=master)](https://travis-ci.org/nsdavidson/boundary_meter)

A cookbook to install and configure the Boundary meter (http://www.boundary.com)

## Supported Platforms

- RHEL (and variants)
- Ubuntu

## Attributes

| Key | Type | Description | Default |
|-----|------|-------------|---------|
|[:boundary][:api][:hostname] | string | Hostname of the API server | api.boundary.com |
|[:boundary][:api][:org_id] | string | Boundary organization ID | org_id |
|[:boundary][:api][:key] | string | Boundary API key | "api_key" |
|[:boundary][:hostname] | string | Hostname of the node | node[:fqdn] |
|[:boundary][:meter][:bin_path]| string | Path to boundary-meter binary | /usr/bin

## Usage

### boundary_meter::default

Include `boundary_meter` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[boundary_meter::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Nolan Davidson (<nolan.davidson@gmail.com>)
