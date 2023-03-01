class ArticlesController < ApplicationController

    before_action :take_article, only: [:show, :edit, :update, :destory] # Ovim smo rekli izvrsi metodu take_article pre svega sto se desava, unutar metoda show, edit, update i destroy

    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        # render plain: params[:article] --- KAKO BI PRILIKOM KLIKA DOBILI INFORMACIJU SA PODACIMA U JSON FORMATU
        #MEDJUTIM, MI NE ZELIMO SAMO DA PRIKAZUJEMO PODATKE, VEC I DA IH CUVAMO U BAZI
        @article = Article.new(article_params)
        #render plain: @article.inspect --- AKO ZELIMO DA PRIKAZEMO NA EKRANU
        
        if @article.save #CUVAMO U BAZI
            flash[:notice] = "Article saved successfully."
            redirect_to @article
        else
            render 'new'
        end
       # redirect_to article_path(@article) #REDIREKTOVACE NA "SHOW" STRANU KAKO BI PRIKAZAO DETALJE O NOVOKREIRANOM ARTIKLU
    end

    def update

        if @article.update(article_params) #OVO CE IMATI ISTI EFEKAT KAO "SAVE" GORE, SAMO STO OVDE MENJAMO
            flash[:notice] = "Article was updated successfully." #OVIM SE ISPISUJE PORUKA
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article has been deleted."
        redirect_to articles_path
    end

    private  # private samo ukazuje na to da sve sto je ispod njega vazi samo unutar ovog fajla, nema potrebe za end

    def take_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end


end