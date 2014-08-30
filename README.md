# boundary_meter-cookbook

A cookbook to install and configure the Bounday meter (http://www.boundary.com)

## Supported Platforms

- RHEL (and variants)
- Ubuntu

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:boundary][:api][:hostname]</tt></td>
    <td>Hostname</td>
    <td>Hostname of the node being monitored</td>
    <td><tt>node[:fqnd]</tt></td>
  </tr>
</table>

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
