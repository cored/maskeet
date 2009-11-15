class Question
  include DataMapper::Resource
  
  # models fields definitions
  property :id,     Serial
  property :title,  String
  property :body,   Text
  timestamps :at

  #model associations
  belongs_to :user, :nullable => true
  has n, :answers
  has n, :interests
  has n, :users, :through => :interests
end
