class Attachment < ApplicationRecord
  mount_uploader :file, DriveUploader
  serialize :file, JSON

  belongs_to :user
end
