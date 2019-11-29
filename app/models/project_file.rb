class ProjectFile < ApplicationRecord
  mount_uploader :file, ProjectFilesUploader
  belongs_to :fileable, polymorphic: true

  before_destroy :remove_file

  scope :by_locale, ->(locale) { where(locale: locale) }

  def remove_file
    file.remove! if file.present?
  end
end
