module ElasticMyAnalyzer
  ES_SETTING = {
    index: {
      number_of_shards: 1
    },
    analysis: {
      filter: {
        my_stopwords: {
          type: 'stop',
          stopwords: 'а,без,більш,б,був,була,були,було,можливо,в,вам,вас,весь,під,ось,все,все,всіх,ви,де,так,навіть,для,
                      до,його,її,якщо,є,ще,же,за,тут,і,з,або,їм,їх,до,як,до,коли,хто,чи,або,мені,може,ми,на,треба,наш,
                      ні,нього,неї,немає,ні,них,але,ну,про,про,проте,він,вона,вони,воно,від,дуже,по,під,при,з,з,так,
                      також,такий,там,ті,тим,то,того,теж,тієї,тільки,тому,ти,у,вже,хоча,чого,чий,ніж,що,щоб,чиє,чия,ця,
                      ці,це,я'
        },
        mynGram: {
          type: 'ngram',
          min_gram: 4,
          max_gram: 8
        }
      },
      analyzer: {
        my_analyzer: {
          type: 'custom',
          tokenizer: 'standard',
          filter: %w[lowercase my_stopwords mynGram]
        }
      }
    }
  }
end
