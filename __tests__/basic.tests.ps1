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

    It "Should handle deep nesting" {
        $actual = ConvertFrom-Json (psjo glossary=$(
            psjo title="example glossary" GlossDiv=$(
                psjo title=S GlossEntry=$(
                    psjo ID=SGML SortAs=SGML GlossTerm='Standard Generalized Markup Language' Acronym=SGML Abbrev='ISO 8879:1986' GlossDef=$(
                        psjo para='A meta-markup language, used to create markup languages such as DocBook.'
                    ) GlossSee=markup
                )
            )
        ))

        $actual.glossary.Glossdiv.GlossEntry.GlossDef.para | should be 'A meta-markup language, used to create markup languages such as DocBook.'
    }
}