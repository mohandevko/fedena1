class InvitesController < ApplicationController

  def invite_friends
  end

  def import

      begin
        @sites = {"hotmail" => Contacts::Hotmail, "gmail"  => Contacts::Gmail, "yahoo" => Contacts::Yahoo}
        @contacts = @sites[params[:from]].new(params[:login], params[:password]).contacts
        @users , @no_users = [], []
        @contacts.each do |contact|
          if u = User.find(:first, :conditions => "email = '{contact[1]}'" )
            @users << u
          else
            @no_users << {:name => contact[0] , :email => contact[1]}
          end
        end
      end
  end
  
  def invite
    puts "==================="
    puts params.inspect
    puts "==================="
    a = params[:email]
    a.each do |i|
      invitation = Invitation.new
      invitation.user_id = current_user.id
      invitation.email = i
      invitation.save
    end
    redirect_to invite_friends_path
  end
  
end
