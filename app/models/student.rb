class Student < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => :true
  has_and_belongs_to_many :assignments
  has_and_belongs_to_many :groups
end