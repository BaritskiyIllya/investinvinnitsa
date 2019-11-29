module RelationLogging
  extend ActiveSupport::Concern

  included do
    attr_accessor :new_update
    after_commit :after_change
    after_create :new_upd
    after_destroy :new_upd

    def after_change
      require 'area_logger'
      if new_update && relation_able.class != User # Excepted User model from Balancer logger module
        relation_able.was_changed = true
        AreaLogger.call relation_able
      end
    end

    def new_upd
      self.new_update = true
    end
  end
end
