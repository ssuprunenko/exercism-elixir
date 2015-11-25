defmodule Teenager do
  def hey(input) do
    cond do
      silence?(input)  -> "Fine. Be that way!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true             -> "Whatever."
    end
  end

  defp silence?(input), do: String.strip(input) == ""

  defp question?(input), do: String.ends_with?(input, "?")

  defp shouting?(input) do
    String.downcase(input) != input and String.upcase(input) == input
  end
end
