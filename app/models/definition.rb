class Definition < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :user, inverse_of: :definitions

  attr_accessible :executable, :name, :user, :tags_list, :dangerous

  validates :executable, :name, :user, :user_id, presence: true
  validates :name, uniqueness: true

  scope :safe, -> { where(dangerous: false) }
  scope :with_tag, ->(tag){ where(self.has_tag(tag)) }
  default_scope order('dangerous ASC, name ASC')

  def self.has_tag(tag)
    arel = self.arel_table
    any_tags_function = Arel::Nodes::NamedFunction.new('ANY', [arel[:tags]])
    predicate = Arel::Nodes::Equality.new(tag, any_tags_function)
  end

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

  def to_param
    name
  end
end
