require 'whiskey_disk/config/abstract_filter'

class WhiskeyDisk
  class Config
    class CheckForDuplicateDomainsFilter < AbstractFilter
      def check_domains(domain_list)
        seen = {}
        domain_list.each do |domain|
          if seen[domain['name']]
            raise "duplicate domain [#{domain['name']}] in configuration file for project [#{environment_name}], target [#{environment_name}]"
          end

          seen[domain['name']] = true
        end
      end

      def filter(data)
        check_domains(data['domain'])
        data
      end
    end
  end
end
