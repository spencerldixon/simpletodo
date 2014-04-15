require 'spec_helper'

describe List do
	it "is valid with a name and assosciated user" do
		expect(FactoryGirl.build(:list)).to be_valid
	end

	it "fails validation without a name" do
		expect(FactoryGirl.build(:list, name: nil)).to have(1).errors_on(:name)
	end

	it "fails validation without an assosciated user"
	it "cannot have a name longer than 20 characters"
	it "is assigned to the user who creates it"

	#Move these to the controller?
	context "Creating a list" do
  		it "is created successfully"
  	end

	context "Editing a list" do
		it "is renamed successfully"
	end

	context "Deleting a list" do
		it "destroys the list successfully"
		it "destroys all assosciated tasks successfully"
		it "decreases the users list count by one"
	end
end
