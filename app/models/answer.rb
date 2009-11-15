class Answer
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :relevancy_up, Integer, :default => 0
  property :relevancy_down, Integer, :default => 0

  has n, :relevancies
  belongs_to :question
  belongs_to :user
  timestamps :at

  def relevancy_up_percent 
    total = self.relevancy_up + self.relevancy_down
    total > 0 ? sprintf('%.0f', self.relevancy_up * 100 / total) : 0 
  end 

  def relevancy_down_percent
    total = self.relevancy_up + self.relevancy_down
    total > 0 ? sprintf('%.0f', self.relevancy_down * 100 / total) : 0 
  end 

end
