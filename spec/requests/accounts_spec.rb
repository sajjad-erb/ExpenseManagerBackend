require "rails_helper"
require "devise"

RSpec.describe Api::V1::AccountsController, type: :controller do
  describe "GET #index" do
    let(:user) { FactoryBot.create(:user) }

    it "returns a list of accounts in a JSON response if status is 200 OK" do
      accounts = FactoryBot.create_list(:account, 3, user: user)
      request.headers.merge!(user.create_new_auth_token)
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to match_array(accounts.map { |account| account.as_json })
    end
    it "returns a message in response if status is 401 " do
      accounts = FactoryBot.create_list(:account, 3, user: user)
      request.headers[:access_token] = nil
      get :index
      expect(response).to_not have_http_status(:success)
      expect(JSON.parse(response.body))
    end
    it "user has permission to do GET action " do
      request.headers.merge!(user.create_new_auth_token)
      get :index
      expect(response).to have_http_status(:success)
      expect(user).to be_present
    end
    it "user doesn't has permission to do GET action " do
      request.headers[:access_token] = nil
      get :index
      expect(response).to have_http_status(:unauthorized)
    end
  end
  describe "GET #show" do
    let(:user) { FactoryBot.create(:user) }
    it "returns a single account in a JSON response if status is 200 OK" do
      account = FactoryBot.create(:account, user: user)
      request.headers.merge!(user.create_new_auth_token)
      get :show, params: { id: account.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(account.as_json)
    end
    it "returns a message in response if status is 401" do
      account = FactoryBot.create(:account, user: user)
      request.headers[:access_token] = nil
      get :show, params: { id: account.id }
      expect(response).to_not have_http_status(:success)
      expect(JSON.parse(response.body))
    end
    it "User has permission to do SHOW action " do
      account = FactoryBot.create(:account, user: user)
      request.headers.merge!(user.create_new_auth_token)
      get :show, params: { id: account.id }
      expect(response).to have_http_status(:success)
      expect(user).to be_present
    end
    it "User doesn't has permission to do SHOW action " do
      account = FactoryBot.create(:account, user: user)
      request.headers[:access_token] = nil
      get :show, params: { id: account.id }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "POST #create" do
    let(:user) { FactoryBot.create(:user) }

    context "Create Test Cases" do
      it "creates a new Account with status 202 OK" do
        request.headers.merge!(user.create_new_auth_token)
        expect {
          post :create, params: { account_no: 123, account_title: "My Account", balance: 1000, user_id: user.id }
        }.to change(Account, :count).by(1)
        expect(response).to have_http_status(:created)
      end

      it "doesnt create a new Account with status 401 Unauthorized" do
        expect {
          post :create, params: { account_no: 123, account_title: "My Account", balance: 1000, user_id: user.id }
        }.to change(Account, :count).by(0)
      end

      it "renders a JSON response with the new account" do
        request.headers.merge!(user.create_new_auth_token)
        post :create, params: { account_no: 123, account_title: "My Account", balance: 1000, user_id: user.id }
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)["id"]).to eq(Account.last.id)
      end
    end
  end
  describe "DELETE #destroy" do
    let(:user) { FactoryBot.create(:user) }
    context "Delete Test Cases" do
      it "destroys the account with status 202 OK" do
        request.headers.merge!(user.create_new_auth_token)
        account = FactoryBot.create(:account, user: user)
        expect {
          delete :destroy, params: { id: account.to_param }
        }.to change(Account, :count).by(-1)
      end
      it "doesnt destroy the account with status 401 Unauthorize" do
        request.headers[:access_token] = nil
        account = FactoryBot.create(:account, user: user)
        expect {
          delete :destroy, params: { id: account.to_param }
        }.to change(Account, :count).by(0)
      end
      it "doesnt destroy the account if the account doesn't exist" do
        request.headers.merge!(user.create_new_auth_token)
        account = FactoryBot.create(:account, user: user)
        expect {
          delete :destroy, params: { id: 5434543 }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
  describe "PATCH #update" do
    let(:user) { FactoryBot.create(:user) }
    context "Update Text Cases" do
      it "update the account with status 202 OK" do
        request.headers.merge!(user.create_new_auth_token)
        account = FactoryBot.create(:account, user: user)
        patch :update, params: { id: account.id, account_no: "12345", account_title: "New Title", balance: 100, user_id: user.id }
        account.reload
        expect(response).to have_http_status(200)
      end
      it "doesn't update the account with status 401 Unauthorize" do
        account = FactoryBot.create(:account, user: user)
        patch :update, params: { id: account.id, account_no: "12345", account_title: "New Title", balance: 100, user_id: user.id }
        account.reload
        expect(response).to have_http_status(401)
      end
      it "doesn't update the account if the account doesn't exist" do
        request.headers.merge!(user.create_new_auth_token)
        account = FactoryBot.create(:account, user: user)
        expect { patch :update, params: { id: 12233443, account_no: "12345", account_title: "New Title", balance: 100, user_id: user.id } }.to raise_error(ActiveRecord::RecordNotFound)
        account.reload
      end
    end
  end
end
