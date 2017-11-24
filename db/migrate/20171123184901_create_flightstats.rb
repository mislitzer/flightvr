class CreateFlightstats < ActiveRecord::Migration[5.1]
  def change
    create_table :flightstats do |t|
      t.string :Month
      t.integer :Value

      t.timestamps
    end
  end
end
