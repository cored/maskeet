class Questions < Application
  # provides :xml, :yaml, :js

  def index(page = 1)
    @questions = Question.homepage_pager(page)
    
    display @questions
  end

  def show(stripped_title)
    @question = Question.question_from_title(stripped_title)
    raise NotFound unless @question
    display @question
  end

  def new
    only_provides :html
    @question = Question.new
    display @question
  end

end # Questions
