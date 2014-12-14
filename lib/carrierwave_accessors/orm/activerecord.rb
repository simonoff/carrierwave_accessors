require "carrierwave/orm/activerecord"

module CarrierWave
  module ActiveRecord
    module Accessable
      ##
      # See +CarrierWave::Mount#mount_uploader+ for documentation
      #
      def mount_uploader(column, uploader=nil, options={}, &block)
        super

        ar_store = self.stored_attributes.find{|store, attributes| attributes.include?(column)}.try(:first)
        if ar_store
          class_eval <<-RUBY, __FILE__, __LINE__+1
            
            def #{column}_will_change!
              #{ar_store}_will_change!
              @#{column}_changed = true
            end
            
            def #{column}_changed?
              @#{column}_changed
            end
        
            def write_uploader(column, identifier)
              ar_store = self.class.stored_attributes.find{|store, attributes| attributes.include?(column)}.try(:first)
              if ar_store
                self.send(ar_store)[column.to_s] = identifier  
              else
                write_attribute(column, identifier)
              end
            end

            def read_uploader(column)
              ar_store = self.class.stored_attributes.find{|store, attributes| attributes.include?(column)}.try(:first)
              if ar_store
                self.send(ar_store)[column.to_s]
              else
                read_attribute(column)
              end
            end  

          RUBY
        end
      end
    end
  end
end
ActiveRecord::Base.extend CarrierWave::ActiveRecord::Accessable