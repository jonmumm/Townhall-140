require 'spec_helper'

describe ShowsController do

  describe "Show action" do

    it "should assign a token" do
      @show = Factory.create(:show)
      get :show, :id => @show.id
      assigns[:token].should_not be_nil
    end

    it "should assign the show" do
      @show = Factory.create(:show)
      get :show, :id => @show.id
      assigns[:show].should == @show
    end

    it "should render show" do
      @show = Factory.create(:show)
      get :show, :id => @show.id
      response.should render_template "show"
    end

    it "should give non-authed users a subscriber role" do
      @show = Factory.create(:show)
      get :show, :id => @show.id
      xml = get_token_info assigns[:token]
      role = xml.root.elements['token/role'].children[0].to_s
      role.strip!
      role.should == OpenTok::RoleConstants::SUBSCRIBER
    end

    it "should give authed, non-admin, non-owner users a publisher role" do
      @show = Factory.create(:show)
      user = Factory.create(:user)
      sign_in user
      get :show, :id => @show.id
      xml = get_token_info assigns[:token]
      role = xml.root.elements['token/role'].children[0].to_s
      role.strip!
      role.should == OpenTok::RoleConstants::PUBLISHER
    end

    it "should give admins a moderator role" do
      @show = Factory.create(:show)
      user = Factory.create(:user, :admin => true)
      sign_in user
      get :show, :id => @show.id
      xml = get_token_info assigns[:token]
      role = xml.root.elements['token/role'].children[0].to_s
      role.strip!
      role.should == OpenTok::RoleConstants::MODERATOR
    end

    it "should give the show owner a moderator role" do
      user = Factory.create(:user)
      sign_in user
      @show = Factory.create(:show, :user => user)
      get :show, :id => @show.id
      xml = get_token_info assigns[:token]
      role = xml.root.elements['token/role'].children[0].to_s
      role.strip!
      role.should == OpenTok::RoleConstants::MODERATOR
    end

    it "should pass in connection data for authed users" do
      user = Factory.create(:user)
      sign_in user
      @show = Factory.create(:show)
      get :show, :id => @show.id
      xml = get_token_info assigns[:token]
      data = xml.root.elements['token/connection_data'].children[0].to_s
      data.should == user.id.to_s
    end
  end

  def get_token_info(token)
    url = URI.parse 'https://api.opentok.com/hl/token/validate'
    http = Net::HTTP.new url.host, url.port
    if url.scheme == 'https'
      http.use_ssl = true
    end
    headers = { 'X-TB-TOKEN-AUTH' => token }    
    res = http.request_post url.path, '', headers
    assert_equal '200', res.code, 'Ruby SDK tests: failed to retrieve token'
    return REXML::Document.new res.read_body
  end

end
