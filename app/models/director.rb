class Director < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :movies,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
