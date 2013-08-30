class Post < ActiveRecord::Base
  # attr_accessible :end, :start, :description, :available, :monthly, :security, :last
  #, :assets, :assets_attributes, :availabilities, :availabilities_attributes

  # has_many :assets,
           # :foreign_key => 'post_id',
           # :class_name => 'Asset'

  has_many :availabilities,
           :foreign_key => 'post_id',
           :class_name => 'Availability'

  # accepts_nested_attributes_for :assets, :availabilities
end
