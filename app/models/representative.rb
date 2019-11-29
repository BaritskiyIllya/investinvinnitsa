class Representative < ApplicationRecord
  mount_uploader :additional, FilesUploader

  belongs_to :potential_investor
end
