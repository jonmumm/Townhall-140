class QuestionsController < ApplicationController

  def create
    @question = Question.new :show_id => params[:show_id], :body => params[:body]
    if current_user
      @question.user_id = current_user.id
    end
    @question.ip = request.remote_ip
    if @question.save
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

    render :json => @questions.order("votes_count desc")
  end


  # Vote is ancillary to question, does not need a full controller
  
  def vote_up
    @question = Question.find params[:id]
    @question.vote_up(ip: request.remote_ip, user_id: (current_user && current_user.id))
    head :ok
  end

end
