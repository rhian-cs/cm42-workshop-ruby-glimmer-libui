## Codeminer42 Ruby Workshop - Making Desktop Apps with Ruby (Glimmer DSL for LibUI)

## Setup

Make sure `libffi` is installed. For Ubuntu:

```sh
sudo apt install libffi-dev -y
```

```sh
bundle install
ruby app.rb
```

## Visual Studio Code Setup

If you're using VS Code, you can use the example `.vscode/launch.json` configuration file below. You can then run your app by pressing F5.

The only dependency is the [VSCode rdbg Ruby Debugger](https://marketplace.visualstudio.com/items?itemName=KoichiSasada.vscode-rdbg) extension.

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

## I just want to run some examples

Make sure `libffi` is installed. For Ubuntu:

```sh
sudo apt install libffi-dev -y
```

Run this:

```sh
gem install glimmer-dsl-libui fiddle
ruby -r glimmer-dsl-libui -e "require 'examples/meta_example'"
```
