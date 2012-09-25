require 'spec_helper'

describe User do
  it 'factory is valid' do
    FactoryGirl.build(:user).should be_valid
  end

  %w{uid username provider}.each do |attribute|
    it "#{attribute} is mandatory" do
      user = FactoryGirl.build(:user)
      user.send("#{attribute}=", nil)
      user.should_not be_valid
    end
  end

  %w{uid username}.each do |attribute|
    it "#{attribute} is unique" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.build(:user)
      user2.send("#{attribute}=", user1.send(attribute))
      user2.should_not be_valid
    end
  end
end
