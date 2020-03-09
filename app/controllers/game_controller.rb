class GameController < ApplicationController 


    get '/games' do 
        if logged_in?
            @user = current_user
            @games = @user.games.order(:name)
            erb :'/games/games'
        else 
            flash[:alert] = "You must be logged in to view that page"
            redirect '/login'
        end 
    end

    get '/games/new' do 
        if logged_in?
            @user = current_user
            erb :'/games/new'
        else 
            flash[:alert] = "You must be logged in to view that page"
            redirect '/login'
        end 
    end

    post '/games' do 
        if params[:game][:name].empty?
            flash[:alert] = "Name field cannot be left blank"
            redirect '/games/new'
        end
        find_game = Game.find_by(:name => params[:game][:name])
        if find_game
            find_game.users << current_user
        else
            game = Game.new(params[:game])
            game.users << current_user
            game.save
        end 
        flash[:message] = "Game added to Collection"
        redirect '/games'
    end

    get "/games/edit/:id" do 
        @game = Game.find_by_id(params[:id])
        if logged_in?
            @user = current_user
            erb :'/games/edit'
        else 
            flash[:alert] = "You must be logged in to view that page"
            redirect '/login'
        end 

    end

    patch "/games/edit/:id" do 
        if params[:game][:name].empty?
            flash[:alert] = "Name field cannot be left blank"
            redirect "/games/edit/#{params[:id]}"
        end
        game = Game.find_by_id(params[:id])
        game.update_attributes(params[:game])
        flash[:message] = "Game updated successfully"
        redirect '/games'
    end

    get "/games/edit/:id/delete" do 
        @game = Game.find_by_id(params[:id])
        if logged_in?
            erb :'/games/delete' 
        else 
        flash[:alert] = "You must be logged in to view that page"
        redirect '/login'
        end
    end

    delete "/games/edit/:id/delete" do 
        game = Game.find_by_id(params[:id])
        user = current_user
        usergame = UserGame.find_by(:user_id => user.id, :game_id => game.id)
        usergame.delete
        flash[:message] = "Game removed from Collection"
        redirect "/games"
    end

    get "/games/all" do 
        @games = Game.order(:name)
        if logged_in?
            @user = current_user
            erb :'/games/all' 
        else 
        flash[:alert] = "You must be logged in to view that page"
        redirect '/login'
        end
    end

    get "/games/wishlist" do 
        @games = Game.order(:name)
        if logged_in?
            @user = current_user
            erb :'/games/wishlist' 
        else 
        flash[:alert] = "You must be logged in to view that page"
        redirect '/login'
        end
    end

    post "/games/wishlist/:id" do 
        user = current_user
        if !user.wishlist
            wishlist = Wishlist.new
            wishlist.user = user
            wishlist.save
        end
        game = Game.find_by_id(params[:id])
        wishlist = user.wishlist
        wishlist.games << game 
        wishlist.save
        flash[:message] = "Game added to Wishlist"
        redirect "/games/all"
    end

    delete "/games/wishlist/:id/delete" do 
        user = current_user
        wishlist = user.wishlist
        wishlist_game = WishlistGame.find_by(:wishlist_id => wishlist.id, :game_id => params[:id])
        wishlist_game.delete
        flash[:message] = "Game removed from Wishlist"
        redirect "/games/wishlist"
    end

    get "/games/friends" do 
        if logged_in?
            @user = current_user
            @users = User.all 
            erb :'/games/friends' 
        else 
        flash[:alert] = "You must be logged in to view that page"
        redirect '/login'
        end
    end

    get "/games/friends/:id" do 
        if logged_in?
            @user = current_user
            if @user.id == params[:id]
                redirect "/games"
            end
            @friend = User.find_by_id(params[:id])
            @games = @friend.games.order(:name)
            erb :'/games/friend' 
        else 
        flash[:alert] = "You must be logged in to view that page"
        redirect '/login'
        end
    end

    post "/games/friends/:fid/:id" do 
        user = current_user
        game = Game.find_by_id(params[:id])
        wishlist = user.wishlist
        wishlist.games << game 
        wishlist.save
        flash[:message] = "Game added to Wishlist"
        redirect "/games/friends/#{params[:fid]}"
    end
end