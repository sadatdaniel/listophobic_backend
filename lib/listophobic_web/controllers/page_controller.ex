defmodule ListophobicWeb.PageController do
  use ListophobicWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
