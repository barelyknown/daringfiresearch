class Blekko
  class << self
    attr_accessor :my_account
    def my_account
      @blekko ||= Blekko.new(
        username: ENV['BLEKKO_USERNAME'],
        password: ENV['BLEKKO_PASSWORD'],
        api_key: ENV['BLEKKO_API_KEY']
      )
    end
  end
end