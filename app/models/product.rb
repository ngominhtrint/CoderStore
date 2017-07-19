class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true
  mount_uploader :image, ImageUploader

  def image_path_or_image
    image_path.presence || image
  end

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end
end
