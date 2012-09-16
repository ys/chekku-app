class Definition < ActiveRecord::Base

  belongs_to :user, inverse_of: :definitions

  attr_accessible :executable, :name, :user

  validates :executable, :name, :user, :user_id, presence: true

  def valid=(value)
    if value
      validation_date = Date.today
    else
      validation_date = nil
    end
  end
end
