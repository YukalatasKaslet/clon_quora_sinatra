get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @questions = Question.all
  erb :index
end
