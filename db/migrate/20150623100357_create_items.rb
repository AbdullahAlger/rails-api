class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.boolean :complete, default: false
      t.references :list, index:true

      t.timestamps null: false
    end
  end
end
