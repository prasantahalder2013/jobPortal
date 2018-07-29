class Organization < ApplicationRecord
	has_many :org_admins
	has_many :vacancies
	has_many :job_applications, through: :vacancies
end
