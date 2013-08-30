class Availability < ActiveRecord::Base
  belongs_to :post, :class_name => 'Post'

  has_many :timeslots,
           :foreign_key => 'availability_id',
           :class_name => 'Timeslot'
end
