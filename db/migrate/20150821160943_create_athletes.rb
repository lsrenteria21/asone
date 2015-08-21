class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :athletename
      t.string :email
      t.timestamps
    end
  end
end
