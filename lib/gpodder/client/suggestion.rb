module Gpodder
  class Client
    def suggestions(count)
      return false unless logged_in?
      get("/suggestions/#{count}.json")
    end
  end
end