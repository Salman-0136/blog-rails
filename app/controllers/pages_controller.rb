class PagesController < ApplicationController
  def home
    # home page
    @articles = Article.order(created_at: :desc).limit(5)
  end
  def about
    # about page
  end
  def contact
    # contact page
  end
end