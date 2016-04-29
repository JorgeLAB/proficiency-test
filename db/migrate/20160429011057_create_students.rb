class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :register_number, null: false
      t.integer :status, default: 1

      t.timestamps null: false
    end
  end
end
