# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the search page$/
      '/search'
    when /^the profile page$/
      "/profile/2"
    when /^the first user's profile page$/
      "/profile/1"
    when /^the edit page$/
      "/profile/"+User.find_by_email("admin@tamu.edu")['id'].to_s+"/edit"
    when /^the admin page$/
    '/admin/main'
    when /^the invite page$/
      "/request_invite"
    when /^the forgot password page$/
      "/forgot_password"
    when /^sign_out$/
      "/sign_out"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
