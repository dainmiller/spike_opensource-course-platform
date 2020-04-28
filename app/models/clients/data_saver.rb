module Clients
  class DataSaver
    def initialize relationship, data_loader, klass
      record ||= klass.table.find_or_create_by(
        title: klass.title,
        url: klass.url
      )

      record.update(
        "#{relationship.class.table_name.downcase.singularize}_id" => relationship.id
      ) if relationship

      data_loader.send("data", [relationship, klass.contents])
    end
  end
end
