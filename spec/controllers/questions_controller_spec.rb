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
    expect { post :create, {show_id: 1, body: 'hello'} }.to change(Question, :count).by(1) 
    Question.last.ip.should_not be nil
    Question.last.ip.should match /\d+.\d+.\d+.\d+/
  end

  it "should allow anonymous users to vote up a question and record the remote ip" do
    expect { post :vote_up, id: @question.id }.to change(Vote, :count).by(1)
    Vote.last.ip.should_not be nil
    Vote.last.ip.should match /\d+.\d+.\d+.\d+/
  end

  it "should let logged user create a new question and record the remote ip and user_id" do
    sign_in (@user = Factory.create(:user))
    expect { post :create, {show_id: 1, body: 'hello'} }.to change(Question, :count).by(1) 
    Question.last.ip.should match /\d+.\d+.\d+.\d+/
    Question.last.user.should == @user
  end

  it "should allow logged in user to vote up a question and record the remote ip and user_id" do
    sign_in (@user = Factory.create(:user))
    expect { post :vote_up, id: @question.id }.to change(Vote, :count).by(1)
    Vote.last.ip.should match /\d+.\d+.\d+.\d+/
    Vote.last.user.should == @user
  end

  it "should return a list of questions with vote counts order by votes_count desc" do
    @question.vote_up ip:'0.0.0.1'
    q2 = Factory.create(:question) # will have votes_count of 0
    @question.reload
    get :index, show_id:@question.show_id
    JSON.parse(response.body)[0]["body"].should == @question.body
    JSON.parse(response.body)[0]["votes_count"].should == @question.votes_count
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
