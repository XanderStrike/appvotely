class AddDefaultToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :default, :boolean
  end
end
