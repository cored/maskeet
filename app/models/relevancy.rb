class Relevancy
  include DataMapper::Resource
  
  property :id, Serial
  property :score, Integer
  belongs_to :answer
  belongs_to :user
  timestamps :created_at

  before :save, :update_relevancy

  def update_relevancy
    answer = self.answer
    if self.score == 1
      answer.relevancy_up += 1
    else
      answer.relevancy_down += 1
    end
    answer.save!
  end 
end
