module StateMachines::GisQuestionnaire
  extend ActiveSupport::Concern

  included do
    include AASM

    enum state: {
      draft: 0,
      unverified: 2,
      published: 1,
      archived: 3
    }

    aasm column: :state, enum: true, no_direct_assignment: true, whiny_transitions: false do
      state :draft, initial: true
      state :unverified
      state :published
      state :archived

      after_all_transitions :log_status_change

      event :moderation do
        transitions from: [:draft], to: :unverified
      end

      event :publishing do
        transitions from: %i[draft unverified archived], to: :published
      end

      event :reject do
        transitions from: %i[unverified archived published], to: :draft
      end

      event :archiving do
        transitions from: %i[published unverified], to: :archived
      end
    end

    def log_status_change
      logger.info "Changed from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
    end

    def self.states_with_except(value=[])
      states.map { |k, _v| k unless value.include?(k) }.compact
    end
  end
end
