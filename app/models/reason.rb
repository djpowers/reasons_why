class Reason < ActiveRecord::Base

  is_impressionable

  validates_presence_of :body
  belongs_to :list

end
