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

``ps
PS C:\> psjo name=Jane
```

```powershell
{"name":"Jane"}
```