require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tweets).dependent(:destroy) }
  it { should validate_uniqueness_of(:username).case_insensitive.allow_blank }

  describe '#set_display_name' do
    context 'when display_name is blank' do
      let(:user) { build(:user, username: 'testuser', display_name: nil) }

      it 'sets the display_name to the username' do
        user.save
        expect(user.display_name).to eq('Testuser')
      end
    end

    context 'when display_name is not blank' do
      let(:user) { build(:user, username: 'testuser', display_name: 'Test User') }

      it 'does not change the display_name' do
        user.save
        expect(user.display_name).to eq('Test User')
      end
    end
  end
end
