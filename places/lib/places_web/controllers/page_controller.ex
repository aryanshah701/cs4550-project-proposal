defmodule PlacesWeb.PageController do
  use PlacesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def search(conn, %{"search" => search_query}) do
    lat = "42.3601"
    lng = "-71.0589"
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&rankby=distance&name=#{search_query}&types=cafe&key=AIzaSyBPJQF7VI-_AM85UZyiBrzI8GL3U5wQcF8"
  
    resp = HTTPoison.get!(url)
    data = Jason.decode!(resp.body)

    render(conn, "index.html", data: data["results"])
  end
end
