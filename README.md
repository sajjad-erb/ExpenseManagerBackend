# README

![Expense Manager Logo](https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.whmcstech.com%2Fwhmcs-tech-expense-manager.html&psig=AOvVaw3ZZOary5zQckYiGlfh7w5a&ust=1672312375689000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCMjTuZuXnPwCFQAAAAAdAAAAABAD)
# Application Name : Expense Manager 


## Ruby version
```ruby
ruby "3.1.2"
```

## Rails version
```ruby
rails "7.0.4"
```

A system that helps individuals or organizations track and manage their expenses. Expense managers can be useful for 
* Personal financial management
* Organizations that need to track and control their expenses. 
* Calculate Group Expenses

## Description
 An expense management system where users can easily maintain and organize their budgets. This app will help them keep track of what they are spending and how much they have saved every month. 
 ### Functionalities
 * `Dashboard` showing user's expenses throughout the month.
 * Keep track of every `transaction` type.
 * `Bank Transfer`, `Income`, `Expenses` are the transactions types
 * User can create `accounts` and `wallets`
 * The app can automatically calculate the share of the `expense` for each user.
 * User can create many `groups` and add users in it.
 * Each user can add their expenses to the group.
 * The app can keep a running total of each user's `balance` within the group.
 * Users can also track any loans or borrowings within the group.
 ### Tabs
 * `Dashboard`
 * `Transactions`
 * `Accounts`
 * `Wallet`
 * `Group Expense`

## How to setup application
 Clone this project using
```ruby
  git clone (repository url)
```
Install Ruby version using Rbenv
```ruby
  rbenv install 3.1.2
```
Use `bundle` which is going to install all gems
```ruby
  bundle 
```
OR
```ruby
  bundle install 
```

Setup the database using
```ruby
  rails db:setup
```

## How to start the server
 Start the rails server using
```ruby
  rails s
```

## Additional Gems Used
```ruby
  gem 'devise_token_auth'

  gem 'rack-cors'

  gem 'kaminari', '~> 0.16.3'

  gem 'will_paginate', '~> 3.3'

  gem 'devise_invitable', '~> 2.0.0'

  gem 'pundit'
```
## Schema design Design
![Scehma-design]([Imgur](https://imgur.com/uxCvz0g))
