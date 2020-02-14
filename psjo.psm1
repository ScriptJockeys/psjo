function psjo {
    <#
        .Example
        psjo name=Jane
        {"name":"Jane"}

        .Example
        psjo point=$(psjo x=10 y=20)

        {
            "point":  {
                        "x":  10,
                        "y":  20
                    }
        }
    #>

    $dict = [ordered]@{ }
    foreach ($item in $args) {
        $key, $value = $item.split('=')
        try { $value = ConvertFrom-Json $value } catch { }
        $dict.$key = $value
    }
    ConvertTo-Json $dict -Depth 5
}