0..1 |> Enum.each(fn _ ->
  get("/4k.html",[{"Header", "Accept-Language: en-us,Accept-Encoding: gzip, deflate, compress,X-EBAY-API-APP-ID:958w4784w59w85"}])
  delay(10, 0.1)
end)