defmodule CovMonitor.Http do
  @moduledoc """
    Module for behavior
  """
  @callback cases_by(String.t()) :: {:ok, [%{}]} | {:error, String.t()}
end
