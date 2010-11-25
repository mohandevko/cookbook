class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
    end
  end

  def self.down
    drop_table :recipes
  end
end
