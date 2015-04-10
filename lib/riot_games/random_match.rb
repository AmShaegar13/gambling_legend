require 'net/http'

module RiotGames
  class RandomMatch
    URL = "https://euw.api.pvp.net/api/lol/euw/v4.1/game/ids?beginDate={time}&api_key=#{Rails.application.secrets.riot_api_key}"

    attr_reader :ids

    def initialize(time = Time.now)
      sec = time.to_i

      # round to a multiple of 5 minutes
      sec -= sec % 300

      res = nil
      loop do
        res = request_ids(sec)
        break if res.code == '200'

        # try previous 5-minute bucket
        if res.code == '404'
          sec -= 300
          next
        end

        # report error
        message = JSON.parse(res.body)['status']['message'] rescue res.message
        raise "Getting match id failed with status #{res.code}: #{message}"
      end

      @ids = JSON.parse(res.body)
    end

    delegate :pop, to: :ids

    private

    def request_ids(sec)
      url = URI.parse(URL.sub('{time}', sec.to_s))
      req = Net::HTTP::Get.new(url.to_s)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      http.request(req)
    end
  end
end
