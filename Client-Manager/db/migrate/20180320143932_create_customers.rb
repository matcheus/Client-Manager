class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :fone
      t.text :description

      t.timestamps
    end
  end
end
