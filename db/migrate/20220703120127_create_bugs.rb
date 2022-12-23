class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title, null: false
      t.text :description
      t.date :deadline
      t.string :type, null: false
      t.string :status, null: false
      t.references :project, foreign_key: true
      t.references :reported_by
      t.references :assigned_to

      t.timestamps
    end
  end
end
