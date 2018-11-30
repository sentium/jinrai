require 'jinrai/active_record/finder_methods'

module Jinrai::ActiveRecord
  module Core
    extend ActiveSupport::Concern


    module ClassMethods
      def inherited(kls)
        super
        kls.send(:include, Jinrai::ActiveRecord::FinderMethods) if kls.superclass == ::ActiveRecord::Base
      end
    end

    included do
      descendants.each do |kls|
        kls.send(:include, Jinrai::ActiveRecord::FinderMethods) if kls.superclass == ::ActiveRecord::Base
      end
    end
  end
end
