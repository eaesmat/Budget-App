require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'Record model' do
    before(:each) do
      @user = User.create name: 'Mike', email: 'mike@example.com', password: 'password'
    end

    it 'the name must not be blank' do
      record = Record.create name: '', amount: 7.0, user_id: @user
      expect(record).to_not be_valid
    end
  end
end
