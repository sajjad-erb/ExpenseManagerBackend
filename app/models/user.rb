# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  after_create :add_wallet

  private

  def add_wallet
    Wallet.create!(user_id: self.id, balance: 0)
  end

  has_many :accounts
  has_one :wallet
  has_many :transactions
end
