# CarrierwaveAccessors

Carrierwave plugin to mount image uploader to postgresql json & hstore fields.

## Installation

Add this line to your application's Gemfile:

`gem 'carrierwave_accessors'`

And then execute:

`$ bundle`

Or install it yourself as:

`$ gem install carrierwave_accessors`

## Usage
You don't need to add anything special

    class User < ActiveRecord::Base
      store_accessor :data, :cover_image
      store_accessor :settings, :profile_image

      mount_uploader :cover_image, CoverUploader
      mount_uploader :profile_image, ProfileUploader
    end

## Contributing

1. Fork it ( https://bitbucket.org/antonovga/carrierwave_accessors )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
