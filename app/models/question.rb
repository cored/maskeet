class Question
  include DataMapper::Resource
  
  # models fields definitions
  property :id, Serial
  property :title, String
  property :body, String

  #model associations
  has n, :answer
  belongs_to :user, :nullable => true

  # udpated_at created_at definition (provide by dm_timestamp)
  timestamps :at
end
