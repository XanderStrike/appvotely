class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.string :name
      t.string :options
      t.timestamps
    end
  end
end
