class ArticlesController < ApplicationController
    attr_accessor :title, :description
    def show
        @article = Article.find(params[:id])
        @title = @article.title
        @description = @article.description
    end

    def testApi
        render json: { message: "OK", status: 200 }
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article updated sucessfully"
            redirect_to articles_path
        else 
            render 'edit'
        end
        
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    

    def create  
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            # flash.now[:notice] = "Article saved sucessfully" 
            # OR
            redirect_to article_path(@article)  , notice: "Article saved sucessfully"
        else
            render 'new'         
        end
    end
end
