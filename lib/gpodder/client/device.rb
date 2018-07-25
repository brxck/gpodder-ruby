module Gpodder
  class Client
    def update_device(deviceid, caption, type)
      return false unless logged_in?
      post("/api/2/devices/#{@username}/#{deviceid}.json",
           caption: caption,
           type: type)
    end

    def devices
      return false unless logged_in?
      post("/api/2/devices/#{@username}.json")
    end

    def device_updates(deviceid)
      return false unless logged_in?
      get("/api/2/updates/#{@username}/#{deviceid}")
    end
  end
end
