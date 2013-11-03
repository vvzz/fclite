class Appointment < ActiveRecord::Base
  belongs_to :post, :class_name => 'Post'
end
