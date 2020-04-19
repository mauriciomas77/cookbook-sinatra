require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_path = './recipes.csv')
    # TODO
    @recipes = []
    @csv_path = csv_path
    unless csv_path.nil?
      CSV.foreach(csv_path) do |row|
        recipe_done = row[3] == "true"
        @recipes << Recipe.new(row[0], row[1], row[2], recipe_done, row[4])
      end
    end
  end

  def all
    # return all recipies
    return @recipes
  end

  def add_recipe(recipe)
    # TODO
    @recipes << recipe
    save_to_csv
  end

  def new_recipe(name, description, time, done, difficult)
    return Recipe.new(name, description, time, done, difficult)
  end

  def remove_recipe(recipe_index)
    # Remove a recipe from the cookbook
    @recipes.delete_at(recipe_index)
    save_to_csv
  end

  def mark_as_done(index)
    @recipes[index].done = true
    save_to_csv
  end

  private

  def save_to_csv
    unless @csv_path.nil?
      CSV.open(@csv_path, 'wb') do |csv|
        @recipes.each do |recip|
          csv << [recip.name, recip.description, recip.time, recip.done, recip.difficult]
        end
      end
    end
  end
end
