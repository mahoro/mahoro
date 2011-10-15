class Slide < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :link]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :image
end
