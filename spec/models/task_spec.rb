require 'spec_helper'

describe Task do
  it "has a valid factory" do
  	task = FactoryGirl.create(:task)
  	expect(task).to be_valid
  end
  
  it "is valid with a name, 'completed' status, and an associated user"
  it "fails validation without an associated user"
  it "fails validation without a name"
  it "fails validation without the 'completed' boolean"
  it "fails validation with a duplicate name"
  it "fails validation with a name longer than 100 characters"
end
