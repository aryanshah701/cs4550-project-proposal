defmodule GoStudyWeb.PageController do
  use GoStudyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
