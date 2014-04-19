class Task < ActiveRecord::Base
	belongs_to :list

	validates :name, presence: true, length: { maximum: 60 }, uniqueness: true
	validates :completed, inclusion: { in: [true, false] }
	validates :list_id, presence: true
end
