class Definition < ActiveRecord::Base

  belongs_to :user, inverse_of: :definitions

  attr_accessible :executable, :name, :user, :tags_list

  validates :executable, :name, :user, :user_id, presence: true
  validates :name, uniqueness: true

  def valid=(value)
    if value
      validation_date = Date.today
    else
      validation_date = nil
    end
  end

  def tags_list
    if tags.present?
      tags.join(', ')
    end
  end

  def tags_list=(value)
    self.tags = value.split(',')
    self.tags.map { |tag| Tag.find_or_create_by_name(tag) }
  end
end
