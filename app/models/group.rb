class Group < ActiveRecord::Base
  attr_accessible :name, :assignment_id
  validates :name, :presence => true
  has_and_belongs_to_many :students
  belongs_to :assignment
end