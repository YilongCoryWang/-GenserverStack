defmodule GenserverStack.Server do
  use GenServer

  alias GenserverStack.Impl

  def init(init_stack) do
    {:ok, init_stack}
  end

  def handle_cast({:push, elem}, stack) do
    {:noreply, Impl.push(stack, elem)}
  end

  def handle_call(:pop, _from, stack) do
    {popped, rest} = Impl.pop(stack)
    {:reply, popped, rest}
  end

  def handle_call(:print, _from, stack) do
    {:reply, stack, stack}
  end
end
