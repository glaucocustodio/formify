class User < ActiveRecord::Base
  belongs_to :company

  has_many :issues, as: :owner
end

class Company < ActiveRecord::Base
  has_many :users
end

class Issue < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
end

# migrations
class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.references :company, index: true

      t.timestamps
    end

    create_table :companies do |t|
      t.string :name
      t.string :website

      t.timestamps
    end

    create_table :issues do |t|
      t.string :name
      t.integer :owner_id
      t.string :owner_type
    end
  end
end
ActiveRecord::Migration.verbose = false
CreateAllTables.up
