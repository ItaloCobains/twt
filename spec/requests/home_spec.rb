require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /' do
    context 'when not signed in' do
      it 'is successful' do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context 'when signed in' do
      it 'is redirects to dashboard' do
        user = create(:user)
        sign_in user
        get root_path
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
