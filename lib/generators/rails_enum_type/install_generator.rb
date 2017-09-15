module RailsEnumType
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../", __FILE__)

      puts "RailsEnumType::Generators::InstallGenerator"
      desc "Install rails_enum_type"

      def self.next_migration_number(path)
        next_migration_number = current_migration_number(path) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def create_migrations
        puts "Add migrations"
        migration_template "db/migrate/create_rails_enum_type_tables.rb", "db/migrate/create_rails_enum_type_tables.rb"
        migration_template "db/migrate/create_rails_enum_type_foreign_keys.rb", "db/migrate/create_rails_enum_type_foreign_keys.rb"
        migration_template "db/migrate/create_rails_enum_type_view.rb", "db/migrate/create_rails_enum_type_view.rb"
      end

      def copy_models
        template "#{self.class.source_root}/../../models/type.rb", "app/models/type.rb"
        template "#{self.class.source_root}/../../models/type_item.rb", "app/models/type_item.rb"
        template "#{self.class.source_root}/../../models/enum_type.rb", "app/models/enum_type.rb"
        template "#{self.class.source_root}/../../models/enum_item.rb", "app/models/enum_item.rb"
        template "#{self.class.source_root}/../../models/color_type.rb", "app/models/color_type.rb"
      end

    end
  end
end