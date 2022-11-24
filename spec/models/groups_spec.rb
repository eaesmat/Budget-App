require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Group model' do
    @user = User.create(name: 'Mike', email: 'mike@example.com', password: '123456')
    before { subject.save }

    it 'should check if the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check if the measurement_unit is not blank' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
