## Running Examples

```sh
# Make sure `libffi` is installed
sudo apt install libffi-dev -y
gem install glimmer-dsl-libui fiddle
ruby -r glimmer-dsl-libui -e "require 'examples/meta_example'"
```

## New Ruby App

```sh
bundle init
```

Make sure `libffi` is installed. For Ubuntu:

```sh
sudo apt install libffi-dev -y
```

Install the `fiddle` gem:

```sh
bundle add fiddle
```

Install Glimmer for LibUI:

```sh
bundle add glimmer-dsl-libui
```

## Setup Existing App

```sh
bundle
ruby app.rb
```

## Example `.vscode/launch.json` file:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "rdbg",
      "name": "Run Application",
      "request": "launch",
      "script": "${workspaceFolder}/app_v1.rb",
      "args": []
    }
  ]
}
```
