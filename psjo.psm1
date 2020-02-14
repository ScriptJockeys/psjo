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

    $h = [ordered]@{ }
    foreach ($item in $args) {
        $k, $v = $item.split('=')
        if ($v -is [string]) {
            try {
                $v = ConvertFrom-Json $v
            }
            catch { }
        }
        $h.$k = $v
    }
    ConvertTo-Json $h -Depth 5
}