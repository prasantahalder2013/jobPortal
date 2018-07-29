class Vacancy < ApplicationRecord
	belongs_to :organization
	has_many :job_applications

	validates :title, presence: true
	validates :experience, presence: true
	validates :no_of_vacancies, presence: true

	scope :approved, -> { where(is_approved: true) }
end
