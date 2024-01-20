require 'rails_helper'

RSpec.describe 'Usernames', type: :request do
  let(:user) { create(:user) }

  before { sign_in user }
  describe 'GET show' do
    it 'is successful' do
      get new_username_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT update' do
    it 'updates the username' do
      expect do
        put username_path, params: { user: { username: 'new_username' } }
      end.to change { user.reload.username }.to('new_username')
      expect(response).to redirect_to dashboard_path
    end
  end
end
