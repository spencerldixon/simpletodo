require 'spec_helper'

describe List do
	it "is valid with a name and assosciated user" do
		expect(FactoryGirl.build(:list)).to be_valid
	end

	it "fails validation without a name" do
		expect(FactoryGirl.build(:list, name: nil)).to have(1).errors_on(:name)
	end

	it "fails validation without an assosciated user" do
		expect(FactoryGirl.build(:list, user_id: nil)).to have(1).errors_on(:user_id)
	end
	it "cannot have a name longer than 25 characters" do
		expect(FactoryGirl.build(:list, name: "This list name has more than twenty five characters")).to have(1).errors_on(:name)
	end

	it "is valid with a name less than 25 characters" do
		expect(FactoryGirl.build(:list, name: "This is valid")).to be_valid
	end

	it "is assigned to the user who creates it"
end
