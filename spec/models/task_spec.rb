require 'spec_helper'

describe Task do
  it "is valid with a name, 'completed' status, and an associated list" do
  	expect(FactoryGirl.build(:task)).to be_valid
  end

  it "fails validation without an associated list" do
  	expect(FactoryGirl.build(:task, list_id: nil)).to have(1).errors_on(:list_id)
  end

  it "fails validation without a name" do
  	expect(FactoryGirl.build(:task, name: nil)).to have(1).errors_on(:name)
  end

  it "fails validation without the 'completed' boolean" do
  	expect(FactoryGirl.build(:task, completed: nil)).to have(1).errors_on(:completed)
  end

  it "fails validation with a duplicate name" do
  	FactoryGirl.create(:task, name: "Example task")
  	expect(FactoryGirl.build(:task, name: "Example task")).to have(1).errors_on(:name)
  end

  it "fails validation with a name longer than 60 characters" do
  	expect(FactoryGirl.build(:task, name: "This is an example of a task name that is way too long to be valid")).to have(1).errors_on(:name)
  end
end
