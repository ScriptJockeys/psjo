# psjo

JSON output from PowerShell.

Modelled after https://github.com/jpmens/jo

One way in attempting to get PowerShell scripts to produce valid JSON. You’ve likely seen something like this before:

```powershell
'{"name":"Jane"}'
```

Another way

```ps
PS C:\> ConvertTo-Json @{name='Jane'}
```

```powershell
'{"name":"Jane"}'
```

## Enter psjo

```ps
PS C:\> psjo name=Jane
```

```powershell
{"name":"Jane"}
```

```ps
PS C:\> psjo name=Jane b=1 c d=$(get-date) e=$($env:ComSpec)
```

```powershell
{
    "name":  "Jane",
    "b":  "1",
    "c":  null,
    "d":  "02/13/2020 18:49:44",
    "e":  "C:\\WINDOWS\\system32\\cmd.exe"
}
```