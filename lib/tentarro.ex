defmodule Tentarro do
  @moduledoc """
  Tentarro main module
  """

  @doc """
  Tentarro main module
  """

  defp read_netrc() do
    # fixme: get the pwd cred from netrc.
    home = (System.get_env("HOME"))
    {:ok, body} = File.read "#{home}/.netrc"
    ["MalloZup", 'MYPWD']
  end
  
  def no_opt do
    IO.puts 'NO OPTION'
  end

  def branches(repo) do 
    listbranches('SUSE', 'spacewalk')
  end

  defp listbranches(owner, repo) do
    conf = read_netrc() 
    client = Tentacat.Client.new(%{user: Enum.fetch!(conf, 0), 
                        password: Enum.fetch!(conf, 1 ) } )
    IO.inspect Tentacat.Repositories.Branches.list owner, repo, client
  end

end

defmodule Tentarro.CLI do
  @moduledoc """
  Tentarro command line client
  """
  def main(args \\ []) do
    args
    |> parse_args
    |> response
  end

  defp parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [repo: :boolean])

    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    if opts[:repo], do: Tentarro.branches(word), else: Tentarro.no_opt
  end
end
