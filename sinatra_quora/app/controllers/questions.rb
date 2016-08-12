#CREATE
post '/new_question/:user_id' do
  question = Question.create(params[:question])
  user = User.find(params[:user_id])
  if user && question
    user.questions << question
    redirect to("/question/#{question.id}")
  else
    redirect to('/Error')
  end
end

#READ
get '/question/:id' do
  @question = Question.find(params[:id])
  if @question != nil
    erb :'question/question'
  else
    redirect to('/Error')
  end
end

get 'question/show_all' do
  @questions = Question.all
  erb :'question/_show_all'
end

#UPDATE
get '/question/:id/edit' do
  @question = Question.find(params[:id]) 
  erb :'question/edit'
end

put '/question/:id' do
  question = Question.find(params[:id])
  if question != nil
    question.update(params[:question])
    redirect to("/question/#{question.id}")
  else
    redirect to ('/Error')
  end
end

#DELETE
delete '/question/:id' do
  question = Question.find(params[:id])
  question.destroy
  redirect to ("/users/#{current_user.id}")
end