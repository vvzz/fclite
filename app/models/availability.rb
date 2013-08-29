class Availability < ActiveRecord::Base
  attr_accessible :end, :start, :slotSize

  belongs_to :post, :class_name => 'Post'

  has_many :timeslots,
           :foreign_key => 'availability_id',
           :class_name => 'Timeslot'
end
