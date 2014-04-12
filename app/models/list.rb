class List < ActiveRecord::Base

  validates_presence_of :title, :subject_a, :subject_b, :adjective, :user
  belongs_to :user

end
