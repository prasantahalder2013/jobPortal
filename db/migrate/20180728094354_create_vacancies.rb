class CreateVacancies < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancies do |t|
      t.string :title, null: false
      t.text :details
      t.string :experience, null: false
      t.string :required_skills, null: false
      t.integer :no_of_vacancies, null: false
      t.references :organization
      t.boolean :is_approved, default: false, null: false
      t.timestamps
    end
  end
end
