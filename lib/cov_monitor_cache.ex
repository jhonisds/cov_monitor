defmodule CovMonitor.Cache do
  @moduledoc """
    Module responsible to implement GenServer
  """
  use GenServer

  def init(_init_arg) do
    # IO.inspect("init GenServer")
    {:ok, %{}}
  end

  def handle_call({:get, country}, _from, state) do
    {:reply, state[country], state}
  end

  def handle_cast({:put, {country, data_covid}}, state) do
    {:noreply, Map.put(state, country, data_covid)}
  end

  # API client

  def start_link(default) do
    GenServer.start_link(__MODULE__, default, name: __MODULE__)
  end

  def put(country, data_covid) do
    GenServer.cast(__MODULE__, {:put, {country, data_covid}})
  end

  def get(country) do
    GenServer.call(__MODULE__, {:get, country})
  end
end
