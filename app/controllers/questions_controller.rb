class QuestionsController < ApplicationController

  def create
    @question = Question.new :show_id => params[:show_id], :body => params[:body]
    if current_user
      @question.user_id = current_user.id
    end
    @question.ip = request.remote_ip
    if @question.save!
      render :json => @question, :status => :created
    else
      render :json => @question.errors, :status => :unprocessable_entity
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


  # Vote is too ancillary to deserve a full controller
  
  def vote
    @question = Question.find params[:id]
    @question.vote_up(request.remote_ip)
    render head: :ok
  end

end
