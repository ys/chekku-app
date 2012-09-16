class User < ActiveRecord::Base
  attr_accessible :username, :avatar_url, :name

  has_many :definitions, inverse_of: :user

  def self.create_with_github(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.username = auth['info']['nickname']
      user.avatar_url = auth['info']['image']
    end
  end
end
