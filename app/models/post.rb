class Post < ActiveRecord::Base
  # attr_accessible :end, :start, :description, :available, :monthly, :security, :last
  #, :assets, :assets_attributes, :availabilities, :availabilities_attributes

  # has_many :assets,
           # :foreign_key => 'post_id',
           # :class_name => 'Asset'

  has_many :availabilities,
           :foreign_key => 'post_id',
           :class_name => 'Availability'

  def calculateTimeslots
    availabilities.map do |a|
      slotSize = (a.slotSize).minutes
      slots = []
      iter = a.start
      while iter < a.end
        slots.push({:start => iter, :end => iter + slotSize, :free => true})
        iter += slotSize
      end
      slots
    end.flatten!
  end
  # accepts_nested_attributes_for :assets, :availabilities
end
