#CREATE
post '/new_answer/:question_id' do
  answer = Answer.create(params[:answer])
  question = Question.find(params[:question_id])
  user = User.find(id: current_user.id )
  if answer && question
    question.answers << answer
    user.answers_written << answer
    redirect to("/question/#{question.id}")
  else
    redirect to('/Error')
  end
end

#READ
get '/answer/:id' do
  @answer = Answer.find(params[:id])
  if @answer != nil
    erb :'answer/answer'
  else
    redirect to('/Error')
  end
end

#UPDATE
get '/answer/:id/edit' do
  @answer = Answer.find(params[:id]) 
  erb :'answer/edit'
end

put '/answer/:id' do
  answer = Answer.find(params[:id])
  if answer != nil
    answer.update(params[:answer])
    redirect to("/answer/#{answer.id}")
  else
    redirect to ('/Error')
  end
end

#DELETE
delete '/answer/:id' do
  answer = Answer.find(params[:id])
  answer.destroy
  redirect to ("/users/#{current_user.id}")
end