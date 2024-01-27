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
    context 'valid params' do
      it 'updates the username' do
        expect do
          put username_path, params: { user: { username: 'foobar', display_name: 'Foobar' } }
        end.to change { user.reload.username }.to('foobar')
        expect(user.display_name).to eq('Foobar')
        expect(response).to redirect_to dashboard_path
      end
    end

    context 'invalid params' do
      it 'updates the username' do
        expect do
          put username_path, params: { user: { username: '' } }
        end.not_to(change { user.reload.username })
        expect(response).to redirect_to new_username_path
      end
    end
  end
end
