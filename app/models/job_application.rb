class JobApplication < ApplicationRecord
	include AASM

	belongs_to :vacancy

	aasm (:admin_action_state) do
    	state :created, :initial => true
    	state :invited

    	event :invite, :after => :notify_candidate do
      		transitions :from => :created, :to => :invited
    	end
	end

  aasm (:user_action_state) do
      state :created, :initial => true
      state :accepted
      state :rejected

      event :accept do
          transitions :from => :created, :to => :accepted
      end

      event :reject do
          transitions :from => :created, :to => :rejected
      end
  end

	validates :name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: { scope: :vacancy_id,
    	message: "You have already applied for this job" }

  def notify_candidate
    UserMailer.invite_candidate(self).deliver
  end
end
