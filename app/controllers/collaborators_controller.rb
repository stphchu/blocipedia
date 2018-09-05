class CollaboratorsController < ApplicationController

#NEW
   def new
     @collaborator = Collaborator.new
   end

#CREATE
   def create
     @wiki = Wiki.find(params[:wiki_id])
     @user = User.find_by_email(params[:collaborator])

     if @wiki.collaborators.exists?(user_id: @user.id)
        flash[:alert] = "#{@user.email} is already a collaborator."
        redirect_to edit_wiki_path(@wiki)
     else @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: @user.id)
       if @user.email == current_user.email
         flash[:alert] = "You are already the owner of this page."
         redirect_to edit_wiki_path(@wiki) 
       elsif @collaborator.save
         flash[:notice] = "#{@user.email} was added as a collaborator."
         redirect_to edit_wiki_path(@wiki)
       else
         flash[:alert] = "There was an error adding this collaborator. Please try again."
         redirect_to edit_wiki_path(@wiki)
       end
     end
   p @collaborators
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
