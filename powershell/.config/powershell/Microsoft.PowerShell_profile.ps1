function aws-mfa {
    $processArgs = @("--profile", "default") + $args
    Write-Host "Using aws-mfa override from $PSCommandpath, passing through command as 'aws-mfa $processArgs'"
    Start-Process -FilePath "aws-mfa" -ArgumentList $processArgs -Wait
}
function aws-mfa {
    $processArgs = @("--profile", "default") + $args
    Write-Host "Using aws-mfa override from $PSCommandpath, passing through command as 'aws-mfa $processArgs'"
    Start-Process -FilePath "aws-mfa" -ArgumentList $processArgs -Wait
}

# Starship prompt
Invoke-Expression (&starship init powershell)
