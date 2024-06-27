function Convert-PhoneNumber {
    param (
        [string]$inputString
    )

    # Define the mapping for the "jump the five" algorithm
    $keypadMapping = @{
        '1' = '9'
        '2' = '8'
        '3' = '7'
        '4' = '6'
        '5' = '0'
        '6' = '4'
        '7' = '3'
        '8' = '2'
        '9' = '1'
        '0' = '5'
    }

    # Convert the input string to an array of characters
    $encodedChars = $inputString.ToCharArray() | ForEach-Object {
        # Check if the character exists in the mapping
        if ($keypadMapping.ContainsKey($_)) {
            # If yes, replace with the mapped value
            $keypadMapping[$_]
        } else {
            # Otherwise, keep the original character
            $_
        }
    }

    # Join the array of characters back into a string
    $encodedString = -join $encodedChars
    return $encodedString
}

# Example usage:
$inputString = "1-800-555-1234"
$encodedString = Convert-PhoneNumber -inputString $inputString
Write-Host "Encoded phone number: $encodedString"
