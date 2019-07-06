payload = payload(1400)
0..1000000000000 |> Enum.each(fn _ ->
  send(payload)
  delay(100, 0.1)
end)