0..100 |> Enum.each(fn _ ->
  get("/4k.html", [{"Header", "x-Spirent-Id: 00-00-00-00-00-00 03704600"}])
  delay(900, 0.1)
end)
