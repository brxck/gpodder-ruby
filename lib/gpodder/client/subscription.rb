module Gpodder
  class Client
    def device_subscriptions(deviceid)
      return false unless logged_in?
      get("/subscriptions/#{@username}/#{deviceid}.json")
    end

    def subscriptions
      return false unless logged_in?
      get("/subscriptions/#{@username}.json")
    end

    def upload_device_subscriptions(data, format, deviceid)
      return false unless logged_in?
      put("/subscriptions/#{@username}/#{deviceid}.#{format}",
          body: data)
    end

    def upload_subscription_changes(data, deviceid)
      return false unless logged_in?
      post("/api/2/subscriptions/#{@username}/#{deviceid}")
    end
  end
end