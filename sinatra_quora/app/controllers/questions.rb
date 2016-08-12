#CREATE
post '/new_question/:user_id' do
  p "***" * 50
  p params
  question = Question.create(params[:question])
  p question
  user = User.find(params[:user_id])
  p user
  if user && question
    user.questions << question
    redirect to("/question/#{question.id}")
  else
    p "*Post*" * 50
    redirect to('/Error')
  end
end

#READ
get '/question/:id' do
  @question = Question.find(params[:id])
  if @question != nil
    erb :'question/question'
  else
    p "*Get*" * 50
    redirect to('/Error')
  end
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
  redirect to ("/users/#{question.users.id}")
end