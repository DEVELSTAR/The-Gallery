class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

# search feature
  after_commit :create_hash_tags, on: :create

  def create_hash_tags
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end

  def extract_name_hash_tags
    title.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags
# 

end
