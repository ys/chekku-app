class Definition < ActiveRecord::Base
  attr_accessible :executable, :name

  validates :executable, :name, presence: true

  def valid=(value)
    if value
      validation_date = Date.today
    else
      validation_date = nil
    end
  end
end
