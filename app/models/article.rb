class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def tag_list=(list)
    tag_names = list.split(',').collect { |t| t.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |t| Tag.find_or_create_by(name: t) }
    self.tags = new_or_found_tags
  end

  def tag_list
    self.tags.collect(&:name).join(', ')
  end
end
