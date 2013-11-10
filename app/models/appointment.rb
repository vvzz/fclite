class Appointment < ActiveRecord::Base
  require 'securerandom'
  belongs_to :post, :class_name => 'Post'

  before_create :setupConfirmation

  validates :start, :uniqueness => {
      :scope => :availability_id,
      :message => "This timeslot is already taken"
  }
  validates :email, :format => {
      :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
      :message => "Invalid email address"
  }

  protected
  def setupConfirmation()
    self.confirmed = false
    self.code = SecureRandom.hex(16)
  end
end
