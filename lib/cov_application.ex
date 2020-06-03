defmodule CovApplication do
  @moduledoc """
    Define module application
  """
  use Application
  alias CovMonitor.Cache

  @impl true
  def start(_type, _arg) do
    Cache.start_link(%{})
  end
end
