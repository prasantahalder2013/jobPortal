class CreateJobApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :job_applications do |t|
      t.string :name
      t.string :email
      t.references :vacancy
      t.string :admin_action_state, null: false, default: 'created'
      t.string :user_action_state, null: false, default: 'created'
      t.string :date_time
      t.text :note
      t.timestamps
    end
  end
end
