# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Project name
  Expense manager 

* Description
  -Expense Manager Backend Using Rails API

* How to setup application
  -Create a rails app with *rails new app api*

* How to run server
  -*Rails s*

* How to run Test cases
  -Postman and Thunder Client

* Design decision
  - https://excalidraw.com/#room=ae5591c95c5c615c80b5,rRhdM1eKlKZyzbXsK8s33g

* Migration for many to many relationships 

class CreateUserGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :user_groups do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      t.timestamps
    end
  end
end

class CreatePayers < ActiveRecord::Migration[7.0]
  def change
    create_table :payers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group_expense, index: true
      t.integer :payable
      t.integer :paid
      t.timestamps
    end
  end
end