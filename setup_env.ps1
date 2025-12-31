# Set Flutter Path
$env:PATH += ";C:\Users\thai1\flutter\bin"

# Set JAVA_HOME (Found from your logs)
$env:JAVA_HOME = "D:\android\jbr"

# Add Java to Path
$env:PATH += ";$env:JAVA_HOME\bin"

Write-Host "✅ Environment Variables Configured for this session."
Write-Host "   - Flutter: $(Get-Command flutter | Select-Object -ExpandProperty Source)"
Write-Host "   - JAVA_HOME: $env:JAVA_HOME"
Write-Host "You can now run 'flutter run' in this terminal."
