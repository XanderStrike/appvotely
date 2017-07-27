class CreateSurvey < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.timestamps

      t.string :name
    end
  end
end
