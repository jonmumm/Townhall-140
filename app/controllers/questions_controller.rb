class QuestionsController < ApplicationController
  def create
    if current_user
      @question = Question.new :user_id => current_user.id, :show_id => params[:show_id], :body => params[:body]
      if @question.save
        render :json => @question, :status => :created
      else
        render :json => @question.errors, :status => :unprocessable_entity
      end
    else
      render :json => { :message => "User does not have access to ask a question. Login." }, :status => :unauthorized
    end
  end

  def latest
    @question = Question.where(:show_id => params[:show_id], :user_id => params[:user_id]).order("created_at DESC").first

    render :json => @question 
  end

  def index
    @questions = Question.where(:show_id => params[:show_id])

    render :json => @questions
  end
end
