class Interest
  include DataMapper::Resource
  
  property :user_id, Integer, :key => true
  property :question_id, Integer, :key => true
  timestamps :created_at

  belongs_to :question, :child_key => [:question_id]
  belongs_to :user, :child_key => [:user_id]

  # hooks
  before :save, :user_interest

  def user_interest
    self.question.interested_users += 1
    self.question.save!
  end 
end
