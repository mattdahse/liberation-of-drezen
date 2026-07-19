# Builds data.js (the site's search index) from the markdown in ./source
# Usage:  powershell -ExecutionPolicy Bypass -File build.ps1
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$srcdir = Join-Path $root 'source'
$utf8 = New-Object System.Text.UTF8Encoding($false)

# Source files in reading order, with their display book titles.
$books = @(
  @{ file = 'book-1-the-road-to-drezen.md';      title = 'Book I - The Road to Drezen';       book = 'I'  },
  @{ file = 'book-2-the-liberation-of-drezen.md'; title = 'Book II - The Liberation of Drezen'; book = 'II' }
)

$all = New-Object System.Collections.ArrayList
$order = 0
foreach ($b in $books) {
  $path = Join-Path $srcdir $b.file
  if (-not (Test-Path $path)) { throw "Missing source file: $path" }
  $lines = ([System.IO.File]::ReadAllText($path)) -split "`r?`n"
  $idx = @()
  for ($i = 0; $i -lt $lines.Count; $i++) { if ($lines[$i] -match '^##\s+\S') { $idx += $i } }
  for ($j = 0; $j -lt $idx.Count; $j++) {
    $start = $idx[$j]
    $end = if ($j + 1 -lt $idx.Count) { $idx[$j + 1] - 1 } else { $lines.Count - 1 }
    $block = $lines[$start..$end]
    $title = ($lines[$start] -replace '^##\s*', '' -replace '\*\*', '').Trim()
    # fathom recording ids from the <!-- fathom: a,b --> comment
    $fathom = @()
    $sub = ''
    foreach ($l in $block) {
      $t = $l.Trim()
      if ($t -match '^<!--\s*fathom:\s*(.+?)\s*-->$') { $fathom = ($matches[1] -split '\s*,\s*') }
      elseif ($sub -eq '' -and $t -match '^\*.+\*$') { $sub = $t.Trim('*').Trim() }
    }
    # md with the fathom comment stripped, for rendering
    $md = (($block | Where-Object { $_ -notmatch '^\s*<!--\s*fathom:' }) -join "`n").Trim()
    $text = $md -replace '\[(.*?)\]\((.*?)\)', '$1' -replace '[#>*`_]', ' ' -replace '\s+', ' '
    $order++
    [void]$all.Add([pscustomobject]@{
      id = "ch$order"; order = $order; book = $b.book; bookTitle = $b.title
      title = $title; subtitle = $sub; fathom = @($fathom); md = $md; text = $text.Trim()
    })
  }
}

$json = ConvertTo-Json @($all) -Depth 6 -Compress
[System.IO.File]::WriteAllText((Join-Path $root 'data.js'), "window.CHAPTERS = $json;", $utf8)
Write-Host ("Built data.js: {0} chapters ({1})" -f $all.Count, (($all | Group-Object book | ForEach-Object { '{0}={1}' -f $_.Name, $_.Count }) -join ', '))