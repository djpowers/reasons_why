class Reason < ActiveRecord::Base

  validates_presence_of :body
  belongs_to :list

end
