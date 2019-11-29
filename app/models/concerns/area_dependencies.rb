module AreaDependencies
  extend ActiveSupport::Concern
  included do
    attr_accessor :status, :was_changed, :balancer_ids, :loggined, :was_deleted

    has_many :area_logs, as: :logable

    has_many :questionnaire_images, as: :imgable, dependent: :destroy
    accepts_nested_attributes_for :questionnaire_images,
                                  allow_destroy: true,
                                  reject_if: proc { |att| att['image'].blank? }

    has_one :geo_json, as: :gisable, dependent: :destroy
    accepts_nested_attributes_for :geo_json, allow_destroy: true, reject_if: ->(c) { c[:position].blank? }

    belongs_to :user, optional: true
    belongs_to :map_layer

    validate :validate_balancer, on: :update
    validate :validate_select

    after_destroy :destroy_obj
    after_commit :updated_record

    def updated_record
      require 'area_logger'
      self.was_changed = previous_changes.present? || was_deleted
      AreaLogger.call(self)
    end

    def destroy_obj
      self.was_deleted = true
    end

    def validate_select
      errors.add(:map_layer_id, I18n.t('blank')) unless map_layer_id
    end

    def validate_balancer
      errors.add(:balancer_ids, I18n.t('blank')) if balancer_ids && balancer_ids.reject(&:blank?).blank?
    end
  end
end
