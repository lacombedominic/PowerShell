param (
    [Parameter(Mandatory=$true)]
    [string]$filePath
)

function Convert-ToUpperCase {
    param (
        [string]$text
    )
    return $text.ToUpper()
}

# Check if the file exists
if (Test-Path -Path $filePath) {
    try {
        # Read the content of the file
        $fileContent = Get-Content -Path $filePath -Raw

        # Convert the content to uppercase
        $uppercasedContent = Convert-ToUpperCase -text $fileContent

        # Output the uppercased content
        Write-Host $uppercasedContent
    } catch {
        Write-Host "Failed to read the file. Please ensure the file path is correct and accessible."
    }
} else {
    Write-Host "The specified file does not exist. Please provide a valid file path."
}







