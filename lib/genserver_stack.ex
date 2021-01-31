defmodule GenserverStack do
  @moduledoc """
  Documentation for `GenserverStack`.
  """

  @doc """
  Start stack.

  ## Examples

      iex> GenserverStack.start_link([1])
      :ok

  """
  @server GenserverStack.Server

  def start do
    GenServer.start_link(@server, [], name: @server)
  end

  def push(elem) do
    GenServer.cast(@server, {:push, elem})
  end

  def pop() do
    GenServer.call(@server, :pop)
  end

  def print() do
    GenServer.call(@server, :print)
  end

  def stop() do
    GenServer.stop(@server)
  end
end
