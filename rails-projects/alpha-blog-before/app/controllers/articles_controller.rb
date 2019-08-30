# frozen_string_literal: true

class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    # To display what passing in while CREATE method
    # In sending throug params hash
    # TO display it - ".inspect"
    # render plain: params[:article].inspect
    @article = Article.new(articles_params)
    @article.save

    # What to do after saving to db?
    redirect_to articles_path(@article)
  end

  private

  def articles_params
    params.require(:article).permit(:title, :description)
  end
end
