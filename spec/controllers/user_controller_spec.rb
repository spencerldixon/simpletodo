require 'spec_helper'

describe UserController do

  describe "GET 'rake'" do
    it "returns http success" do
      get 'rake'
      response.should be_success
    end
  end

  describe "GET 'routes'" do
    it "returns http success" do
      get 'routes'
      response.should be_success
    end
  end

end
