class User < ActiveRecord::Base
  attr_accessible :username, :avatar_url, :name

  validates :username, :uid, :provider, presence: true
  validates :username, :uid, uniqueness: true

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

  def link
    '/signout'
  end

  def has_access?
    true
  end

  def message
    'Sign out'
  end
end
