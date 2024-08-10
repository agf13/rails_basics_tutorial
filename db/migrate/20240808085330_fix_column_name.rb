class FixColumnName < ActiveRecord::Migration[7.1]
	def self.up
		rename_column :articles, :tiltle, :title
	end

	def self.down
		rename_column :articles, :title, :tiltle
	end
end
