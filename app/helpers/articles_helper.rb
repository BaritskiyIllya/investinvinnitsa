module ArticlesHelper
  def article_img(article)
    title = article.title
    img = article.image
    unless img.nil?
      content_tag :div, class: 'img-article' do
        image_tag(img.image_url, class: 'img-fluid', alt: title, title: title)
      end
    end
  end
end
