class Post < ActiveRecord::Base
  belongs_to :user

  validates :title,
  presence: :true,
  :length => 6..20

  validates :link,
  presence: :true,
  :url => true


end
