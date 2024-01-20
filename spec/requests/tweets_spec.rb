require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  describe 'POST create' do
    context 'when not signed in' do
      it 'is responds with redirect' do
        post tweets_path, params: { tweet: { body: 'Hello, world!' } }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when signed in' do
      it 'create a new tweet' do
        user = create(:user)
        sign_in user
        expect do
          post tweets_path, params: { tweet: { body: 'Hello, world!' } }
        end.to change(Tweet, :count).by(1)
        expect(response).to redirect_to dashboard_path
      end
    end
  end
end
