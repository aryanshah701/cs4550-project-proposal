defmodule PlacesWeb.PageController do
  use PlacesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", data: nil)
  end

  def search(conn, %{"search" => search_query}) do
    key = Application.fetch_env!(:external_service, :api_key)
    lat = "42.3601"
    lng = "-71.0589"
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
    <> "location=#{lat},#{lng}&rankby=distance&name=#{search_query}&"
    <> "types=cafe&key=#{key}"
  
    resp = HTTPoison.get!(url)
    data = Jason.decode!(resp.body)

    render(conn, "index.html", data: data["results"])
  end
end
