defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    words = String.split(sentence, [" ", "_"])

    Enum.reduce words, %{}, fn word, acc ->
      update_count(acc, word)
    end
  end

  defp update_count(map, word) do
    count = map[word]

    if is_nil(count) do
      Map.put(map, word, 1)
    else
      Map.put(map, word, count + 1)
    end
  end
end
