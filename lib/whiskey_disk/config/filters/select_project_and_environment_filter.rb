require 'whiskey_disk/config/abstract_filter'

class WhiskeyDisk
  class Config
    class SelectProjectAndEnvironmentFilter < AbstractFilter
      def filter(data)
        unless data and data[project_name] and data[project_name][environment_name]
          raise "No configuration file defined data for project `#{project_name}`, environment `#{environment_name}`"
        end

        data[project_name][environment_name]
      end
    end
  end
end
