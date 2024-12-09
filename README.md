# EnvReader

This is a ruby gem to extract all the KEYS of the key value pair in the .env file.

## Installation

Add the gem to your `Gemfile`:

```Gemfile
gem 'env_reader'
```

Run `bundle install`

```bash
bundle install
```

OR

You can directly add it using `bundle add`

```bash
bundle add env_reader
```

## Usage

- ### Use the gem in Rails Console

  ```ruby
  EnvReader.read_keys(Rails.root.join(".env").to_s)
  ```

- ### Use the Gem in a Rake Task

  You can integrate the gem into a custom Rake task for more control.

1. Create a Rake task file in lib/tasks/ (eg: lib/tasks/read_env.rake)

   ```ruby
   namespace :env do
    desc "Read and output keys from .env file"
    task read: :environment do
        EnvReader.read_keys(Rails.root.join(".env").to_s)
    end
   end
   ```

2. Run the Rake task:
   ```bash
   rails env:read
   ```

- ### Use the Gem in a Controller

1.  Add a route in `config/routes.rb`

    ```ruby
    Rails.application.routes.draw do
        get 'env_keys', to: 'home#env_keys'
    end
    ```

2.  Create or update the `home_controller.rb` file in `app/controllers/`

    ```ruby
    class HomeController < ApplicationController
        def env_keys
            EnvReader.read_keys(Rails.root.join(".env").to_s)

            render plain: "Check the Rails console for the .env keys."
        end
    end
    ```

3.  Start your Rails server
    ```bash
    rails server
    ```
4.  Visit `http://localhost:3000/env_keys` in your browser.
    The `.env` file keys will appear in the Rails server logs.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ShirajShrestha/env_reader
