class CreateMuseums < ActiveRecord::Migration[7.0]
  def change
    create_table :museums do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
