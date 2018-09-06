class CollaboratorsController < ApplicationController

#NEW
   def new
     @collaborator = Collaborator.new
   end

#CREATE
   def create
     @wiki = Wiki.find(params[:wiki_id])
     @user = User.find_by_email(params[:collaborator])

     if @user
        @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: @user.id)
        if @collaborator.save
            flash[:notice] = "#{@user.email} was added as a collaborator."
            redirect_to edit_wiki_path(@wiki)
        else
            flash[:alert] = "There was an error adding this collaborator. Please try again."
            redirect_to edit_wiki_path(@wiki)
        end
      else
        flash[:alert] = "User not found"
        redirect_to edit_wiki_path(@wiki)
      end   
    end

#DESTROY
  def destroy
     @wiki = Wiki.find(params[:wiki_id])
     @collaborator = Collaborator.find(params[:id])
     @collaborator_user = User.find(@collaborator.user_id)

     if @collaborator.destroy
       flash[:notice] = "#{@collaborator_user.email} was removed as a collaborator."
       redirect_to edit_wiki_path(@wiki)
     else
       flash[:alert] = "There was an error removing this collaborator. Please try again."
       redirect_to edit_wiki_path(@wiki)
     end    
  end
end
