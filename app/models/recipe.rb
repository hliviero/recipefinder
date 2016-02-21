class Recipe
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY'] = "9967e3b420584cbed1b73d16b0e5346d"
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params fields: "count,recipes", key: key_value
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end

end
