defmodule CovMonitor.Cache.Behavior do
  @moduledoc """
    This module is responsable for define behavior from Cache module
  """
  @callback put(String.t(), %{}) :: :ok
  @callback get(String.t()) :: {:ok, %{}} | {:ok, nil}
end
