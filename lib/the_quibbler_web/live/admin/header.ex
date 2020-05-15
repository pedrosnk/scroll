defmodule TheQuibblerWeb.AdminLive.Header do
  use TheQuibblerWeb, :live_component

  def render(assigns) do
    ~L"""
    <header class="container-full">
      <div class='navbar'>
        <ul>
          <li><a class="active" href="#home">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#contact">Contact</a></li>
        </ul>
      </div><Paste>
    </header>
    """
  end
end
