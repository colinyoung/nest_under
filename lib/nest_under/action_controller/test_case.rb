module NestUnder
  module ActionControllerTestCase
    
    # Adds `#nest_under` to all your controller test cases.
    def nest_under resource, user_class = :user
      @nested_resources ||= []
      @nested_resources << resource

      override_request_methods = Module.new do
        [:get, :post, :put, :delete, :patch].each do |verb|
          class_eval <<-METHOD
            def #{verb}(route, params={}, session=nil, other=nil)
              @nested_resources.each do |res|
                params.merge! case res
                when String, Symbol
                  {#{user_class}_id: res}
                else
                  {(res.class.model_name.downcase + "_id").to_sym => res}
                end
                super(route, params, session, other)
              end
            end
          METHOD
        end
      end
      self.send(:extend, override_request_methods)    
    end

    module ClassMethods
      def nest_under resource
        before do
          nest_under instance_variable_get(:"@#{resource}")
        end
      end
    end

    def self.included base
      base.extend ClassMethods
    end

  end
end