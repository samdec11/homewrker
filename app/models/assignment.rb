class Assignment < ActiveRecord::Base
  attr_accessible :name, :groupsize
  validates :name, :groupsize, :presence => true
  validates :groupsize, :numericality =>[:greater_than => 0]
  has_and_belongs_to_many :students
  has_many :groups

  before_save :make_groups
  private
  def make_groups
    if Student.all != []
      group_count = Student.count / self.groupsize
      i = 1
      shuffled_class = Student.all.shuffle
      group_count.times do
        pop = shuffled_class.pop(self.groupsize)
        group = Group.create(:name =>"Group #{i}")
        group.students << pop
        self.groups << group
        i = i + 1
      end
      self.groups.last.students << shuffled_class
    end
  end
end