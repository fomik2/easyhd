class AddDivisionAndResponsibleToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :division, :string
    add_column :searches, :responsible, :string
  end
end
