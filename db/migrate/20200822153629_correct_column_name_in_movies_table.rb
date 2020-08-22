class CorrectColumnNameInMoviesTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :total_gros, :total_gross
  end
end
