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
}