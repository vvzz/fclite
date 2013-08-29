class Landlords::Asset < ActiveRecord::Base
  attr_accessible :file

  belongs_to :landlords_campaign, :class_name => 'Landlords::Campaign'
  has_attached_file :file,
                    :styles => {:medium => "480x320>", :thumb => "120x80>"},
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml"

  def image_url
    file.url(:medium)
  end

  def thumb_url
    file.url(:thumb)
  end
end
