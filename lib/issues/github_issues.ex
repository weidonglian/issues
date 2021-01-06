defmodule Issues.GithubIssues do
  @moduledoc false

  @user_agent {"User-agent", "Elixir demo"}

  def fetch(user, project) do
    issues_url(user, project) |> HTTPoison.get!([@user_agent]) |> handle_response
  end

  def issues_url(user, project), do: "https://api.github.com/repos/#{user}/#{project}/issues"
  def handle_response(%HTTPoison.Response{body: body}), do: Poison.decode(body)
end
