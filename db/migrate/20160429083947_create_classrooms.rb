class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.references :course, index: true, foreign_key: true, null: false
      t.timestamp :entry_at, default: Time.now

      t.timestamps null: false
    end
  end
end
