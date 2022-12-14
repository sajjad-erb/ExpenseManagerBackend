# README

![Expense-Manager-Logo](https://www.dovico.com/images/icons/icon-costing.png)
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
 * `Bank Transfer`, `Income`, `Expenses` are the transactions types.
 * User can create `accounts` and `wallets`.
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
rails app:template LOCATION='https://railsbytes.com/script/z0gsLX'
  gem 'pundit'
```
## Design decision
* Technologies: 
  - `Rails` 
  - `React`
  - `Tailwind` 
  - `PostgresQL`
* Models
  - User
  - Account
  - Transaction
  - Wallet
  - Group
  - Group Expense
* Deployment Environment
  -  The system will be depolyed in the cloud
* Maintenance and updates
  - The system will be maintained and updated over time and 
    new features will be added
## Schema design Design
![Scehma-design](https://i.imgur.com/Igw7tS6.png)
## Business Rule
* Expenses will be approved, reimbursed, and tracked, as well as any
  specific policies or procedures that will be enforced by the system