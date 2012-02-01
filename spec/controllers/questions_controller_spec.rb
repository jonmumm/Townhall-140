require File.dirname(__FILE__) + '/../spec_helper'

describe QuestionsController do

  render_views

  before do
    @question = Factory.create :question
  end

  it "should let anonymous user submit a new question" do
    get :new
    response.should render_template(:new)
  end

  it "should let anonymous user create a new question and record the remote ip" do
    expect { 
      post :create, {show_id: 1, body: 'hello'}
    }.to change(Question, :count).by(1) 
    Question.last.ip.should_not be nil
    Question.last.ip.should match /\d+.\d+.\d+.\d+/
  end

  it "should allow anonymous users to vote up a question" do
  end

  it "create action should redirect when model is valid" do
    pending
    Question.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(question_url(assigns[:question]))
  end

  it "index action should render index template" do
    pending
    get :index
    response.should render_template(:index)
  end
end
