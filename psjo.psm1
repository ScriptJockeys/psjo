function psjo {
    <#
        .Example
        psjo name=Jane
        {"name":"Jane"}
    #>
    $h = [ordered]@{ }

    foreach ($item in $args) {
        $k, $v = $item.split('=')
        $h.$k = $v
    }

    ConvertTo-Json $h
}