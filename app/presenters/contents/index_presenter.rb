module Contents
  class IndexPresenter
    def initialize
      @without_desc = Content.eager_load(:translations).without_desc
      @with_desc = Content.eager_load(:translations).with_desc
    end

    def slogan
      @with_desc.detect { |item| item.alias.eql?('slogan') }
    end

    def map
      @with_desc.detect { |item| item.alias.eql?('map') }
    end

    def watch_video
      @without_desc.detect { |item| item.alias.eql?('watch_video') }.try :title
    end

    def why_vin
      @without_desc.detect { |item| item.alias.eql?('why_vin') }.try :title
    end

    def benefit_index
      @without_desc.detect { |item| item.alias.eql?('benefit_index') }.try :title
    end

    def benefit_rating
      @without_desc.detect { |item| item.alias.eql?('benefit_rating') }.try :title
    end

    def benefit_place
      @without_desc.detect { |item| item.alias.eql?('benefit_place') }.try :title
    end

    def benefit_it
      @without_desc.detect { |item| item.alias.eql?('benefit_it') }.try :title
    end
  end
end
