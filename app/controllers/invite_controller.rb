class InviteController < ApplicationController

  def invite_friends
    @user = User.find(current_user.id)
    #Pass the params of user id, can be the current user id also.for eg, invite/invite_friends/1
    #It does not have impact of fetching the contacts from gmail, yahoo or hotmail.
  end
  
  def import
    @users = User.find(params[:id])
    begin
      @sites = {“facebook”  => Contacts::Facebook }
      @contacts = @sites[params[:from]].new(params[:login], params[:password]).contacts
      @users , @no_users = [], []
      @contacts.each do |contact|
        if u = User.find(:first , :conditions => email = "mohandev.ko@gmail.com" )
          @users << u
        else
          @no_users << {:name => contact[0] , :email => contact[1]}
        end
      end
      respond_to do |format|
        format.html {render :template => ‘invite/_contact_list’, :layout => false}
        format.xml {render :xml => @contacts.to_xml}
      end
    end
  end

end
