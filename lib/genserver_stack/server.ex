defmodule GenserverStack.Server do
  use GenServer

  alias GenserverStack
  alias GenserverStack.Impl

  @ten_sec 10 * 1000

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

  def handle_info(:process_schedule, stack) do
    new_state =
    if (length(stack) < 6) do
      IO.inspect length(stack)*10, label: "Seconds elaspsed"
      schedule_process()
      stack
    else
      IO.inspect "1 Minute!"
      schedule_process()
      []
    end
    GenserverStack.push(1)#for next 10 sec
    {:noreply, new_state}
  end

  def schedule_process do
    Process.send_after(self(), :process_schedule, @ten_sec)
  end

  def schedule_process(pid) do
    Process.send_after(pid, :process_schedule, @ten_sec)
  end
end
