defmodule GenserverStack.Impl do
  def push(stack, elem) do
    stack ++ [elem]
  end

  def pop(stack) do
    if length(stack) == 0 do
      {"Stack is empty!", []}
    else
      if length(stack) == 1 do
        {List.last(stack), []}
      else
        {List.last(stack), Enum.reverse(stack) |> tl |> Enum.reverse}
      end
    end
  end
end
