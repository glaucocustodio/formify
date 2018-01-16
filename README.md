# Formify [![Build Status](https://travis-ci.org/glaucocustodio/formify.svg?branch=master)](https://travis-ci.org/glaucocustodio/formify)

A small gem that helps you creating form objects on ActiveRecord.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'formify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install formify

## Usage

Given any model of your application:
```ruby
class User < ActiveRecord::Base
end
```

Create a form class through `rails g form user`:
```ruby
class UserForm
  include Formify
end
```

This gem will infer the model of your form by splitting the name, but you can give the name you want to it and tell the model behind it with `main_model`:

```ruby
class ActiveUserForm
  include Formify
  main_model User
end
```

Now you can create a new form for an existing user `UserForm.new(User.find params[:id])` or to a new one `UserForm.new`:
```ruby
class UsersController < ApplicationController
  def new
    @user_form = UserForm.new # same as UserForm.new(User.new)
  end

  def create
    @user_form = UserForm.new(User.new)
    @user_form.params = users_form_params

    if @user_form.save
      redirect_to users_path, notice: 'User created successfully'
    else
      render :new
    end
  end

  def edit
    @user_form = UserForm.new(User.find(params[:id])) # you need to load the record being edited
  end
end
```

By default, `save` method will perform validations before saving, you can disable them by passing `validate: false` as parameter.

Then you can create a form tag using `form_for` in your view:

```erb
<%= form_for @user_form do |f| %>
  <%= f.text_field :name %>
<% end %>
```

## How it works

Formify will create delegators for all attributes of main model and let it ready to use. The handy methods `params=` and `save` are created as well together with some callbacks.

## Callbacks

There are some callbacks you can override to keep your controllers DRY:

* `before_set_params(params)`: runs before `params=` method. Can be used to change params inside the form class, like string formatting.
* `before_save`: runs before save method (except if some validation has failed and `validate == true`).
* `after_save`: runs after save method (except if some validation has failed and `validate == true`). You can enqueue some background job here for instance.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

