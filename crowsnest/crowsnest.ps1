# Function to determine if the user input starts with a vowel
function Test-StartsWithVowel($word) {
    return $word -match '^[aeiouAEIOU]'
}

# Prompt the user input
$object = Read-Host "What do you see off the larboard bow"

# Determine the correct article to use
if (Test-StartsWithVowel $object) {
    $article = "an"
} else {
    $article = "a"
}

# Announce the appearance to the captain
Write-Host "Captain, $article $object off the larboard bow!"

