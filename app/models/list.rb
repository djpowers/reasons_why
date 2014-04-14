class List < ActiveRecord::Base

  before_create :randomize_id

  validates_presence_of :title, :subject_a, :subject_b, :adjective, :user

  belongs_to :user
  has_many :reasons,
    dependent: :destroy


  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while List.where(id: self.id).exists?
  end

end
