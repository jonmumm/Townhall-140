require File.dirname(__FILE__) + '/../spec_helper'

describe QuestionsController do
  render_views

  before do
    @question = Factory.create :question
  end

  it "show action should render show template" do
    get :show, :id => Question.first
    response.should render_template(:show)
  end

  it "create action should render new template when model is invalid" do
    Question.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Question.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(question_url(assigns[:question]))
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
end
