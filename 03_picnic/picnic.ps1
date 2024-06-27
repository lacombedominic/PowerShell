# accepts an array of strings as input

param (
    [Parameter(Mandatory=$true)]
    [string[]]$items
)

# This function formats the list of items based on the number of items
# If there are no items, it returns "No items". If there is one item, it returns that single item. 
# If there are two items, it joins them with "and".
# If there are more than two items, it joins all items except the last one with commas and then adds "and" before the last item.
function Format-Items {
    param (
        [string[]]$items
    )

    switch ($items.Count) {
        0 { return "No items" }
        1 { return $items[0] }
        2 { return "$($items[0]) and $($items[1])" }
        default {
            $allButLast = $items[0..($items.Count - 2)]
            $lastItem = $items[-1]
            return "$($allButLast -join ', '), and $lastItem"
        }
    }
}

$formattedItems = Format-Items -items $items
Write-Host "We're taking $formattedItems on our picnic."
