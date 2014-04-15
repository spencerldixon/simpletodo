require 'spec_helper'

describe User do
	context "Validation" do
		it "has a valid factory" do
			expect(FactoryGirl.build(:user)).to be_valid
		end

		it "is valid with both a username and password" do
			expect(FactoryGirl.build(:user)).to be_valid #Build method of factory girl keeps it temporarily. .create will write to the db.
		end

		it "fails validation with no email" do
			expect(FactoryGirl.build(:user, email: nil)).to have(1).errors_on(:email)
			expect(FactoryGirl.build(:user, email: "")).to_not be_valid
		end

		it "fails validation with no password" do
			expect(FactoryGirl.build(:user, password: nil)).to have(1).errors_on(:password)
		end

		it "is invalid with a duplicate email" do
			FactoryGirl.create(:user, email: "test@test.com")
			expect(FactoryGirl.build(:user, email: "test@test.com")).to have(1).errors_on(:email)
		end

		it "fails validation with passwords less than 8 characters" do
			expect(FactoryGirl.build(:user, password: "1234567")).to have(1).errors_on(:password)
		end
	end
end
