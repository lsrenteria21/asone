class AddAthleteIdToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :athlete_id, :integer
  end
end
