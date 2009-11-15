class Question
  include DataMapper::Resource
  
  # models fields definitions
  property :id,     Serial
  property :title,  String
  property :body,   Text
  property :stripped_title, String
  property :interested_users, Integer, :default => 0
  timestamps :at

  #model associations
  belongs_to :user, :nullable => true
  has n, :answers
  has n, :interests
  has n, :users, :through => :interests

  # helper methods
  def strip_text(text)
    text.downcase.gsub(/\W/,' ').gsub(/\s+/,'-').gsub(/\-$|^\-/,'')
  end 

  # hooks
  before :save, :save_stripped_title

  def save_stripped_title
    self.stripped_title = strip_text(self.title)
  end 

  def self.homepage_pager(page) 
    self.all(:order => [:interested_users.desc]).page(:page => page, :per_page => 2)
  end

  def self.question_from_title(title)
    self.first(:stripped_title => title)
  end
end
