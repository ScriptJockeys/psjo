Import-Module ..\psjo.psd1 -Force

Describe "Tests psjo" {
    It "Should be true" {
        $actual = psjo name=Jane
        $expected = @'
{
    "name":  "Jane"
}
'@
        $actual | should beexactly $expected
    }

    It "Should handle nulls" {
        $actual = ConvertFrom-Json (psjo name=Jane b=1 c)

        $actual.psobject.properties.name.count | should be 3
        $actual.name | should be 'Jane'
        $actual.b | should be 1
        $actual.c | should be $null
    }

    It "Should handle nested data" {
        $actual = ConvertFrom-Json (psjo point=$(psjo x=10 y=20))

        $actual.point.x | should be 10
    }
}