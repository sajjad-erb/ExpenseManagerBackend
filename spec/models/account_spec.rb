require "rails_helper"

RSpec.describe Account, type: :model do
  context "validation tests" do
    it "ensure account_title presence" do
      account = FactoryBot.build(:account_title)
      expect(account).to_not be_valid
    end
    it "ensure account_no presence" do
      account = FactoryBot.build(:account_no)
      expect(account).to_not be_valid
    end
    it "ensure balance presence" do
      account = FactoryBot.build(:balance)
      expect(account).to_not be_valid
    end
  end
  context "Relationship tests" do
    it "should have polymorphic associations with accounts" do
      associations = Transaction.reflect_on_all_associations
      transfer_from_association = associations.find { |a| a.name == :transfer_from }
      transfer_to_association = associations.find { |a| a.name == :transfer_to }
      expect(transfer_from_association.macro).to eq(:belongs_to)
      expect(transfer_from_association).to be_polymorphic
      expect(transfer_to_association.macro).to eq(:belongs_to)
      expect(transfer_to_association).to be_polymorphic
    end
    it "should belong to a user" do
      association = Account.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
    it "should have many accounts" do
      association = User.reflect_on_association(:accounts)
      expect(association.macro).to eq(:has_many)
    end
  
  end
end
